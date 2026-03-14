import 'package:e_commerce_dashboard/core/services/database_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDatabaseService implements DatabaseService {
  final SupabaseClient supabase;
  SupabaseDatabaseService({required this.supabase});

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    await supabase.from(path).insert(data);
  }

  @override
  Future<bool> checkUserExist({
    required String path,
    required String documentId,
  }) async {
    final response = await supabase.from(path).select().eq('uId', documentId)
        .maybeSingle();
    return response != null;
  }

  @override
  Future<List<Map<String, dynamic>>> getData({required String path, String? documentUid,
    Map<String, dynamic>? query,}) async {
    dynamic request = supabase.from(path).select();
    if (documentUid != null) {
      request = request.eq('uId', documentUid);
    }
    final response = await request;
    return List<Map<String, dynamic>>.from(response);
  }
}
