import 'dart:io';

import 'package:core/domain/interactors/get_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

part 'file_image_bloc.freezed.dart';

part 'file_image_event.dart';

part 'file_image_state.dart';

@injectable
class FileImageBloc extends Bloc<FileImageEvent, FileImageState> {
  final GetImage getImage;

  FileImageBloc(this.getImage) : super(FileImageState.initial()) {
    on<FileImageEvent>((event, emit) async {
      await event.map(
        pickFromGallery: (e) async {
          emit(
            state.copyWith.call(
              processing: true,
              result: none(),
            ),
          );
          emit(
            state.copyWith.call(
              processing: false,
              result: await getImage(GetImageType.gallery),
            ),
          );
        },
        pickFromCamera: (e) async {
          emit(
            state.copyWith.call(
              processing: true,
              result: none(),
            ),
          );
          emit(
            state.copyWith.call(
              processing: false,
              result: await getImage(GetImageType.camera),
            ),
          );
        },
      );
    });
  }
}
