import 'package:hive/hive.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<String> photos;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String locattion;
  TripModel({
    required this.title,
    required this.photos,
    required this.date,
    required this.description,
    required this.locattion,
  });
  factory TripModel.fromEntity(Trip trip) => TripModel(
      title: trip.title,
      photos: trip.photos,
      description: trip.description,
      date: trip.date,
      locattion: trip.locattion);

  Trip toEntity() => Trip(title: title, photos: photos, date: date, description: description, locattion: locattion);
}
