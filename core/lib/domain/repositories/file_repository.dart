import 'dart:io';

abstract class FileRepository {
  Future<File> getImageFromCamera();

  Future<File> getImageFromGallery();
}
