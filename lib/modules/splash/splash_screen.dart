import 'package:flutter/material.dart';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool setColor = false;

  @override
  void initState() {
    colorchang();
    navigatorOnboarding();
    super.initState();
  }

  Future<void> navigatorOnboarding() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => OnboardingScreen()));
  }

  Future<void> colorchang() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      setColor = !setColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 3),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: setColor
                ? [Colors.white, const Color(0xffBCC8D6).withOpacity(0.5)]
                : [Colors.black, const Color(0xff32364E)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedAlign(
              alignment: setColor ? Alignment.center : Alignment.topRight,
              duration: const Duration(milliseconds: 1500),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1500),
                height: setColor ? 250 : 0,
                child: Image.asset(
                  'assets/images/splash.png',
                  height: 250,
                ),
              ),
            ),
            const Text(
              'Weather',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            ),
            const Text(
              'Forecast',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff8B95A2)),
            ),
          ],
        ),
      ),
    );
  }
}
