import 'package:sky_watch/features/videos/domain/repositories/video_repository.dart';

class UploadVideoUseCase {
  final VideoRepository _videoRepository;

  UploadVideoUseCase(this._videoRepository);

  Future<String> execute(String filePath) {
    return _videoRepository.uploadVideo(filePath);
  }
}
