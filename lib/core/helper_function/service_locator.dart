import 'package:e_commerce_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:e_commerce_dashboard/core/repos/image_repo/image_repo_impl.dart';
import 'package:e_commerce_dashboard/core/repos/products_repo/product_repo_impl.dart';
import 'package:e_commerce_dashboard/core/services/database_service.dart';
import 'package:e_commerce_dashboard/core/services/storage_service.dart';
import 'package:e_commerce_dashboard/core/services/supabase_database_service.dart';
import 'package:e_commerce_dashboard/core/services/supabase_storage_service.dart';
import 'package:e_commerce_dashboard/features/orders/domain/repo/fetch_orders_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../features/orders/data/repos/fetch_orders_repo_impl.dart';
import '../repos/products_repo/products_repo.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  final SupabaseClient supabaseClient = Supabase.instance.client;
  getIt.registerSingleton<StorageService>(SupabaseStorageService());

  getIt.registerSingleton<DatabaseService>(SupabaseDatabaseService(supabase: supabaseClient));

  getIt.registerSingleton<ImagesRepo>(ImagesRepoImpl(getIt.get<StorageService>()));

  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(
      databaseService: getIt.get<DatabaseService>()));

   getIt.registerSingleton<OrdersRepo>(
       FetchOrdersRepoImpl(databaseService: getIt.get<DatabaseService>()));

}