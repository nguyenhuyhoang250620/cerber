import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'camera_RTSP/single_tab.dart';
import './camera_RTSP/single_tab.dart';

class CameraRTSP extends StatelessWidget {
  const CameraRTSP({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VLC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        child: SingleTab(),
      ),
    );
  }
}
