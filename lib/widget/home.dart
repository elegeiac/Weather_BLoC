import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/bloc/weather_bloc.dart';
import 'package:weather_bloc/bloc/weather_state.dart';
import 'package:weather_bloc/widget/error.dart';
import 'package:weather_bloc/widget/weather_box.dart';

import '../api/api.dart';
import '../bloc/weather_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchKey = GlobalKey<FormState>();
    late TextEditingController? cityController = TextEditingController();
    String? city;
    return BlocProvider<WeatherBloc>(
      create: (context) =>
          WeatherBloc(ApiCalls())..add(FetchWeatherEvent(city: 'Kathmandu')),
      child: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Form(
                key: searchKey,
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.blueGrey,
                    labelText: 'City',
                    hintText: 'Enter a City Name',
                  ),
                  onChanged: (value) {
                    city = value;
                  },
                  controller: cityController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a city name.';
                    }
                    return null;
                  },
                )),
            actions: [
              IconButton(
                  onPressed: () {
                    if (searchKey.currentState!.validate()) {
                      context
                          .read<WeatherBloc>()
                          .add(FetchWeatherEvent(city: city));
                    }
                    cityController.clear();
                  },
                  icon: Icon(Icons.search))
            ],
          ),
          body: SingleChildScrollView(
              // child: state is InitialState
              //     ? Container(
              //         child: Text('This is Initial State'),
              //       )
              child: state is LoadingState
                  ? Center(
                      child: const CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    )
                  : state is LoadedState
                      ? WeatherBox(weatherinfo: state.weather)
                      : (state is NotLoadedState)
                          ? ErrorPage()
                          : null),
        );
      }),
    );
  }
}
