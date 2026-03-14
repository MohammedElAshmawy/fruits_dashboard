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

  Future<bool> checkUserExist(
      {required String path, required String documentId});
}
