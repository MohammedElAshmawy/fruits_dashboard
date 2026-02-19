import 'package:e_commerce_dashboard/core/helper_function/service_locator.dart';
import 'package:e_commerce_dashboard/core/services/supabase_storage_service.dart';
import 'package:e_commerce_dashboard/features/dashboard/views/dashboard_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/helper_function/bloc_observer.dart';
import 'core/helper_function/go_route_function.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseStorageService.supabaseInit();
  await SupabaseStorageService.createBucket("fruits_images");
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.routName,
    );
  }
}