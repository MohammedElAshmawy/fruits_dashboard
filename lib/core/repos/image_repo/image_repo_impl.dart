import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_dashboard/core/errors/failures.dart';
import 'package:e_commerce_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:e_commerce_dashboard/core/services/storage_service.dart';
import 'package:flutter/material.dart';

class ImagesRepoImpl implements ImagesRepo{

  final StorageService storageService;
  ImagesRepoImpl(this.storageService);

  @override
  Future<Either<Failure, String>> uploadImage(File image)async {

    try {
      String url=await storageService.uploadFile(image, "images");
      return Right(url);
    } catch (e,s) {
      debugPrint('UPLOAD IMAGE ERROR: $e');
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: "Failed to upload image "));
    }
  }
}
