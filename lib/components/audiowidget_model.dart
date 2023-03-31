import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AudiowidgetModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String? playtime;

  String? durationtime;

  SongsRecord? song;

  bool? play;

  List<DocumentReference> songs = [];
  void addToSongs(DocumentReference item) => songs.add(item);
  void removeFromSongs(DocumentReference item) => songs.remove(item);
  void removeAtIndexFromSongs(int index) => songs.removeAt(index);

  ///  State fields for stateful widgets in this component.

  // State field(s) for Slider widget.
  double? sliderValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
