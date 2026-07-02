import 'package:dartz/dartz.dart';
import 'package:market_place_car/domain/entities/home/car_listing.dart';
import 'package:market_place_car/domain/failure/failure.dart';
import 'package:market_place_car/domain/repositories/home/home_repository.dart';

class FetchCarListingUseCase {
  final HomeRepository _homeRepository;

  const FetchCarListingUseCase(this._homeRepository);
  Future<Either<Failure, List<CarListing>>> fetchCarListing() async{
    return await _homeRepository.fetchCarListing();

}
}