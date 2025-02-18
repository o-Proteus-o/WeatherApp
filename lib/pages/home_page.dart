import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/cubits/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/widgets/failedbody.dart';
import 'package:weather_app/widgets/initialbody.dart';
import 'package:weather_app/widgets/successbody.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  WeatherModel? weatherModel;
  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel;

    return Scaffold(
        drawer: const NavigationDrawer(children: [
          ListTile(
            title: Text('H O M E'),
            leading: Icon(Icons.home),
          ),
          ListTile(
            title: Text('S E T T I N G'),
            leading: Icon(Icons.settings),
          )
        ]),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search),
            ),
          ],
          title: const Text('Weather App'),
        ),
        body:
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherSuccess) {
            return SuccessBody(weathreModel: weatherModel);
          } else if (state is WeatherFailed) {
            return FailedFetchWeather();
          } else {
            return InitialBody();
          }
        }));
  }
}
