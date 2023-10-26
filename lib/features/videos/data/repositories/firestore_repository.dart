import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sky_watch/features/videos/domain/entities/video_info.dart';

class FirestoreRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveVideoInfo(VideoInfoEntity videoInfo) async {
    try {
      final collection = _firestore.collection('videos');
      await collection.add({
        'videoUrl': videoInfo.videoUrl,
        'senderName': videoInfo.senderName,
        'senderLocation': videoInfo.senderLocation,
      });
    } catch (e) {
      throw Exception('Error saving video info: $e');
    }
  }

  Future<List<VideoInfoEntity>> getVideos() async {
    try {
      final collection = _firestore.collection('videos');
      final snapshot = await collection.get();
      final videos = snapshot.docs
          .map((doc) => VideoInfoEntity(
                videoUrl: doc['videoUrl'],
                senderName: doc['senderName'],
                senderLocation: doc['senderLocation'],
              ))
          .toList();
      return videos;
    } catch (e) {
      throw Exception('Error getting videos: $e');
    }
  }
}
