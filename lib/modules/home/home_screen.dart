import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/current_weather_data.dart';
import '../../model/main_weather.dart';
import '../../model/main_weather.dart';
import '../../model/main_weather.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIdx = -1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: BlocConsumer<WeatherCubit, WatherStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = WeatherCubit.get(context);
          if(state is WatherLoadingState){
            return Center(child: CircularProgressIndicator());
          }


             print(cubit.currentWeatherData.name);
             return Scaffold(
               backgroundColor: Color(0xff484B5B),
               appBar: AppBar(
                 title: Text('Iraq'),

                 centerTitle: true,
                 elevation: 0,
                 backgroundColor: Color(0xff484B5B),
                 actions: const [
                   Icon(Icons.keyboard_control_rounded),
                 ],
                 bottom: const TabBar(
                   isScrollable: true,
                   indicatorWeight: 1,
                   indicatorColor: Colors.white,
                   tabs: [
                     Text('Today'),
                     Text('Forecast'),
                     Text('Precipitation'),
                     Text('Radar'),
                     Text('Sun'),
                   ],
                 ),
               ),
               drawer: const Drawer(
                 backgroundColor: Color(0xff484B5B),
               ),
               body: TabBarView(
                 children: [
                   watherTody(cubit.currentWeatherData),
                   Center(
                     child: Text("'Today"),
                   ),
                   Center(
                     child: Text("Settings"),
                   ),
                   Center(
                     child: Text("Chats"),
                   ),
                   Center(
                     child: Text("Calls"),
                   ),
                 ],
               ),
             );



        },
      ),
    );
  }

  Widget watherTody(CurrentWeatherData? model) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 30,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff32333E)),
              child: Center(
                  child: Text(
                '${model!.name}' ?? '',
                style: TextStyle(color: Color(0xff9B9EAD), fontSize: 15),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/splash.png',
                  height: 180,
                ),
                Column(
                  children: [
                    Text(
                      '${(model.main!.temp! - 273.15).round().toString()}\u2103',
                      style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffA2A4B5)),
                    ),
                    Text(
                      '${model.weather![0].description}',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      '${(model.main!.feelsLike! - 273.15).round().toString()} Feels like ',
                      style: TextStyle(color: Color(0xff9B9EAD), fontSize: 10),
                    ),
                    Text(
                      '39°C',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
                Text(
                  '|',
                  style: TextStyle(color: Color(0xff9B9EAD), fontSize: 10),
                ),
                Row(
                  children: [
                    Text('Wind',
                        style:
                            TextStyle(color: Color(0xff9B9EAD), fontSize: 10)),
                    Text('9 KM/',
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                    Text('H WSW',
                        style:
                            TextStyle(color: Color(0xff9B9EAD), fontSize: 10)),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                height: 2,
                child: CustomPaint(
                  painter: DashedLinePainter(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/splash.png',
                          height: 30,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Row(
                          children: [
                            Text('Precipitation: ',
                                style: TextStyle(
                                    color: Color(0xff9B9EAD), fontSize: 10)),
                            Text(
                              '21%',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Group 4.png',
                          height: 30,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Row(
                          children: [
                            Text('Precipitation: ',
                                style: TextStyle(
                                    color: Color(0xff9B9EAD), fontSize: 10)),
                            Text(
                              '21%',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/splash.png',
                          height: 30,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Row(
                          children: [
                            Text('Precipitation: ',
                                style: TextStyle(
                                    color: Color(0xff9B9EAD), fontSize: 10)),
                            Text(
                              '21%',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/splash.png',
                          height: 30,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Row(
                          children: [
                            Text('Precipitation: ',
                                style: TextStyle(
                                    color: Color(0xff9B9EAD), fontSize: 10)),
                            Text(
                              '21%',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 110,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIdx = index;
                        });
                      },
                      child: Container(
                        height: 100,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: selectedIdx == index
                              ? Color(0xff9B9EAD).withOpacity(0.5)
                              : Color(0xff000000).withOpacity(0.15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('01:00',
                                  style: TextStyle(
                                      color: Color(0xffA2A4B5), fontSize: 8)),
                              Image.asset(
                                'assets/images/Group 4.png',
                                height: 30,
                              ),
                              Text(
                                '26',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 600,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff232329)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('High    |    Low',
                        style:
                            TextStyle(color: Color(0xffA2A4B5), fontSize: 10)),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 540,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: Colors.white,
                                    ),
                                    Text('Today',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18)),
                                  ],
                                ),
                                Image.asset(
                                  'assets/images/Group 4.png',
                                  height: 30,
                                ),
                                Text('56  78',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color(0xff595C66)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    final double dashWidth = 5;
    final double dashSpace = 5;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
