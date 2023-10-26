import 'package:mockito/annotations.dart';
import 'package:sky_watch/features/weather/data/data_sources/remote_data_source.dart';
import 'package:sky_watch/features/weather/domain/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;
import 'package:sky_watch/features/weather/domain/usecases/get_current_weather.dart';

@GenerateMocks(
  [
    WeatherRepository,
    WeatherRemoteDataSource,
    GetCurrentWeatherUseCase,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
