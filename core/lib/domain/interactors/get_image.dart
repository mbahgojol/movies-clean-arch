import 'dart:io';

import 'package:core/domain/repositories/file_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/common/network/interactor.dart';

@lazySingleton
class GetImage extends ResultInteractorWithParams<GetImageType, File> {
  final FileRepository fileRepository;

  GetImage(this.fileRepository);

  @override
  Future<File> doWork(GetImageType params) async {
    switch (params) {
      case GetImageType.gallery:
        return fileRepository.getImageFromGallery();
      case GetImageType.camera:
        return fileRepository.getImageFromCamera();
    }
  }
}

enum GetImageType { gallery, camera }
