part of 'file_image_bloc.dart';

@freezed
class FileImageState with _$FileImageState {
  const factory FileImageState({
    required Result<File> result,
    required bool processing,
  }) = _FileImageState;

  factory FileImageState.initial() => FileImageState(
        result: none(),
        processing: false,
      );
}
