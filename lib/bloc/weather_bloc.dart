import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/bloc/weather_event.dart';
import 'package:weather_bloc/bloc/weather_state.dart';
import '../api/api.dart';
import '../model/model.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this.apiCalls) : super(NotLoadedState()) {
    on<FetchWeatherEvent>(_onFetchWeatherEvent);
  }
  final ApiCalls apiCalls;

  void _onFetchWeatherEvent(
      FetchWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(LoadingState());
    try {
      final weather = await ApiCalls.getWeather(city: event.city);
      emit(LoadedState(weather!));
    } catch (_) {
      emit(NotLoadedState());
    }
  }
}
