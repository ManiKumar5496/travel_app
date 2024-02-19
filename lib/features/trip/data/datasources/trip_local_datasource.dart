// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'package:travel_app/features/trip/data/models/trip_model.dart';

class TripLocalDataSource {
  final Box<TripModel> tripBox;
  TripLocalDataSource(
    this.tripBox,
  );

  List<TripModel> getTrips() {
    return tripBox.values.toList();
  }

  void addTrips(TripModel trip) {
    tripBox.add(trip);
  }

  void deleteTrips(int index) {
    tripBox.deleteAt(index);
  }
}
