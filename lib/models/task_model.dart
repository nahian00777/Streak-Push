class Task {
  final int id;
  final String name;
  final String icon;
  final List<int> freq;
  final String reminderTime;
  final String dateCreated;
  final int streak;
  final int isCompleted;

  Task({
    required this.id,
    required this.name,
    required this.icon,
    required this.freq,
    required this.reminderTime,
    required this.streak,
    required this.isCompleted,
    required this.dateCreated,
  });
}
