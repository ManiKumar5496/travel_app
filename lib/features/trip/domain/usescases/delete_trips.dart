import 'package:travel_app/features/trip/domain/repositories/trip_repository.dart';

class DeleteTrips {
  final TripRepository repository;

  DeleteTrips(this.repository);

  Future<void> call(int index) {
    return repository.deleteTrips(index);
  }
}
