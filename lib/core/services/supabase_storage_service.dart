import 'dart:io';
import 'package:e_commerce_dashboard/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;
import '../utils/constants.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  static supabaseInit() async {
    _supabase = await Supabase.initialize(url: KSupabaseUrl, anonKey: KAnonKey);
  }

  static createBucket(String bucketName) async {
    final storage = _supabase.client.storage;
    final buckets = await storage.listBuckets();
    final isExists = buckets.any((bucket) {
      return bucket.name == bucketName;
    });
    if (isExists) {
      return;
    }
    await _supabase.client.storage.createBucket(bucketName);
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    final fileName = b.basenameWithoutExtension(file.path);
    final extensionName = b.extension(file.path);
    final filePath = '$path/$fileName$extensionName';
    await _supabase.client.storage
        .from("fruits_images")
        .upload(filePath, file);
    final String publicUrl = _supabase.client.storage
        .from("fruits_images")
        .getPublicUrl(filePath);
    return publicUrl;
  }
}
