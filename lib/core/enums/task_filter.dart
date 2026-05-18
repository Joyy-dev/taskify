enum TaskFilter {
  all('All'),
  progress('In Progress'),
  due('Due Date'),
  upcoming('Upcoming'),
  completed('completed');

  final String text;
  const TaskFilter(this.text);
}