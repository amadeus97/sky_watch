import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:sky_watch/features/videos/domain/repositories/video_repository.dart';

class FirebaseVideoRepositoryImpl implements VideoRepository {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Future<String> uploadVideo(String videoPath) async {
    final ref =
        _storage.ref().child('videos/${DateTime.now().millisecondsSinceEpoch}');
    final uploadTask = ref.putFile(File(videoPath));

    final snapshot = await uploadTask.whenComplete(() => null);

    if (snapshot.state == TaskState.success) {
      final downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    } else {
      throw Exception('Failed to upload video.');
    }
  }
}
