import 'package:travel_app/core/failure.dart';
import 'package:travel_app/features/trip/data/datasources/trip_local_datasource.dart';
import 'package:travel_app/features/trip/data/models/trip_model.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/domain/repositories/trip_repository.dart';
import 'package:dartz/dartz.dart';
class TripRepositoryImpl implements TripRepository {
  final TripLocalDataSource localDataSource;

  TripRepositoryImpl(this.localDataSource);
  @override
  Future<void> addTrips(Trip trip) async {
    final tripModel = TripModel.fromEntity(trip);
    localDataSource.addTrips(tripModel);
  }

  @override
  Future<void> deleteTrips(int index) async {
    localDataSource.deleteTrips(index);
  }

  @override
  Future<Either<Failure,List<Trip>>> getTrips() async {

    try{
 final tripModel = localDataSource.getTrips();
    List<Trip> res = tripModel.map((e) => e.toEntity()).toList();
    return Right(res);

    }catch(e){
return Left(SomeSpecificError(e.toString()));
    }
   
  }
}
