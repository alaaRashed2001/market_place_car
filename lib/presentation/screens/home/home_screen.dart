import 'package:flutter/material.dart';
import 'package:market_place_car/core/constants/temp.dart';
import 'package:market_place_car/core/extension/app_sizes.dart';
import 'package:market_place_car/core/extension/text_style_extension.dart';
import 'package:market_place_car/domain/entities/home/car_listing.dart';
import 'package:market_place_car/domain/entities/home/showroom.dart';
import 'package:market_place_car/presentation/components/home_components/car_listing_card.dart';
import 'package:market_place_car/presentation/components/home_components/showroom_card.dart';
import 'package:market_place_car/presentation/components/home_components/welcome_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<CarListing> _carListings = [
    CarListing(
      imageUrl: toyotaImage,
      brand: 'Toyota',
      price: '16000',
      transmission: 'Automatic',
      seats: 4,
      fuelType: 'Diesel',
    ),
    CarListing(
      imageUrl: camryImage,
      brand: 'Camry',
      price: '12500',
      transmission: 'Automatic',
      seats: 5,
      fuelType: 'Petrol',
    ),
    CarListing(
      imageUrl: 'https://images.example.com/toyota-corolla.png',
      brand: 'Corolla',
      price: '9000',
      transmission: 'Manual',
      seats: 5,
      fuelType: 'Petrol',
    ),
    CarListing(
      imageUrl: toyotaImage,
      brand: 'Toyota',
      price: '16000',
      transmission: 'Automatic',
      seats: 4,
      fuelType: 'Diesel',
    ),
    CarListing(
      imageUrl: camryImage,
      brand: 'Camry',
      price: '12500',
      transmission: 'Automatic',
      seats: 5,
      fuelType: 'Petrol',
    ),
    CarListing(
      imageUrl: 'https://images.example.com/toyota-corolla.png',
      brand: 'Corolla',
      price: '9000',
      transmission: 'Manual',
      seats: 5,
      fuelType: 'Petrol',
    ),
    CarListing(
      imageUrl: toyotaImage,
      brand: 'Toyota',
      price: '16000',
      transmission: 'Automatic',
      seats: 4,
      fuelType: 'Diesel',
    ),
    CarListing(
      imageUrl: camryImage,
      brand: 'Camry',
      price: '12500',
      transmission: 'Automatic',
      seats: 5,
      fuelType: 'Petrol',
    ),
    CarListing(
      imageUrl: 'https://images.example.com/toyota-corolla.png',
      brand: 'Corolla',
      price: '9000',
      transmission: 'Manual',
      seats: 5,
      fuelType: 'Petrol',
    ),
  ];
  final List<Showroom> _showrooms = [
    Showroom(imageUrl: testImage, name: 'Showroom Name', rating: 4.5),
    Showroom(imageUrl: camryImage, name: 'Showroom Name', rating: 8.7),
    Showroom(imageUrl: toyotaImage, name: 'Showroom Name', rating: 4.9),
    Showroom(imageUrl: toyotaImage, name: 'Showroom Name', rating: 7.2),
    Showroom(imageUrl: camryImage, name: 'Showroom Name', rating: 7.2),
    Showroom(imageUrl: testImage, name: 'Showroom Name', rating: 4.5),
    Showroom(imageUrl: camryImage, name: 'Showroom Name', rating: 8.7),
    Showroom(imageUrl: toyotaImage, name: 'Showroom Name', rating: 4.9),
    Showroom(imageUrl: toyotaImage, name: 'Showroom Name', rating: 7.2),
    Showroom(imageUrl: camryImage, name: 'Showroom Name', rating: 7.2),
    Showroom(
      imageUrl: 'https://images.example.com/showroom4.png',
      name: 'Showroom Name',
      rating: 7.2,
    ),
    Showroom(
      imageUrl: 'https://images.example.com/showroom4.png',
      name: 'Showroom Name',
      rating: 7.2,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: context.spaceSymmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WelcomeHeader(),
16.h,
                    CarSwiperCard(listings: _carListings),

                    24.h,
                    Text('Top rated Showroom', style: context.font18Regular),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.1,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ShowroomCard(showroom: _showrooms[index]),
                  childCount: _showrooms.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
