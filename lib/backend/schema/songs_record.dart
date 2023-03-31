import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'songs_record.g.dart';

abstract class SongsRecord implements Built<SongsRecord, SongsRecordBuilder> {
  static Serializer<SongsRecord> get serializer => _$songsRecordSerializer;

  String? get name;

  String? get youtube;

  String? get cover;

  String? get url;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SongsRecordBuilder builder) => builder
    ..name = ''
    ..youtube = ''
    ..cover = ''
    ..url = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('songs');

  static Stream<SongsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SongsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SongsRecord._();
  factory SongsRecord([void Function(SongsRecordBuilder) updates]) =
      _$SongsRecord;

  static SongsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSongsRecordData({
  String? name,
  String? youtube,
  String? cover,
  String? url,
}) {
  final firestoreData = serializers.toFirestore(
    SongsRecord.serializer,
    SongsRecord(
      (s) => s
        ..name = name
        ..youtube = youtube
        ..cover = cover
        ..url = url,
    ),
  );

  return firestoreData;
}
