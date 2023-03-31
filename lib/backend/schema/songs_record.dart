import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'songs_record.g.dart';

abstract class SongsRecord implements Built<SongsRecord, SongsRecordBuilder> {
  static Serializer<SongsRecord> get serializer => _$songsRecordSerializer;

  String? get cover;

  String? get name;

  String? get url;

  String? get youtube;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SongsRecordBuilder builder) => builder
    ..cover = ''
    ..name = ''
    ..url = ''
    ..youtube = '';

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
  String? cover,
  String? name,
  String? url,
  String? youtube,
}) {
  final firestoreData = serializers.toFirestore(
    SongsRecord.serializer,
    SongsRecord(
      (s) => s
        ..cover = cover
        ..name = name
        ..url = url
        ..youtube = youtube,
    ),
  );

  return firestoreData;
}
