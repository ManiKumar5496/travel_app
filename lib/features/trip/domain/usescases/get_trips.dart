// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/domain/repositories/trip_repository.dart';

class GetTrips {
  final TripRepository repository;
  GetTrips(
    this.repository,
  );

  Future<List<Trip>> call() {
    return repository.getTrips();
  }
}
