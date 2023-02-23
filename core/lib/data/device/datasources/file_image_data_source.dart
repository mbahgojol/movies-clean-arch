import 'dart:io';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/services.dart';
import 'package:shared/shared.dart';

@lazySingleton
class FileImageDataSource {
  final ImagePicker _imagePicker;

  FileImageDataSource(this._imagePicker);

  Future<File> getImageFromCamera() async {
    try {
      final pickedFile =
          await _imagePicker.pickImage(source: ImageSource.camera);

      if (pickedFile == null) throw UnexpectedError();

      return File(pickedFile.path);
    } on PlatformException catch (e) {
      if (e.code == 'camera_access_denied') {
        throw PermissionDenied();
      } else {
        throw UnexpectedError();
      }
    } catch (e) {
      throw UnexpectedError();
    }
  }

  Future<File> getImageFromGallery() async {
    try {
      final pickedFile =
          await _imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) throw UnexpectedError();

      return File(pickedFile.path);
    } on PlatformException catch (e) {
      if (e.code == 'photo_access_denied') {
        throw PermissionDenied();
      } else {
        throw UnexpectedError();
      }
    } catch (e) {
      throw UnexpectedError();
    }
  }
}
