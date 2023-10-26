import 'package:sky_watch/features/videos/data/repositories/firestore_repository.dart';
import 'package:sky_watch/features/videos/domain/entities/video_info.dart';

class GetVideosUseCase {
  final FirestoreRepository _firestoreRepository;

  GetVideosUseCase(this._firestoreRepository);

  Future<List<VideoInfoEntity>> execute() {
    return _firestoreRepository.getVideos();
  }
}
