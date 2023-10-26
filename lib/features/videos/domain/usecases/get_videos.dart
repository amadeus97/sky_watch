import 'package:sky_watch/features/videos/data/repositories/firestore_repository.dart';
import 'package:sky_watch/features/videos/domain/entities/video_info.dart';

class SaveVideoInfoUseCase {
  final FirestoreRepository _firestoreRepository;

  SaveVideoInfoUseCase(this._firestoreRepository);

  Future<List<VideoInfoEntity>> execute(VideoInfoEntity info) {
    return _firestoreRepository.getVideos();
  }
}
