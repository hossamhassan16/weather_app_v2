import 'package:bloc/bloc.dart';
import 'package:weather_app_v2/models/weather_model.dart';
import 'package:weather_app_v2/services/weather_services.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(initialState());
  WeatherService weatherService;
  String? cityName;
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    emit(weatherLoading());
    try {
      WeatherModel? weatherModel =
          await weatherService.getWeather(cityName: cityName);
      emit(weatherSuccess(weatherModel: weatherModel!));
    } on Exception {
      emit(weatherFailure());
    }
  }
}
