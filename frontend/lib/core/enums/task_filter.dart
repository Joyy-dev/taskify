enum TaskFilter {
  all('All'),
  progress('In Progress'),
  due('Due Soon'),
  upcoming('Upcoming'),
  completed('Completed');

  final String text;
  const TaskFilter(this.text);
}