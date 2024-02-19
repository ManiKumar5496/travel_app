import 'package:travel_app/features/trip/domain/entities/trip.dart';

abstract class TripRepository {
  Future<List<Trip>> getTrips();
  Future<void> addTrips(Trip trip);
  Future<void> deleteTrips(int index);
}
