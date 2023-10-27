import 'package:get_it/get_it.dart';
import 'package:sky_watch/features/videos/data/repositories/firebase_video_repository.dart';
import 'package:sky_watch/features/videos/data/repositories/firestore_repository.dart';
import 'package:sky_watch/features/videos/domain/repositories/video_repository.dart';
import 'package:sky_watch/features/videos/domain/usecases/get_videos.dart';
import 'package:sky_watch/features/videos/domain/usecases/save_video_info.dart';
import 'package:sky_watch/features/videos/domain/usecases/upload_video.dart';
import 'package:sky_watch/features/videos/presentation/bloc/videos_bloc.dart';
import 'package:sky_watch/features/weather/data/data_sources/remote_data_source.dart';
import 'package:sky_watch/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:sky_watch/features/weather/domain/repositories/weather_repository.dart';
import 'package:sky_watch/features/weather/domain/usecases/get_current_weather.dart';
import 'package:sky_watch/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setupLocator() {
  // bloc
  locator.registerFactory(() => WeatherBloc(locator()));
  locator.registerFactory(
    () => VideosBloc(
      getVideosUseCase: locator(),
      uploadVideoUseCase: locator(),
      saveVideoInfoUseCase: locator(),
    ),
  );

  // usecase
  locator.registerLazySingleton(() => GetCurrentWeatherUseCase(locator()));
  locator.registerLazySingleton(() => UploadVideoUseCase(locator()));
  locator.registerLazySingleton(() => SaveVideoInfoUseCase(locator()));
  locator.registerLazySingleton(() => GetVideosUseCase(locator()));

  // repository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(weatherRemoteDataSource: locator()),
  );
  locator.registerLazySingleton<VideoRepository>(
    () => FirebaseVideoRepositoryImpl(),
  );
  locator.registerLazySingleton(
    () => FirestoreRepository(),
  );

  // data source
  locator.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(
      locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
