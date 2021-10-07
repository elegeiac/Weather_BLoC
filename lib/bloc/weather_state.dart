import 'package:equatable/equatable.dart';
import 'package:weather_bloc/model/model.dart';

class WeatherState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//class InitialState extends WeatherState {}

class LoadingState extends WeatherState {}

class NotLoadedState extends WeatherState {}

class LoadedState extends WeatherState {
  final Weather weather;
  LoadedState(this.weather);
  @override
  // TODO: implement props
  List<Object?> get props => [weather];
}
