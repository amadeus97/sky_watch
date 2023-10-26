import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_watch/features/videos/domain/entities/video_info.dart';
import 'package:sky_watch/features/videos/domain/usecases/get_videos.dart';
import 'package:sky_watch/features/videos/domain/usecases/upload_video.dart';
import 'package:sky_watch/features/videos/domain/usecases/save_video_info.dart';
import 'package:sky_watch/features/videos/presentation/bloc/videos_event.dart';
import 'package:sky_watch/features/videos/presentation/bloc/videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final GetVideosUseCase getVideosUseCase;
  final UploadVideoUseCase uploadVideoUseCase;
  final SaveVideoInfoUseCase saveVideoInfoUseCase;
  VideosBloc({
    required this.getVideosUseCase,
    required this.uploadVideoUseCase,
    required this.saveVideoInfoUseCase,
  }) : super(VideosEmpty()) {
    on<GetVideos>(
      (event, emit) async {
        emit(VideosLoading());

        try {
          final result = await getVideosUseCase.execute();

          emit(VideosLoaded(result));
        } catch (e) {
          emit(VideosLoadFailue(e.toString()));
        }
      },
    );
    on<OnVideoUpload>((event, emit) async {
      emit(VideosLoading());

      try {
        final videoUrl = await uploadVideoUseCase.execute(event.filePath);

        final videoInfo = VideoInfoEntity(
          videoUrl: videoUrl,
          senderName: event.senderName,
          senderLocation: event.senderLocation,
        );

        await saveVideoInfoUseCase.execute(videoInfo);

        final result = await getVideosUseCase.execute();

        emit(VideosLoaded(result));
      } catch (e) {
        emit(VideosLoadFailue(e.toString()));
      }
    });
  }
}
