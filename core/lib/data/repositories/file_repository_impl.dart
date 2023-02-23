import 'dart:io';

import 'package:core/data/device/datasources/file_image_data_source.dart';
import 'package:core/domain/repositories/file_repository.dart';
import 'package:dependencies/dependencies.dart';

@LazySingleton(as: FileRepository)
class FileRepositoryImpl extends FileRepository {
  final FileImageDataSource fileImageDataSource;

  FileRepositoryImpl(this.fileImageDataSource);

  @override
  Future<File> getImageFromCamera() {
    return fileImageDataSource.getImageFromCamera();
  }

  @override
  Future<File> getImageFromGallery() {
    return fileImageDataSource.getImageFromGallery();
  }
}
