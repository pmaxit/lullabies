import '/backend/backend.dart';
import '/components/audiowidget_widget.dart';
import '/components/song_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlaylistModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for audiowidget component.
  late AudiowidgetModel audiowidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    audiowidgetModel = createModel(context, () => AudiowidgetModel());
  }

  void dispose() {
    audiowidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
