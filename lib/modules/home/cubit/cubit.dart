import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/home/cubit/state.dart';

import '../../../model/current_weather_data.dart';
import '../../../model/five_days_data.dart';
import '../../../service/weather_service.dart';

class WeatherCubit extends Cubit<WatherStates> {
  WeatherCubit() : super(WatherInitialState());

  static WeatherCubit get(context) => BlocProvider.of(context);


  String? city;
  String? searchText;

  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];


  void getCurrentWeatherData() {
    emit(WatherLoadingState());

    WeatherService(city: 'baghdad').getCurrentWeatherData(
        onSuccess: (data) {
          currentWeatherData = data;
          emit(WatherSuccessState());
        },
        onError: (error) => {
          print(error),

        emit(WatherErrorState())

        });
  }

  void getTopFiveCities() {
    List<String> cities = [
      'baghdad'
      'basra'
      'mosul'
      'kirkuk'
      'anbar'
      'najaf'
      'dhiqar'
      'salahuddin'
      'diyala'
      'babil'
      'karbala'

    ];
    cities.forEach((c) {
      WeatherService(city: 'baghdad').getCurrentWeatherData(onSuccess: (data) {
        dataList.add(data);
        emit(WatherSuccessState());
      }, onError: (error) {
        print(error);
        emit(WatherErrorState());
      });
    });
  }

  void getFiveDaysData() {
    WeatherService(city: '$city').getFiveDaysThreeHoursForcastData(
        onSuccess: (data) {
          fiveDaysData = data;
          emit(WatherSuccessState());
        }, onError: (error) {
      print(error);
      emit(WatherErrorState());
    });
  }



}