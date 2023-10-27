import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:images_picker/images_picker.dart';

import '../bloc/videos_bloc.dart';
import '../bloc/videos_event.dart';
import '../bloc/videos_state.dart';

class UploadVideoPage extends StatefulWidget {
  const UploadVideoPage({Key? key}) : super(key: key);

  @override
  State<UploadVideoPage> createState() => _UploadVideoPageState();
}

class _UploadVideoPageState extends State<UploadVideoPage> {
  Media? selectedVideo;
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1D1E22),
        title: const Text(
          'Upload Videos',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        // button to save
        actions: [
          IconButton(
            onPressed: () {
              context.read<VideosBloc>().add(
                    OnVideoUpload(
                      filePath: selectedVideo!.path,
                      senderName: _nameController.text,
                      senderLocation: _locationController.text,
                    ),
                  );
            },
            icon: const Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocListener<VideosBloc, VideosState>(
          listener: (context, state) {
            if (state is VideosLoaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Video Uploaded Successfully'),
                ),
              );
              Navigator.pop(context);
            }
          },
          child: BlocBuilder<VideosBloc, VideosState>(
            builder: (context, state) {
              if (state is VideosLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView(
                // Button to select video with images_picker
                children: [
                  if (selectedVideo == null)
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              List<Media>? res = await ImagesPicker.pick(
                                count: 1,
                                pickType: PickType.video,
                                cropOpt: CropOption(
                                  aspectRatio: CropAspectRatio.wh16x9,
                                ),
                              );

                              if (res != null) {
                                setState(() {
                                  selectedVideo = res[0];
                                });
                              }
                            },
                            child: const Text('Select Video'),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              List<Media>? res = await ImagesPicker.openCamera(
                                pickType: PickType.video,
                                cropOpt: CropOption(
                                  aspectRatio: CropAspectRatio.wh16x9,
                                ),
                              );

                              if (res != null) {
                                setState(() {
                                  selectedVideo = res[0];
                                });
                              }
                            },
                            child: const Text('Record Video'),
                          ),
                        ),
                      ],
                    )
                  else
                    Text(selectedVideo!.path.split('/').last),

                  // Inputs for sender name and video title

                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _locationController,
                    decoration: const InputDecoration(
                      labelText: 'Location',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
