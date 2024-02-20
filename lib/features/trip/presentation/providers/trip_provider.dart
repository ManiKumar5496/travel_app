// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import 'package:travel_app/features/trip/data/datasources/trip_local_datasource.dart';
import 'package:travel_app/features/trip/data/models/trip_model.dart';
import 'package:travel_app/features/trip/data/repositories/trip_repository_impl.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/domain/repositories/trip_repository.dart';
import 'package:travel_app/features/trip/domain/usescases/add_trips.dart';
import 'package:travel_app/features/trip/domain/usescases/delete_trips.dart';
import 'package:travel_app/features/trip/domain/usescases/get_trips.dart';

final tripLocalDataSourceProvider = Provider<TripLocalDataSource>((ref) {
  final Box<TripModel> tripBox = Hive.box("trips");
  return TripLocalDataSource(tripBox);
});

final tripRepositoryProvider = Provider<TripRepository>((ref) {
  final localDataSource = ref.read(tripLocalDataSourceProvider);
  return TripRepositoryImpl(localDataSource);
});

final addTripsProvider = Provider<AddTrips>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return AddTrips(repository);
});

final getTripsProvider = Provider<GetTrips>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return GetTrips(repository);
});

final delTripsProvider = Provider<DeleteTrips>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return DeleteTrips(repository);
});

final tripListNotifierProvider = StateNotifierProvider<TripListNotifier, List<Trip>>((ref) {
  final getTrip = ref.read(getTripsProvider);
  final addTrip = ref.read(addTripsProvider);
  final deleteTrip = ref.read(delTripsProvider);

  return TripListNotifier(getTrip, addTrip, deleteTrip);
});

class TripListNotifier extends StateNotifier<List<Trip>> {
  final GetTrips _getTrips;
  final AddTrips _addTrips;
  final DeleteTrips _delTrips;
  TripListNotifier(
    this._getTrips,
    this._addTrips,
    this._delTrips,
  ) : super([]);

  Future<void> addNewTrip(Trip trip) async {
    await _addTrips(trip);
  }

  Future<void> removeTrip(int tripId) async {
    await _delTrips(tripId);
  }

  Future<void> loadTrips() async {
    final tripsOrFalure = await _getTrips();
    tripsOrFalure.fold((error) => state = [], (trips) => state = trips);
  }
}
