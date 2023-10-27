import 'package:flutter/material.dart';
import 'package:sky_watch/features/videos/domain/entities/video_info.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoInfoEntity videoInfo;

  const VideoPlayerWidget({super.key, required this.videoInfo});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late ChewieController _controller;

  @override
  void initState() {
    super.initState();
    final videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoInfo.videoUrl))
          ..initialize().then((_) {
            setState(() {});
          });

    _controller = ChewieController(
      videoPlayerController: videoPlayerController,
      looping: true,
    );

    Future.delayed(const Duration(milliseconds: 100), () {
      _controller.play();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: _controller);
  }
}
