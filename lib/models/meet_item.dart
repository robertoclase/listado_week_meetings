class MeetItem {
  final String title;
  final String date;
  final String hours;
  final String type;
  final String link;
  bool done;

  MeetItem({
    required this.title,
    required this.date,
    required this.hours,
    required this.type,
    required this.link,
    this.done = false,
  });
}
