import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:path_provider/path_provider.dart';

import 'video_data.dart';

class SingleTab extends StatefulWidget {
  @override
  _SingleTabState createState() => _SingleTabState();
}

class _SingleTabState extends State<SingleTab> {
  late VlcPlayerController _controller;

  //
  late List<VideoData> listVideos;
  late int selectedVideoIndex;

  Future<File> _loadVideoToFs() async {
    final videoData = await rootBundle.load('assets/sample.mp4');
    final videoBytes = Uint8List.view(videoData.buffer);
    var dir = (await getTemporaryDirectory()).path;
    var temp = File('$dir/temp.file');
    temp.writeAsBytesSync(videoBytes);
    return temp;
  }

  void fillVideos() {
    listVideos = <VideoData>[];
    //
    listVideos.add(VideoData(
      name: 'Network Video 1',
      path: 'rtsp://admin:Bkav@1357@210.245.52.48:17854/profile1/live',
      type: VideoType.network,
    ));
  }

  @override
  void initState() {
    super.initState();

    //
    fillVideos();
    selectedVideoIndex = 0;
    //
    var initVideo = listVideos[selectedVideoIndex];
    _controller = VlcPlayerController.network(
      initVideo.path,
      hwAcc: HwAcc.full,
      options: VlcPlayerOptions(
        advanced: VlcAdvancedOptions([
          VlcAdvancedOptions.networkCaching(2000),
        ]),
        subtitle: VlcSubtitleOptions([
          VlcSubtitleOptions.boldStyle(true),
          VlcSubtitleOptions.fontSize(30),
          VlcSubtitleOptions.outlineColor(VlcSubtitleColor.yellow),
          VlcSubtitleOptions.outlineThickness(VlcSubtitleThickness.normal),
          // works only on externally added subtitles
          VlcSubtitleOptions.color(VlcSubtitleColor.navy),
        ]),
        http: VlcHttpOptions([
          VlcHttpOptions.httpReconnect(true),
        ]),
        rtp: VlcRtpOptions([
          VlcRtpOptions.rtpOverRtsp(true),
        ]),
      ),
    );
    _controller.addOnInitListener(() async {
      await _controller.startRendererScanning();
    });
    _controller.addOnRendererEventListener((type, id, name) {
      print('OnRendererEventListener $type $id $name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            height: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Center(
                          child: VlcPlayer(
                            controller: _controller,
                            aspectRatio: 16 / 9,
                            placeholder: Center(child: CircularProgressIndicator()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }

  @override
  void dispose() async {
    super.dispose();
    await _controller.stopRecording();
    await _controller.stopRendererScanning();
    await _controller.dispose();
  }
}
