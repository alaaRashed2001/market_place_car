import 'package:dartz/dartz.dart';
import 'package:market_place_car/domain/entities/home/car_listing.dart';
import 'package:market_place_car/domain/entities/home/showroom.dart';
import 'package:market_place_car/domain/failure/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CarListing>>> fetchCarListing();
  Future<Either<Failure, List<Showroom>>> fetchShowroom();
}
