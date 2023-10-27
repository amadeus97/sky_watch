import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sky_watch/features/videos/presentation/bloc/videos_bloc.dart';
import 'package:sky_watch/features/videos/presentation/bloc/videos_event.dart';
import 'firebase_options.dart';
import 'package:sky_watch/injection_container.dart';
import 'package:sky_watch/features/weather/presentation/pages/weather_page.dart';
import 'package:sky_watch/features/videos/presentation/pages/videos_page.dart';

import 'features/weather/presentation/bloc/weather_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<WeatherBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<VideosBloc>()..add(const GetVideos()),
        )
      ],
      child: const MaterialApp(
        home: VideosPage(),
      ),
    );
  }
}
