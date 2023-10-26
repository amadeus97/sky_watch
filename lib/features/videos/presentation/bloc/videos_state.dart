import 'package:equatable/equatable.dart';
import 'package:sky_watch/features/videos/domain/entities/video_info.dart';

abstract class VideosState extends Equatable {
  const VideosState();

  @override
  List<Object?> get props => [];
}

class VideosEmpty extends VideosState {}

class VideosLoading extends VideosState {}

class VideosLoaded extends VideosState {
  final List<VideoInfoEntity> result;

  const VideosLoaded(this.result);

  @override
  List<Object?> get props => [result];
}

class VideosLoadFailue extends VideosState {
  final String message;

  const VideosLoadFailue(this.message);

  @override
  List<Object?> get props => [message];
}
