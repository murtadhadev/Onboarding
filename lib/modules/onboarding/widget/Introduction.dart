import 'package:flutter/material.dart';

class Introduction extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final double? imageWidth;
  final double? imageHeight;
  final TextStyle titleTextStyle;
  final TextStyle subTitleTextStyle;

  Introduction({
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    this.titleTextStyle = const TextStyle(fontSize: 30),
    this.subTitleTextStyle = const TextStyle(fontSize: 20),
    this.imageWidth = 360,
    this.imageHeight = 360,
  });

  @override
  State<StatefulWidget> createState() {
    return new IntroductionState();
  }
}

class IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return  Column(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Center(
          child: Image(
            image: AssetImage(widget.imageUrl),
            height: 280,
            width: 280,
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
        Expanded(
          child: Container(
            height: 450,
            width: 450,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(80),
                topLeft: Radius.circular(80)
              ),
              color: Colors.white
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 20),
                      child: Container(
                        width: 300,
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          style: widget.titleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 300,
                  child: Text(
                    widget.subTitle,
                    style: const TextStyle(
                      color: Color(0xff8B95A2)
                    ),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}