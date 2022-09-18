import 'package:cerberus_ai_system/presentation/home_screen/home_screen.dart';
import 'package:cerberus_ai_system/widgets/platformwidgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class InitScreen extends StatefulWidget {
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  bool hintLoadding = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        hintLoadding = true;
      });
    });
  }

  Widget _buildAndroidWidget(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const HomeScreen(),
            if (!hintLoadding) Loading(context),
          ],
        ));
  }

  Widget _buildIosWidget(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const HomeScreen(),
            if (!hintLoadding) Loading(context),
          ],
        ));
  }

  Widget _buildMacOsWidget(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const HomeScreen(),
            if (!hintLoadding) Loading(context),
          ],
        ));
  }

  Widget _buildWindowWidget(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const HomeScreen(),
            if (!hintLoadding) Loading(context),
          ],
        ));
  }

  Widget _buildLinuxWidget(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const HomeScreen(),
            if (!hintLoadding) Loading(context),
          ],
        ));
  }

  Widget _buildWebWidget(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const HomeScreen(),
            if (!hintLoadding) Loading(context),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidgets(
      androidBuilder: _buildAndroidWidget,
      iosBuilder: _buildIosWidget,
      macosBuilder: _buildMacOsWidget,
      windowBuilder: _buildWindowWidget,
      linuxBuilder: _buildLinuxWidget,
      webBuilder: _buildWebWidget,
    );
  }
}

Widget Loading(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Center(child: Text('')),
        const Center(
          child: Text('Curberus Ai System', style: TextStyle(color: Colors.blue, fontSize: 30)),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 50,
              animation: true,
              lineHeight: 20.0,
              animationDuration: 1500,
              percent: 1,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.greenAccent,
            ),
          ),
        ),
        const Center(child: Text('')),
        const Center(child: Text('')),
      ],
    ),
  );
}
