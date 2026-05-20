import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/core/enums/category.dart';
import 'package:taskify/core/enums/priority_levels.dart';
import 'package:taskify/core/services/notification_service.dart';
import 'package:taskify/data/task_model.dart';
import 'package:taskify/presentation/controllers/task_controllers.dart';
import 'package:uuid/uuid.dart';

class TaskFormControllers extends GetxController{
  final taskNameController = TextEditingController();
  final dueDateController = TextEditingController();
  final dueTimeController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var selectedCategory = Category.work.obs;
  var selectedPriority = Rxn<PriorityLevels>();
  var selectedDate = Rxn<DateTime>();
  var selectedTime = Rxn<TimeOfDay>();
  final TaskControllers taskControllers = Get.find();
  final selectedTask = Rxn<TaskModel>();
  TaskModel? editingTask;

  void setCategory(Category value) {
    selectedCategory.value = value;
  }

  void setPriority(PriorityLevels level) {
    selectedPriority.value = level;
  }

  Future<void> datePicker(BuildContext context) async {

    DateTime? pickedDate = await showDatePicker(
      context: context, 
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000), 
      lastDate: DateTime(2030)
    );

    if (pickedDate != null) {
      selectedDate.value = pickedDate;

      dueDateController.text = 
      '${pickedDate.day.toString().padLeft(2, '0')}/'
      '${pickedDate.month.toString().padLeft(2, '0')}/'
      '${pickedDate.year}';    
    }
  }

  Future<void> selectReminderTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context, 
      initialTime: selectedTime.value ?? TimeOfDay.now()
    );

    if (!context.mounted) return;

    if (pickedTime != null) {
      selectedTime.value = pickedTime;
      //selectedTask.value!.reminderTime = pickedTime;
      //selectedTask.refresh();
      
      dueTimeController.text = pickedTime.format(context);
      taskControllers.saveTask();
    }
  }


  Future<void> saveOrUpdateTask() async {
    final uuid = Uuid();
    if (!formKey.currentState!.validate()) return;
    if (selectedDate.value == null) {
      Get.snackbar(
        'Missing Date', 
        'Please select a due date',
        snackPosition: SnackPosition.TOP
      );
      return;
    }
    if (selectedTime.value == null) {
      Get.snackbar(
        'Missing Due Time', 
        'Please select a task due time',
        snackPosition: SnackPosition.TOP
      );
      return;
    }

    final task = TaskModel(
      id: editingTask?.id ?? uuid.v4(), 
      taskTitle: taskNameController.text, 
      category: selectedCategory.value, 
      description: descriptionController.text, 
      dueDate: selectedDate.value ?? DateTime.now(), 
      priority: selectedPriority.value ?? PriorityLevels.low,
      reminderTime: selectedTime.value!
    );
    if (editingTask == null) {
      taskControllers.addTask(task);
      clearForm();
      Get.back();
      Get.snackbar(
        'Success', 
        'Task Added successfully',
        snackPosition: SnackPosition.TOP
      );
    } else {
      taskControllers.updateTask(task);
      clearForm();
      Get.back();
      Get.snackbar(
        'Updated', 
        'Task updated successfully',
        snackPosition: SnackPosition.TOP
      );
    }

    final reminderDate = combineDateAndTime();
    await NotificationService.scheduleNotification(
      id: task.id, 
      title: task.taskTitle, 
      body: 'Task reminder: ${task.description}', 
      scheduleDate: reminderDate
    );
  }

  void clearForm() {
    taskNameController.clear();
    descriptionController.clear();
    dueDateController.clear();
    dueTimeController.clear();
    selectedPriority.value = null;
    selectedCategory.value = Category.work;
    selectedDate.value = null;
    selectedTime.value = null;
    editingTask = null;
  }

  @override
  void onClose() {
    taskNameController.dispose();
    dueDateController.dispose();
    descriptionController.dispose();
    dueTimeController.dispose();
    super.onClose();
  }

  void onCancel() {
    Get.back();
    Get.snackbar(
      'Cancelled',
      'Task creation cancelled',
      snackPosition: SnackPosition.TOP
    );
    clearForm();
  }

  void initializeTask(TaskModel? task, BuildContext context) {
    if (task == null) return;

    editingTask = task;
    taskNameController.text = task.taskTitle;
    descriptionController.text = task.description;
    selectedCategory.value = task.category;
    selectedPriority.value = task.priority;
    selectedDate.value = task.dueDate;
    selectedTime.value = task.reminderTime;
    dueDateController.text = '${task.dueDate.day.toString().padLeft(2, '0')}/'
    '${task.dueDate.month.toString().padLeft(2, '0')}/'
    '${task.dueDate.year}'; 
    dueTimeController.text = task.reminderTime.format(context);
  }

  DateTime combineDateAndTime() {
    final date = selectedDate.value!;
    final time = selectedTime.value!;

    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute
    );
  }
}