import 'package:dependencies/dependencies.dart';
import 'package:image_picker/image_picker.dart';

@module
abstract class DeviceModule {
  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();
}
