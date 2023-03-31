// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SongsRecord> _$songsRecordSerializer = new _$SongsRecordSerializer();

class _$SongsRecordSerializer implements StructuredSerializer<SongsRecord> {
  @override
  final Iterable<Type> types = const [SongsRecord, _$SongsRecord];
  @override
  final String wireName = 'SongsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SongsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.youtube;
    if (value != null) {
      result
        ..add('youtube')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cover;
    if (value != null) {
      result
        ..add('cover')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  SongsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SongsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'youtube':
          result.youtube = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cover':
          result.cover = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$SongsRecord extends SongsRecord {
  @override
  final String? name;
  @override
  final String? youtube;
  @override
  final String? cover;
  @override
  final String? url;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SongsRecord([void Function(SongsRecordBuilder)? updates]) =>
      (new SongsRecordBuilder()..update(updates))._build();

  _$SongsRecord._({this.name, this.youtube, this.cover, this.url, this.ffRef})
      : super._();

  @override
  SongsRecord rebuild(void Function(SongsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SongsRecordBuilder toBuilder() => new SongsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SongsRecord &&
        name == other.name &&
        youtube == other.youtube &&
        cover == other.cover &&
        url == other.url &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, youtube.hashCode);
    _$hash = $jc(_$hash, cover.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SongsRecord')
          ..add('name', name)
          ..add('youtube', youtube)
          ..add('cover', cover)
          ..add('url', url)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SongsRecordBuilder implements Builder<SongsRecord, SongsRecordBuilder> {
  _$SongsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _youtube;
  String? get youtube => _$this._youtube;
  set youtube(String? youtube) => _$this._youtube = youtube;

  String? _cover;
  String? get cover => _$this._cover;
  set cover(String? cover) => _$this._cover = cover;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SongsRecordBuilder() {
    SongsRecord._initializeBuilder(this);
  }

  SongsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _youtube = $v.youtube;
      _cover = $v.cover;
      _url = $v.url;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SongsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SongsRecord;
  }

  @override
  void update(void Function(SongsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SongsRecord build() => _build();

  _$SongsRecord _build() {
    final _$result = _$v ??
        new _$SongsRecord._(
            name: name, youtube: youtube, cover: cover, url: url, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
