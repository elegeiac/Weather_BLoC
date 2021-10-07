import 'package:equatable/equatable.dart';

class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialEvent extends WeatherEvent {}

class LoadingEvent extends WeatherEvent {}

class FetchWeatherEvent extends WeatherEvent {
  final String? city;
  FetchWeatherEvent({this.city});

  @override
  List<Object?> get props => [city];
}
