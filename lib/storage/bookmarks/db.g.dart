// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Bookmark extends DataClass implements Insertable<Bookmark> {
  final String copyright;
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Bookmark(
      {required this.copyright,
      required this.date,
      required this.explanation,
      required this.hdurl,
      required this.mediaType,
      required this.serviceVersion,
      required this.title,
      required this.url,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['copyright'] = Variable<String>(copyright);
    map['date'] = Variable<String>(date);
    map['explanation'] = Variable<String>(explanation);
    map['hdurl'] = Variable<String>(hdurl);
    map['media_type'] = Variable<String>(mediaType);
    map['service_version'] = Variable<String>(serviceVersion);
    map['title'] = Variable<String>(title);
    map['url'] = Variable<String>(url);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BookmarksCompanion toCompanion(bool nullToAbsent) {
    return BookmarksCompanion(
      copyright: Value(copyright),
      date: Value(date),
      explanation: Value(explanation),
      hdurl: Value(hdurl),
      mediaType: Value(mediaType),
      serviceVersion: Value(serviceVersion),
      title: Value(title),
      url: Value(url),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Bookmark.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Bookmark(
      copyright: serializer.fromJson<String>(json['copyright']),
      date: serializer.fromJson<String>(json['date']),
      explanation: serializer.fromJson<String>(json['explanation']),
      hdurl: serializer.fromJson<String>(json['hdurl']),
      mediaType: serializer.fromJson<String>(json['mediaType']),
      serviceVersion: serializer.fromJson<String>(json['serviceVersion']),
      title: serializer.fromJson<String>(json['title']),
      url: serializer.fromJson<String>(json['url']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'copyright': serializer.toJson<String>(copyright),
      'date': serializer.toJson<String>(date),
      'explanation': serializer.toJson<String>(explanation),
      'hdurl': serializer.toJson<String>(hdurl),
      'mediaType': serializer.toJson<String>(mediaType),
      'serviceVersion': serializer.toJson<String>(serviceVersion),
      'title': serializer.toJson<String>(title),
      'url': serializer.toJson<String>(url),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Bookmark copyWith(
          {String? copyright,
          String? date,
          String? explanation,
          String? hdurl,
          String? mediaType,
          String? serviceVersion,
          String? title,
          String? url,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Bookmark(
        copyright: copyright ?? this.copyright,
        date: date ?? this.date,
        explanation: explanation ?? this.explanation,
        hdurl: hdurl ?? this.hdurl,
        mediaType: mediaType ?? this.mediaType,
        serviceVersion: serviceVersion ?? this.serviceVersion,
        title: title ?? this.title,
        url: url ?? this.url,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Bookmark(')
          ..write('copyright: $copyright, ')
          ..write('date: $date, ')
          ..write('explanation: $explanation, ')
          ..write('hdurl: $hdurl, ')
          ..write('mediaType: $mediaType, ')
          ..write('serviceVersion: $serviceVersion, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(copyright, date, explanation, hdurl,
      mediaType, serviceVersion, title, url, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Bookmark &&
          other.copyright == this.copyright &&
          other.date == this.date &&
          other.explanation == this.explanation &&
          other.hdurl == this.hdurl &&
          other.mediaType == this.mediaType &&
          other.serviceVersion == this.serviceVersion &&
          other.title == this.title &&
          other.url == this.url &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BookmarksCompanion extends UpdateCompanion<Bookmark> {
  final Value<String> copyright;
  final Value<String> date;
  final Value<String> explanation;
  final Value<String> hdurl;
  final Value<String> mediaType;
  final Value<String> serviceVersion;
  final Value<String> title;
  final Value<String> url;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BookmarksCompanion({
    this.copyright = const Value.absent(),
    this.date = const Value.absent(),
    this.explanation = const Value.absent(),
    this.hdurl = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.serviceVersion = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BookmarksCompanion.insert({
    required String copyright,
    required String date,
    required String explanation,
    required String hdurl,
    required String mediaType,
    required String serviceVersion,
    required String title,
    required String url,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : copyright = Value(copyright),
        date = Value(date),
        explanation = Value(explanation),
        hdurl = Value(hdurl),
        mediaType = Value(mediaType),
        serviceVersion = Value(serviceVersion),
        title = Value(title),
        url = Value(url);
  static Insertable<Bookmark> custom({
    Expression<String>? copyright,
    Expression<String>? date,
    Expression<String>? explanation,
    Expression<String>? hdurl,
    Expression<String>? mediaType,
    Expression<String>? serviceVersion,
    Expression<String>? title,
    Expression<String>? url,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (copyright != null) 'copyright': copyright,
      if (date != null) 'date': date,
      if (explanation != null) 'explanation': explanation,
      if (hdurl != null) 'hdurl': hdurl,
      if (mediaType != null) 'media_type': mediaType,
      if (serviceVersion != null) 'service_version': serviceVersion,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BookmarksCompanion copyWith(
      {Value<String>? copyright,
      Value<String>? date,
      Value<String>? explanation,
      Value<String>? hdurl,
      Value<String>? mediaType,
      Value<String>? serviceVersion,
      Value<String>? title,
      Value<String>? url,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return BookmarksCompanion(
      copyright: copyright ?? this.copyright,
      date: date ?? this.date,
      explanation: explanation ?? this.explanation,
      hdurl: hdurl ?? this.hdurl,
      mediaType: mediaType ?? this.mediaType,
      serviceVersion: serviceVersion ?? this.serviceVersion,
      title: title ?? this.title,
      url: url ?? this.url,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (copyright.present) {
      map['copyright'] = Variable<String>(copyright.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    if (hdurl.present) {
      map['hdurl'] = Variable<String>(hdurl.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<String>(mediaType.value);
    }
    if (serviceVersion.present) {
      map['service_version'] = Variable<String>(serviceVersion.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarksCompanion(')
          ..write('copyright: $copyright, ')
          ..write('date: $date, ')
          ..write('explanation: $explanation, ')
          ..write('hdurl: $hdurl, ')
          ..write('mediaType: $mediaType, ')
          ..write('serviceVersion: $serviceVersion, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $BookmarksTable extends Bookmarks
    with TableInfo<$BookmarksTable, Bookmark> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookmarksTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _copyrightMeta = const VerificationMeta('copyright');
  @override
  late final GeneratedColumn<String> copyright = GeneratedColumn<String>(
      'copyright', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _explanationMeta =
      const VerificationMeta('explanation');
  @override
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
      'explanation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _hdurlMeta = const VerificationMeta('hdurl');
  @override
  late final GeneratedColumn<String> hdurl = GeneratedColumn<String>(
      'hdurl', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _mediaTypeMeta = const VerificationMeta('mediaType');
  @override
  late final GeneratedColumn<String> mediaType = GeneratedColumn<String>(
      'media_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _serviceVersionMeta =
      const VerificationMeta('serviceVersion');
  @override
  late final GeneratedColumn<String> serviceVersion = GeneratedColumn<String>(
      'service_version', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        copyright,
        date,
        explanation,
        hdurl,
        mediaType,
        serviceVersion,
        title,
        url,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'bookmarks';
  @override
  String get actualTableName => 'bookmarks';
  @override
  VerificationContext validateIntegrity(Insertable<Bookmark> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('copyright')) {
      context.handle(_copyrightMeta,
          copyright.isAcceptableOrUnknown(data['copyright']!, _copyrightMeta));
    } else if (isInserting) {
      context.missing(_copyrightMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('explanation')) {
      context.handle(
          _explanationMeta,
          explanation.isAcceptableOrUnknown(
              data['explanation']!, _explanationMeta));
    } else if (isInserting) {
      context.missing(_explanationMeta);
    }
    if (data.containsKey('hdurl')) {
      context.handle(
          _hdurlMeta, hdurl.isAcceptableOrUnknown(data['hdurl']!, _hdurlMeta));
    } else if (isInserting) {
      context.missing(_hdurlMeta);
    }
    if (data.containsKey('media_type')) {
      context.handle(_mediaTypeMeta,
          mediaType.isAcceptableOrUnknown(data['media_type']!, _mediaTypeMeta));
    } else if (isInserting) {
      context.missing(_mediaTypeMeta);
    }
    if (data.containsKey('service_version')) {
      context.handle(
          _serviceVersionMeta,
          serviceVersion.isAcceptableOrUnknown(
              data['service_version']!, _serviceVersionMeta));
    } else if (isInserting) {
      context.missing(_serviceVersionMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date};
  @override
  Bookmark map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Bookmark(
      copyright: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}copyright'])!,
      date: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
      explanation: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}explanation'])!,
      hdurl: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}hdurl'])!,
      mediaType: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}media_type'])!,
      serviceVersion: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}service_version'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      url: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $BookmarksTable createAlias(String alias) {
    return $BookmarksTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabase.connect(DatabaseConnection c) : super.connect(c);
  late final $BookmarksTable bookmarks = $BookmarksTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [bookmarks];
}
