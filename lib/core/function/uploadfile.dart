import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:mime/mime.dart'; // Import for MIME type detection

fileUploadGallery([issvg = false]) async {
  final ImagePicker _picker = ImagePicker();
  XFile? pickedFile = await _picker.pickImage(
    source: ImageSource.gallery,
    // You can filter based on the extension here, but by default, ImagePicker handles image types.
  );

  if (pickedFile != null) {
    File file = File(pickedFile.path);

    // Check MIME type to confirm it's a valid JPG image
    final mimeType = lookupMimeType(file.path);
    print("==================${mimeType}");

    return file;
  } else {
    return null; // User canceled the picker
  }
}
