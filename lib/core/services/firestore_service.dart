import 'package:cloud_firestore/cloud_firestore.dart';
import '../../features/orders/data/models/status_enum.dart';
import 'database_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<List<Map<String, dynamic>>> getData({
    required String path,
    String? documentUid,
    Map<String, dynamic>? query,
  }) async {
    if (documentUid != null) {
      var data = await firestore.collection(path).doc(documentUid).get();
      return data.exists ? [data.data() as Map<String, dynamic>] : [];
    } else {
      Query<Map<String, dynamic>> collection = firestore.collection(path);
      if (query != null) {
        query.forEach((key, value) {
          collection = collection.where(key, isEqualTo: value);
        });
      }
      var data = await collection.get();
      return data.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkUserExist({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Stream<List<Map<String, dynamic>>> streamData({required String path, Map<String, dynamic>? query}) {
    // TODO: implement streamData
    throw UnimplementedError();
  }

  @override
  Future<void> updateData({required String path, required Map<String, dynamic> data, OrderStatus? orderStatus}) {
    // TODO: implement updateData
    throw UnimplementedError();
  }

}
