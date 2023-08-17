import '../../../model/current_weather_data.dart';

abstract class WatherStates {}

class WatherInitialState extends WatherStates {}

class WatherLoadingState extends WatherStates {}

class WatherSuccessState extends WatherStates {

}

class WatherErrorState extends WatherStates {

}