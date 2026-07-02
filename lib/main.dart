import 'package:flutter/material.dart';
import 'package:market_place_car/core/routing/app_router.dart';
import 'package:market_place_car/data/services/service_locator.dart';
import 'package:market_place_car/market_car_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().init();
  runApp(MarketCarApp(appRouter: AppRouter()));
}
