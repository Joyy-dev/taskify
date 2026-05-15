enum TaskTime {
  progress('In Progress'),
  due('Due Date'),
  upcoming('Upcoming'),
  completed('completed');

  final String text;
  const TaskTime(this.text);
}