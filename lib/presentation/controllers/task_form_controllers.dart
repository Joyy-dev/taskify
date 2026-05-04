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
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), 
      lastDate: DateTime(2030)
    );

    if (pickedDate != null) {
      dueDateController.text = 
      '${pickedDate.day.toString().padLeft(2, '0')}/'
      '${pickedDate.month.toString().padLeft(2, '0')}/'
      '${pickedDate.year}';    
    }
  }

  void saveTask() {
    final task = TaskModel(
      id: 'T1', 
      title: taskNameController.text, 
      category: selectedCategory.value, 
      description: descriptionController.text, 
      dueDate: dueDateController.text, 
      priority: selectedPriority.value ?? PriorityLevels.low,
    );
    taskControllers.addTask(task);
    taskControllers.saveAndClose();
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
    taskControllers.saveAndClose();
    Get.snackbar(
      'Delete Task',
      'You have successfully deleted your task',
      snackPosition: SnackPosition.TOP
    );
    clearForm();
    
  }
}