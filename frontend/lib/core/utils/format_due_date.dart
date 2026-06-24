String formatDueDate(DateTime dueDate) {
  final now = DateTime.now();

  final difference = dueDate.difference(now);

  if (difference.inHours < 1) {
    return 'Due soon';
  }
  if (difference.inHours < 24) {
    return 'Due in ${difference.inHours}hrs';
  }
  if (difference.inDays == 1) {
    return 'Due tomorrow';
  }
  return 'Due in ${difference.inDays} days';
}