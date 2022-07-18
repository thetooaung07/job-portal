import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // File upload
  Future<String> uploadPhoto(XFile file, String path) async {
    Reference _ref = _storage.ref(path);

    final UploadTask _uploadTask = _ref.putFile(
      File(file.path),
    );
    await _uploadTask.whenComplete(() => null);

    // get download Link
    return _ref.getDownloadURL();
  }
}
