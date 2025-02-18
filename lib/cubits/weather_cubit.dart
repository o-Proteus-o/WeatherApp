import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherService weatherService;
  String? cityName;
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherModel? weatherModel;

  void getWeather({required String cityNme}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityNme);
      emit(WeatherSuccess());
    } on Exception catch (e) {
      emit(WeatherFailed());
    }
  }
}
