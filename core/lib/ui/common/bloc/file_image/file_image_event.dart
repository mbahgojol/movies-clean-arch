part of 'file_image_bloc.dart';

@freezed
class FileImageEvent with _$FileImageEvent {
    const factory FileImageEvent.pickFromGallery() = _PickFromGallery;
    const factory FileImageEvent.pickFromCamera() = _PickFromCamera;
}