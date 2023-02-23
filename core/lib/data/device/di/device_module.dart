import 'package:dependencies/dependencies.dart';

@module
abstract class DeviceModule {
  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();
}
