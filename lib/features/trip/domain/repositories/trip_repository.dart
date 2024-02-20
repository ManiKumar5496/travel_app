import 'package:travel_app/core/failure.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:dartz/dartz.dart';

abstract class TripRepository {
  Future<Either<Failure, List<Trip>>> getTrips();
  Future<void> addTrips(Trip trip);
  Future<void> deleteTrips(int index);
}
