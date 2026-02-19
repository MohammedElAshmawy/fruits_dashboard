import 'package:e_commerce_dashboard/core/services/database_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDatabaseService implements DatabaseService{
  final SupabaseClient supabase;
  SupabaseDatabaseService({required this.supabase});

  @override
  Future<void> addData({required String path, required dynamic data, String? documentId})async{

    final response=await supabase.from(path).insert(data);

  }

  @override
  Future<bool> checkUserExist({required String path, required String documentId}) {
    // TODO: implement checkUserExist
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getData({required String path, required String documentUid}) {
    // TODO: implement getData
    throw UnimplementedError();
  }
}