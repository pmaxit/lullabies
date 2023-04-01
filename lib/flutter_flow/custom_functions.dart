import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

bool isPlaying(
  DocumentReference currentSong,
  DocumentReference song,
  bool play,
) {
  return !play || song == currentSong;
}

DocumentReference getNextSong(
  DocumentReference song,
  List<DocumentReference> songs,
) {
  int index = songs.indexWhere((element) => element == song);

  // get next song
  final nextSong = songs[(index + 1) % (songs.length)];
  return nextSong;
}

DocumentReference getPreviousSong(
  List<DocumentReference> songs,
  DocumentReference currentSong,
) {
  var index = songs.indexWhere((element) => element == currentSong);

  if (index == 0) {
    index = songs.length;
  }
  // get next song
  var previousSong = songs[(index - 1) % (songs.length)];
  return previousSong;
}
