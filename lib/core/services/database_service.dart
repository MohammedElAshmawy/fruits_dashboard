import 'package:e_commerce_dashboard/features/orders/data/models/status_enum.dart';

abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<List<Map<String, dynamic>>> getData({
    required String path,
    String? documentUid,
    Map<String, dynamic>? query,
  });


  Stream<List<Map<String, dynamic>>> streamData({
    required String path,
    Map<String, dynamic>? query,
  });

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
     String? documentId
  });

  Future<bool> checkUserExist(
      {required String path, required String documentId});
}
