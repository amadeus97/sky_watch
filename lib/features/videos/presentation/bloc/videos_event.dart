import 'package:equatable/equatable.dart';

abstract class VideosEvent extends Equatable {
  const VideosEvent();

  @override
  List<Object?> get props => [];
}

class GetVideos extends VideosEvent {
  const GetVideos();
}

class OnVideoUpload extends VideosEvent {
  final String filePath;
  final String senderName;
  final String senderLocation;

  const OnVideoUpload({
    required this.filePath,
    required this.senderName,
    required this.senderLocation,
  });

  @override
  List<Object?> get props => [filePath, senderName, senderLocation];
}
