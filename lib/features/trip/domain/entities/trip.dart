// ignore_for_file: public_member_api_docs, sort_constructors_first
class Trip {
  final String title;
  final List<String> photos;
  final DateTime date;
  final String description;
  final String locattion;
  Trip({
    required this.title,
    required this.photos,
    required this.date,
    required this.description,
    required this.locattion,
  });
}
