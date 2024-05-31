import 'package:flutter/material.dart';

import 'package:peliculas/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeIn,
    );

    _controller!.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        _controller!.reverse().then((_) async {
          await Provider.of<MoviesProvider>(context, listen: false).getGenres();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        });
      });
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
       
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation!,
          child: const Image(
            image: AssetImage('assets/splash.jpg'),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
