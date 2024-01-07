import 'package:image_picker/image_picker.dart';

class PickingImage {
  Future<XFile?> pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      return image;
    } else {
      return null;
    }
  }
}
