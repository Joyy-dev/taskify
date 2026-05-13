import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/core/enums/priority_levels.dart';
import 'package:taskify/data/task_model.dart';
import 'package:taskify/presentation/controllers/task_controllers.dart';

class TaskFormControllers extends GetxController{
  final taskNameController = TextEditingController();
  final dueDateController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var selectedCategory = 'Work'.obs;
  var selectedPriority = Rxn<PriorityLevels>();
  var selectedDate = Rxn<DateTime>();
  final TaskControllers taskControllers = Get.find();

  void setCategory(String value) {
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

  void saveTask() {
    if (!formKey.currentState!.validate()) return;

    final task = TaskModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(), 
      taskTitle: taskNameController.text, 
      category: selectedCategory.value, 
      description: descriptionController.text, 
      dueDate: selectedDate.value ?? DateTime.now(), 
      priority: selectedPriority.value ?? PriorityLevels.low,
      reminderTime: TimeOfDay.now()
    );
    taskControllers.addTask(task);
    Get.back();
    Get.snackbar(
      'Success', 
      'Task Added successfully',
      snackPosition: SnackPosition.TOP
    );
    clearForm();           
  }

  void clearForm() {
    taskNameController.clear();
    descriptionController.clear();
    dueDateController.clear();
    selectedPriority.value = null;
    selectedCategory.value = 'Work';
    selectedDate.value = null;
  }

  @override
  void onClose() {
    taskNameController.dispose();
    dueDateController.dispose();
    descriptionController.dispose();
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
}