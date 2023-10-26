import 'package:dartz/dartz.dart';
import 'package:sky_watch/core/error/failure.dart';
import 'package:sky_watch/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(String cityName);
}
