// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({
    super.key,
  });
  static String id = "SearchPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;

              WeatherService service = WeatherService();

              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);

              BlocProvider.of<WeatherCubit>(context, listen: false)
                  .weatherModel = weather;
              BlocProvider.of<WeatherCubit>(context, listen: false).cityName =
                  cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              label: Text('search'),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherService service = WeatherService();

                    WeatherModel? weather =
                        await service.getWeather(cityName: cityName!);

                    BlocProvider.of<WeatherCubit>(context, listen: false)
                        .weatherModel = weather;
                    BlocProvider.of<WeatherCubit>(context, listen: false)
                        .cityName = cityName;

                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}
