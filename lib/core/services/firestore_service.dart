import 'package:cloud_firestore/cloud_firestore.dart';
import 'database_service.dart';

class FireStoreService  implements DatabaseService{

  FirebaseFirestore firestore = FirebaseFirestore.instance;


  @override
  Future<Map<String, dynamic>> getData({required String path, required String documentUid})async {
    var data=await firestore.collection(path).doc(documentUid).get();
    return data.data() as Map<String,dynamic> ;
  }

  @override
  Future<bool> checkUserExist({required String path, required String documentId}) async{
    var data=await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  @override
  Future<void> addData({required String path, required Map<String, dynamic> data,
    String? url, String? documentId}) async{
    if(documentId != null){
      await firestore.collection(path).doc(documentId).set(data);
    }else{
      await firestore.collection(path).add(data);
    }
  }
}