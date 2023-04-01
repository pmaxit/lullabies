// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:just_audio/just_audio.dart';

import 'index.dart'; // Imports other custom widgets

import '../../flutter_flow/flutter_flow_icon_button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';

String formatDuration(Duration duration) {
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);
  return '$minutes:${seconds.toString().padLeft(2, '0')}';
}

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
    final durationValue = useState<double>(0);

    final _audioPlayer = useMemoized(() => AudioPlayer(), const []);
    final loop = useState<bool>(false);

    // create audio player
    useEffect(() {
      _audioPlayer.setUrl(song.url!);
      if (play)
        _audioPlayer.play();
      else
        _audioPlayer.pause();
      return null;
    }, [_audioPlayer, song]);

    // listen to audio player position changes
    useEffect(() {
      final subscription = _audioPlayer.positionStream.listen((position) {
        sliderValue.value = position.inSeconds.toDouble();
      });
      // listen to duration changes
      final durationSubscription =
          _audioPlayer.durationStream.listen((duration) {
        durationValue.value = duration!.inSeconds.toDouble();
      });

      // listen to audio player state changes
      final stateSubscription = _audioPlayer.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          if (loop.value) {
            _audioPlayer.seek(Duration.zero);
            _audioPlayer.play();
          } else {
            FFAppState().update(() {
              FFAppState().currentsong = getNextSong(song.reference, songs);
              _audioPlayer.play();
            });
          }
        }
      });
      return () {
        subscription.cancel();
        durationSubscription.cancel();
        stateSubscription.cancel();
      };
    }, const []);

    // play/pause audio
    useEffect(() {
      if (play) {
        _audioPlayer.play();
      } else {
        _audioPlayer.pause();
      }
      return null;
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
              max: durationValue.value,
              value: sliderValue.value ??= 0,
              onChanged: (newValue) {
                newValue = double.parse(newValue.toStringAsFixed(4));
                sliderValue.value = newValue;
              },
              onChangeEnd: (value) {
                _audioPlayer.seek(Duration(seconds: value.toInt()));
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(18, 0, 23, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HookBuilder(
                    builder: (context) => Text(
                      formatDuration(
                          Duration(seconds: sliderValue.value.toInt())),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                  HookBuilder(
                    builder: (context) => Text(
                      formatDuration(
                          Duration(seconds: durationValue.value.toInt())),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
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
                            FFAppState().update(() {
                              FFAppState().currentsong =
                                  getPreviousSong(songs, song.reference);
                            });
                          }),
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
                          FFAppState().update(() {
                            FFAppState().currentsong =
                                getNextSong(song.reference, songs);
                          });
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: FlutterFlowIconButton(
                        key: ValueKey(loop.value),
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 70,
                        icon: loop.value
                            ? Icon(
                                Icons.repeat_one_on_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 40,
                              )
                            : Icon(
                                Icons.repeat,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 40,
                              ),
                        onPressed: () {
                          loop.value = !loop.value;
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
