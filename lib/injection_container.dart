import 'package:get_it/get_it.dart';
import 'package:sky_watch/data/data_sources/remote_data_source.dart';
import 'package:sky_watch/data/repositories/weather_repository_impl.dart';
import 'package:sky_watch/domain/repositories/weather_repository.dart';
import 'package:sky_watch/domain/usecases/get_current_weather.dart';
import 'package:sky_watch/presentation/bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setupLocator() {
  // bloc
  locator.registerFactory(() => WeatherBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetCurrentWeatherUseCase(locator()));

  // repository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(weatherRemoteDataSource: locator()),
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
