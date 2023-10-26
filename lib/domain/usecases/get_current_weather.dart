import 'package:dartz/dartz.dart';
import 'package:sky_watch/core/error/failure.dart';
import 'package:sky_watch/domain/entities/weather.dart';
import 'package:sky_watch/domain/repositories/weather_repository.dart';

class GetCurrentWeatherUseCase {
  final WeatherRepository _weatherRepository;

  GetCurrentWeatherUseCase(this._weatherRepository);

  Future<Either<Failure, WeatherEntity>> execute(String cityName) {
    return _weatherRepository.getCurrentWeather(cityName);
  }
}
