import 'package:travel_app/features/trip/domain/repositories/trip_repository.dart';

class AddTrips {
  final TripRepository repository;

  AddTrips(this.repository);

  Future<void> call(trip) {
    return repository.addTrips(trip);
  }
}
