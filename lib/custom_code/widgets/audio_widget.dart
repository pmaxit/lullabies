// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:just_audio/just_audio.dart';

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import '../../flutter_flow/flutter_flow_icon_button.dart';
import 'index.dart'; // Imports other custom widgets

import 'package:flutter_hooks/flutter_hooks.dart';

import '../../flutter_flow/flutter_flow_widgets.dart';

class AudioWidget extends HookWidget {
  //const AudioWidget({Key? key}) : super(key: key);

  const AudioWidget({
    Key? key,
    this.width,
    this.height,
    required this.song,
    required this.play,
    required this.songs,
  }) : super();

  final double? width;
  final double? height;
  final SongsRecord song;
  final bool play;
  final List<DocumentReference> songs;

  @override
  Widget build(BuildContext context) {
    final sliderValue = useState<double>(0);

    final _audioPlayer = useMemoized(() => AudioPlayer(), const []);
    // create audio player
    useEffect(() {
      _audioPlayer.setUrl(song.url!);
      _audioPlayer.play();
      return () => _audioPlayer.dispose();
    }, [_audioPlayer]);

    // listen to audio player position changes
    useEffect(() {
      final subscription = _audioPlayer.positionStream.listen((position) {
        sliderValue.value = position.inSeconds.toDouble();
      });
      // listen to duration changes
      final durationSubscription =
          _audioPlayer.durationStream.listen((duration) {
        sliderValue.value = duration!.inSeconds.toDouble();
      });

      // add slider listener
      final sliderSubscription = sliderValue.addListener(() {
        _audioPlayer.seek(Duration(seconds: sliderValue.value.toInt()));
      });

      return () {
        subscription.cancel();
        durationSubscription.cancel();
      };
    }, const []);

    // play/pause audio
    useEffect(() {
      if (play) {
        _audioPlayer.play();
      } else {
        _audioPlayer.pause();
      }
      return () => _audioPlayer.dispose();
    }, [play]);

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Slider(
              activeColor: FlutterFlowTheme.of(context).primary,
              inactiveColor: FlutterFlowTheme.of(context).accent2,
              min: 0,
              max: 10,
              value: sliderValue.value ??= 0,
              onChanged: (newValue) {
                newValue = double.parse(newValue.toStringAsFixed(4));
                sliderValue.value = newValue;
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(18, 0, 23, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '00:00',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  Text(
                    '00:09',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 100,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.45, 0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 100,
                        icon: Icon(
                          Icons.skip_previous,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.05, 0),
                      child: FlutterFlowIconButton(
                        key: ValueKey(play),
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 100,
                        icon: play
                            ? Icon(
                                Icons.pause_circle_filled,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 100,
                              )
                            : Icon(
                                Icons.play_circle_fill,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 100,
                              ),
                        onPressed: () {
                          FFAppState().update(() {
                            FFAppState().play = !play;
                          });
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.65, 0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 100,
                        icon: Icon(
                          Icons.skip_next_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 70,
                        icon: Icon(
                          Icons.loop_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
