import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/home/cubit/cubit.dart';
import 'modules/splash/splash_screen.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherCubit()..getCurrentWeatherData(),

      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
