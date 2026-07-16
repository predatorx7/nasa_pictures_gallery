// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class ApodEntries extends Table with TableInfo<ApodEntries, ApodEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ApodEntries(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _copyrightMeta = const VerificationMeta(
    'copyright',
  );
  late final GeneratedColumn<String> copyright = GeneratedColumn<String>(
    'copyright',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _explanationMeta = const VerificationMeta(
    'explanation',
  );
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
    'explanation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _hdurlMeta = const VerificationMeta('hdurl');
  late final GeneratedColumn<String> hdurl = GeneratedColumn<String>(
    'hdurl',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _mediaTypeMeta = const VerificationMeta(
    'mediaType',
  );
  late final GeneratedColumn<String> mediaType = GeneratedColumn<String>(
    'media_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _serviceVersionMeta = const VerificationMeta(
    'serviceVersion',
  );
  late final GeneratedColumn<String> serviceVersion = GeneratedColumn<String>(
    'service_version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _fetchedAtMeta = const VerificationMeta(
    'fetchedAt',
  );
  late final GeneratedColumn<DateTime> fetchedAt = GeneratedColumn<DateTime>(
    'fetched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints:
        'NOT NULL DEFAULT (CAST(strftime(\'%s\', \'now\') AS INTEGER))',
    defaultValue: const CustomExpression(
      'CAST(strftime(\'%s\', \'now\') AS INTEGER)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    date,
    copyright,
    explanation,
    hdurl,
    mediaType,
    serviceVersion,
    title,
    url,
    fetchedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'apod_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<ApodEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('copyright')) {
      context.handle(
        _copyrightMeta,
        copyright.isAcceptableOrUnknown(data['copyright']!, _copyrightMeta),
      );
    }
    if (data.containsKey('explanation')) {
      context.handle(
        _explanationMeta,
        explanation.isAcceptableOrUnknown(
          data['explanation']!,
          _explanationMeta,
        ),
      );
    }
    if (data.containsKey('hdurl')) {
      context.handle(
        _hdurlMeta,
        hdurl.isAcceptableOrUnknown(data['hdurl']!, _hdurlMeta),
      );
    }
    if (data.containsKey('media_type')) {
      context.handle(
        _mediaTypeMeta,
        mediaType.isAcceptableOrUnknown(data['media_type']!, _mediaTypeMeta),
      );
    }
    if (data.containsKey('service_version')) {
      context.handle(
        _serviceVersionMeta,
        serviceVersion.isAcceptableOrUnknown(
          data['service_version']!,
          _serviceVersionMeta,
        ),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('fetched_at')) {
      context.handle(
        _fetchedAtMeta,
        fetchedAt.isAcceptableOrUnknown(data['fetched_at']!, _fetchedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date};
  @override
  ApodEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ApodEntry(
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      copyright: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}copyright'],
      ),
      explanation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}explanation'],
      ),
      hdurl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hdurl'],
      ),
      mediaType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_type'],
      ),
      serviceVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}service_version'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      fetchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fetched_at'],
      )!,
    );
  }

  @override
  ApodEntries createAlias(String alias) {
    return ApodEntries(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ApodEntry extends DataClass implements Insertable<ApodEntry> {
  final String date;
  final String? copyright;
  final String? explanation;
  final String? hdurl;
  final String? mediaType;
  final String? serviceVersion;
  final String? title;
  final String? url;
  final DateTime fetchedAt;
  const ApodEntry({
    required this.date,
    this.copyright,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
    required this.fetchedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<String>(date);
    if (!nullToAbsent || copyright != null) {
      map['copyright'] = Variable<String>(copyright);
    }
    if (!nullToAbsent || explanation != null) {
      map['explanation'] = Variable<String>(explanation);
    }
    if (!nullToAbsent || hdurl != null) {
      map['hdurl'] = Variable<String>(hdurl);
    }
    if (!nullToAbsent || mediaType != null) {
      map['media_type'] = Variable<String>(mediaType);
    }
    if (!nullToAbsent || serviceVersion != null) {
      map['service_version'] = Variable<String>(serviceVersion);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    map['fetched_at'] = Variable<DateTime>(fetchedAt);
    return map;
  }

  ApodEntriesCompanion toCompanion(bool nullToAbsent) {
    return ApodEntriesCompanion(
      date: Value(date),
      copyright: copyright == null && nullToAbsent
          ? const Value.absent()
          : Value(copyright),
      explanation: explanation == null && nullToAbsent
          ? const Value.absent()
          : Value(explanation),
      hdurl: hdurl == null && nullToAbsent
          ? const Value.absent()
          : Value(hdurl),
      mediaType: mediaType == null && nullToAbsent
          ? const Value.absent()
          : Value(mediaType),
      serviceVersion: serviceVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(serviceVersion),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      fetchedAt: Value(fetchedAt),
    );
  }

  factory ApodEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ApodEntry(
      date: serializer.fromJson<String>(json['date']),
      copyright: serializer.fromJson<String?>(json['copyright']),
      explanation: serializer.fromJson<String?>(json['explanation']),
      hdurl: serializer.fromJson<String?>(json['hdurl']),
      mediaType: serializer.fromJson<String?>(json['media_type']),
      serviceVersion: serializer.fromJson<String?>(json['service_version']),
      title: serializer.fromJson<String?>(json['title']),
      url: serializer.fromJson<String?>(json['url']),
      fetchedAt: serializer.fromJson<DateTime>(json['fetched_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<String>(date),
      'copyright': serializer.toJson<String?>(copyright),
      'explanation': serializer.toJson<String?>(explanation),
      'hdurl': serializer.toJson<String?>(hdurl),
      'media_type': serializer.toJson<String?>(mediaType),
      'service_version': serializer.toJson<String?>(serviceVersion),
      'title': serializer.toJson<String?>(title),
      'url': serializer.toJson<String?>(url),
      'fetched_at': serializer.toJson<DateTime>(fetchedAt),
    };
  }

  ApodEntry copyWith({
    String? date,
    Value<String?> copyright = const Value.absent(),
    Value<String?> explanation = const Value.absent(),
    Value<String?> hdurl = const Value.absent(),
    Value<String?> mediaType = const Value.absent(),
    Value<String?> serviceVersion = const Value.absent(),
    Value<String?> title = const Value.absent(),
    Value<String?> url = const Value.absent(),
    DateTime? fetchedAt,
  }) => ApodEntry(
    date: date ?? this.date,
    copyright: copyright.present ? copyright.value : this.copyright,
    explanation: explanation.present ? explanation.value : this.explanation,
    hdurl: hdurl.present ? hdurl.value : this.hdurl,
    mediaType: mediaType.present ? mediaType.value : this.mediaType,
    serviceVersion: serviceVersion.present
        ? serviceVersion.value
        : this.serviceVersion,
    title: title.present ? title.value : this.title,
    url: url.present ? url.value : this.url,
    fetchedAt: fetchedAt ?? this.fetchedAt,
  );
  ApodEntry copyWithCompanion(ApodEntriesCompanion data) {
    return ApodEntry(
      date: data.date.present ? data.date.value : this.date,
      copyright: data.copyright.present ? data.copyright.value : this.copyright,
      explanation: data.explanation.present
          ? data.explanation.value
          : this.explanation,
      hdurl: data.hdurl.present ? data.hdurl.value : this.hdurl,
      mediaType: data.mediaType.present ? data.mediaType.value : this.mediaType,
      serviceVersion: data.serviceVersion.present
          ? data.serviceVersion.value
          : this.serviceVersion,
      title: data.title.present ? data.title.value : this.title,
      url: data.url.present ? data.url.value : this.url,
      fetchedAt: data.fetchedAt.present ? data.fetchedAt.value : this.fetchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ApodEntry(')
          ..write('date: $date, ')
          ..write('copyright: $copyright, ')
          ..write('explanation: $explanation, ')
          ..write('hdurl: $hdurl, ')
          ..write('mediaType: $mediaType, ')
          ..write('serviceVersion: $serviceVersion, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('fetchedAt: $fetchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    date,
    copyright,
    explanation,
    hdurl,
    mediaType,
    serviceVersion,
    title,
    url,
    fetchedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ApodEntry &&
          other.date == this.date &&
          other.copyright == this.copyright &&
          other.explanation == this.explanation &&
          other.hdurl == this.hdurl &&
          other.mediaType == this.mediaType &&
          other.serviceVersion == this.serviceVersion &&
          other.title == this.title &&
          other.url == this.url &&
          other.fetchedAt == this.fetchedAt);
}

class ApodEntriesCompanion extends UpdateCompanion<ApodEntry> {
  final Value<String> date;
  final Value<String?> copyright;
  final Value<String?> explanation;
  final Value<String?> hdurl;
  final Value<String?> mediaType;
  final Value<String?> serviceVersion;
  final Value<String?> title;
  final Value<String?> url;
  final Value<DateTime> fetchedAt;
  final Value<int> rowid;
  const ApodEntriesCompanion({
    this.date = const Value.absent(),
    this.copyright = const Value.absent(),
    this.explanation = const Value.absent(),
    this.hdurl = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.serviceVersion = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.fetchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ApodEntriesCompanion.insert({
    required String date,
    this.copyright = const Value.absent(),
    this.explanation = const Value.absent(),
    this.hdurl = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.serviceVersion = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.fetchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : date = Value(date);
  static Insertable<ApodEntry> custom({
    Expression<String>? date,
    Expression<String>? copyright,
    Expression<String>? explanation,
    Expression<String>? hdurl,
    Expression<String>? mediaType,
    Expression<String>? serviceVersion,
    Expression<String>? title,
    Expression<String>? url,
    Expression<DateTime>? fetchedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (copyright != null) 'copyright': copyright,
      if (explanation != null) 'explanation': explanation,
      if (hdurl != null) 'hdurl': hdurl,
      if (mediaType != null) 'media_type': mediaType,
      if (serviceVersion != null) 'service_version': serviceVersion,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
      if (fetchedAt != null) 'fetched_at': fetchedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ApodEntriesCompanion copyWith({
    Value<String>? date,
    Value<String?>? copyright,
    Value<String?>? explanation,
    Value<String?>? hdurl,
    Value<String?>? mediaType,
    Value<String?>? serviceVersion,
    Value<String?>? title,
    Value<String?>? url,
    Value<DateTime>? fetchedAt,
    Value<int>? rowid,
  }) {
    return ApodEntriesCompanion(
      date: date ?? this.date,
      copyright: copyright ?? this.copyright,
      explanation: explanation ?? this.explanation,
      hdurl: hdurl ?? this.hdurl,
      mediaType: mediaType ?? this.mediaType,
      serviceVersion: serviceVersion ?? this.serviceVersion,
      title: title ?? this.title,
      url: url ?? this.url,
      fetchedAt: fetchedAt ?? this.fetchedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (copyright.present) {
      map['copyright'] = Variable<String>(copyright.value);
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
    if (fetchedAt.present) {
      map['fetched_at'] = Variable<DateTime>(fetchedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ApodEntriesCompanion(')
          ..write('date: $date, ')
          ..write('copyright: $copyright, ')
          ..write('explanation: $explanation, ')
          ..write('hdurl: $hdurl, ')
          ..write('mediaType: $mediaType, ')
          ..write('serviceVersion: $serviceVersion, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('fetchedAt: $fetchedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Bookmarks extends Table with TableInfo<Bookmarks, Bookmark> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Bookmarks(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _copyrightMeta = const VerificationMeta(
    'copyright',
  );
  late final GeneratedColumn<String> copyright = GeneratedColumn<String>(
    'copyright',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _explanationMeta = const VerificationMeta(
    'explanation',
  );
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
    'explanation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _hdurlMeta = const VerificationMeta('hdurl');
  late final GeneratedColumn<String> hdurl = GeneratedColumn<String>(
    'hdurl',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _mediaTypeMeta = const VerificationMeta(
    'mediaType',
  );
  late final GeneratedColumn<String> mediaType = GeneratedColumn<String>(
    'media_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _serviceVersionMeta = const VerificationMeta(
    'serviceVersion',
  );
  late final GeneratedColumn<String> serviceVersion = GeneratedColumn<String>(
    'service_version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints:
        'NOT NULL DEFAULT (CAST(strftime(\'%s\', \'now\') AS INTEGER))',
    defaultValue: const CustomExpression(
      'CAST(strftime(\'%s\', \'now\') AS INTEGER)',
    ),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints:
        'NOT NULL DEFAULT (CAST(strftime(\'%s\', \'now\') AS INTEGER))',
    defaultValue: const CustomExpression(
      'CAST(strftime(\'%s\', \'now\') AS INTEGER)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    date,
    copyright,
    explanation,
    hdurl,
    mediaType,
    serviceVersion,
    title,
    url,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmarks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Bookmark> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('copyright')) {
      context.handle(
        _copyrightMeta,
        copyright.isAcceptableOrUnknown(data['copyright']!, _copyrightMeta),
      );
    }
    if (data.containsKey('explanation')) {
      context.handle(
        _explanationMeta,
        explanation.isAcceptableOrUnknown(
          data['explanation']!,
          _explanationMeta,
        ),
      );
    }
    if (data.containsKey('hdurl')) {
      context.handle(
        _hdurlMeta,
        hdurl.isAcceptableOrUnknown(data['hdurl']!, _hdurlMeta),
      );
    }
    if (data.containsKey('media_type')) {
      context.handle(
        _mediaTypeMeta,
        mediaType.isAcceptableOrUnknown(data['media_type']!, _mediaTypeMeta),
      );
    }
    if (data.containsKey('service_version')) {
      context.handle(
        _serviceVersionMeta,
        serviceVersion.isAcceptableOrUnknown(
          data['service_version']!,
          _serviceVersionMeta,
        ),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date};
  @override
  Bookmark map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Bookmark(
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      copyright: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}copyright'],
      ),
      explanation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}explanation'],
      ),
      hdurl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hdurl'],
      ),
      mediaType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_type'],
      ),
      serviceVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}service_version'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  Bookmarks createAlias(String alias) {
    return Bookmarks(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Bookmark extends DataClass implements Insertable<Bookmark> {
  final String date;
  final String? copyright;
  final String? explanation;
  final String? hdurl;
  final String? mediaType;
  final String? serviceVersion;
  final String? title;
  final String? url;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Bookmark({
    required this.date,
    this.copyright,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<String>(date);
    if (!nullToAbsent || copyright != null) {
      map['copyright'] = Variable<String>(copyright);
    }
    if (!nullToAbsent || explanation != null) {
      map['explanation'] = Variable<String>(explanation);
    }
    if (!nullToAbsent || hdurl != null) {
      map['hdurl'] = Variable<String>(hdurl);
    }
    if (!nullToAbsent || mediaType != null) {
      map['media_type'] = Variable<String>(mediaType);
    }
    if (!nullToAbsent || serviceVersion != null) {
      map['service_version'] = Variable<String>(serviceVersion);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BookmarksCompanion toCompanion(bool nullToAbsent) {
    return BookmarksCompanion(
      date: Value(date),
      copyright: copyright == null && nullToAbsent
          ? const Value.absent()
          : Value(copyright),
      explanation: explanation == null && nullToAbsent
          ? const Value.absent()
          : Value(explanation),
      hdurl: hdurl == null && nullToAbsent
          ? const Value.absent()
          : Value(hdurl),
      mediaType: mediaType == null && nullToAbsent
          ? const Value.absent()
          : Value(mediaType),
      serviceVersion: serviceVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(serviceVersion),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Bookmark.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Bookmark(
      date: serializer.fromJson<String>(json['date']),
      copyright: serializer.fromJson<String?>(json['copyright']),
      explanation: serializer.fromJson<String?>(json['explanation']),
      hdurl: serializer.fromJson<String?>(json['hdurl']),
      mediaType: serializer.fromJson<String?>(json['media_type']),
      serviceVersion: serializer.fromJson<String?>(json['service_version']),
      title: serializer.fromJson<String?>(json['title']),
      url: serializer.fromJson<String?>(json['url']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<String>(date),
      'copyright': serializer.toJson<String?>(copyright),
      'explanation': serializer.toJson<String?>(explanation),
      'hdurl': serializer.toJson<String?>(hdurl),
      'media_type': serializer.toJson<String?>(mediaType),
      'service_version': serializer.toJson<String?>(serviceVersion),
      'title': serializer.toJson<String?>(title),
      'url': serializer.toJson<String?>(url),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Bookmark copyWith({
    String? date,
    Value<String?> copyright = const Value.absent(),
    Value<String?> explanation = const Value.absent(),
    Value<String?> hdurl = const Value.absent(),
    Value<String?> mediaType = const Value.absent(),
    Value<String?> serviceVersion = const Value.absent(),
    Value<String?> title = const Value.absent(),
    Value<String?> url = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Bookmark(
    date: date ?? this.date,
    copyright: copyright.present ? copyright.value : this.copyright,
    explanation: explanation.present ? explanation.value : this.explanation,
    hdurl: hdurl.present ? hdurl.value : this.hdurl,
    mediaType: mediaType.present ? mediaType.value : this.mediaType,
    serviceVersion: serviceVersion.present
        ? serviceVersion.value
        : this.serviceVersion,
    title: title.present ? title.value : this.title,
    url: url.present ? url.value : this.url,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Bookmark copyWithCompanion(BookmarksCompanion data) {
    return Bookmark(
      date: data.date.present ? data.date.value : this.date,
      copyright: data.copyright.present ? data.copyright.value : this.copyright,
      explanation: data.explanation.present
          ? data.explanation.value
          : this.explanation,
      hdurl: data.hdurl.present ? data.hdurl.value : this.hdurl,
      mediaType: data.mediaType.present ? data.mediaType.value : this.mediaType,
      serviceVersion: data.serviceVersion.present
          ? data.serviceVersion.value
          : this.serviceVersion,
      title: data.title.present ? data.title.value : this.title,
      url: data.url.present ? data.url.value : this.url,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Bookmark(')
          ..write('date: $date, ')
          ..write('copyright: $copyright, ')
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
  int get hashCode => Object.hash(
    date,
    copyright,
    explanation,
    hdurl,
    mediaType,
    serviceVersion,
    title,
    url,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Bookmark &&
          other.date == this.date &&
          other.copyright == this.copyright &&
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
  final Value<String> date;
  final Value<String?> copyright;
  final Value<String?> explanation;
  final Value<String?> hdurl;
  final Value<String?> mediaType;
  final Value<String?> serviceVersion;
  final Value<String?> title;
  final Value<String?> url;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const BookmarksCompanion({
    this.date = const Value.absent(),
    this.copyright = const Value.absent(),
    this.explanation = const Value.absent(),
    this.hdurl = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.serviceVersion = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BookmarksCompanion.insert({
    required String date,
    this.copyright = const Value.absent(),
    this.explanation = const Value.absent(),
    this.hdurl = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.serviceVersion = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : date = Value(date);
  static Insertable<Bookmark> custom({
    Expression<String>? date,
    Expression<String>? copyright,
    Expression<String>? explanation,
    Expression<String>? hdurl,
    Expression<String>? mediaType,
    Expression<String>? serviceVersion,
    Expression<String>? title,
    Expression<String>? url,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (copyright != null) 'copyright': copyright,
      if (explanation != null) 'explanation': explanation,
      if (hdurl != null) 'hdurl': hdurl,
      if (mediaType != null) 'media_type': mediaType,
      if (serviceVersion != null) 'service_version': serviceVersion,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BookmarksCompanion copyWith({
    Value<String>? date,
    Value<String?>? copyright,
    Value<String?>? explanation,
    Value<String?>? hdurl,
    Value<String?>? mediaType,
    Value<String?>? serviceVersion,
    Value<String?>? title,
    Value<String?>? url,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return BookmarksCompanion(
      date: date ?? this.date,
      copyright: copyright ?? this.copyright,
      explanation: explanation ?? this.explanation,
      hdurl: hdurl ?? this.hdurl,
      mediaType: mediaType ?? this.mediaType,
      serviceVersion: serviceVersion ?? this.serviceVersion,
      title: title ?? this.title,
      url: url ?? this.url,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (copyright.present) {
      map['copyright'] = Variable<String>(copyright.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarksCompanion(')
          ..write('date: $date, ')
          ..write('copyright: $copyright, ')
          ..write('explanation: $explanation, ')
          ..write('hdurl: $hdurl, ')
          ..write('mediaType: $mediaType, ')
          ..write('serviceVersion: $serviceVersion, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabase.connect(DatabaseConnection c) : super.connect(c);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final ApodEntries apodEntries = ApodEntries(this);
  late final Bookmarks bookmarks = Bookmarks(this);
  Selectable<ApodEntry> getApodEntriesInRange(
    String startDate,
    String endDate,
  ) {
    return customSelect(
      'SELECT * FROM apod_entries WHERE date >= ?1 AND date <= ?2 ORDER BY date DESC',
      variables: [Variable<String>(startDate), Variable<String>(endDate)],
      readsFrom: {apodEntries},
    ).asyncMap(apodEntries.mapFromRow);
  }

  Selectable<ApodEntry> getApodEntryByDate(String date) {
    return customSelect(
      'SELECT * FROM apod_entries WHERE date = ?1',
      variables: [Variable<String>(date)],
      readsFrom: {apodEntries},
    ).asyncMap(apodEntries.mapFromRow);
  }

  Future<int> upsertApodEntry(
    String date,
    String? copyright,
    String? explanation,
    String? hdurl,
    String? mediaType,
    String? serviceVersion,
    String? title,
    String? url,
  ) {
    return customInsert(
      'INSERT INTO apod_entries (date, copyright, explanation, hdurl, media_type, service_version, title, url, fetched_at) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, CAST(strftime(\'%s\', \'now\') AS INTEGER)) ON CONFLICT (date) DO UPDATE SET copyright = ?2, explanation = ?3, hdurl = ?4, media_type = ?5, service_version = ?6, title = ?7, url = ?8, fetched_at = CAST(strftime(\'%s\', \'now\') AS INTEGER)',
      variables: [
        Variable<String>(date),
        Variable<String>(copyright),
        Variable<String>(explanation),
        Variable<String>(hdurl),
        Variable<String>(mediaType),
        Variable<String>(serviceVersion),
        Variable<String>(title),
        Variable<String>(url),
      ],
      updates: {apodEntries},
    );
  }

  Selectable<Bookmark> getAllBookmarks() {
    return customSelect(
      'SELECT * FROM bookmarks ORDER BY date DESC',
      variables: [],
      readsFrom: {bookmarks},
    ).asyncMap(bookmarks.mapFromRow);
  }

  Selectable<Bookmark> getBookmarkByDate(String date) {
    return customSelect(
      'SELECT * FROM bookmarks WHERE date = ?1',
      variables: [Variable<String>(date)],
      readsFrom: {bookmarks},
    ).asyncMap(bookmarks.mapFromRow);
  }

  Future<int> upsertBookmark(
    String date,
    String? copyright,
    String? explanation,
    String? hdurl,
    String? mediaType,
    String? serviceVersion,
    String? title,
    String? url,
  ) {
    return customInsert(
      'INSERT INTO bookmarks (date, copyright, explanation, hdurl, media_type, service_version, title, url, updated_at) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, CAST(strftime(\'%s\', \'now\') AS INTEGER)) ON CONFLICT (date) DO UPDATE SET copyright = ?2, explanation = ?3, hdurl = ?4, media_type = ?5, service_version = ?6, title = ?7, url = ?8, updated_at = CAST(strftime(\'%s\', \'now\') AS INTEGER)',
      variables: [
        Variable<String>(date),
        Variable<String>(copyright),
        Variable<String>(explanation),
        Variable<String>(hdurl),
        Variable<String>(mediaType),
        Variable<String>(serviceVersion),
        Variable<String>(title),
        Variable<String>(url),
      ],
      updates: {bookmarks},
    );
  }

  Future<int> deleteBookmarkByDate(String date) {
    return customUpdate(
      'DELETE FROM bookmarks WHERE date = ?1',
      variables: [Variable<String>(date)],
      updates: {bookmarks},
      updateKind: UpdateKind.delete,
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [apodEntries, bookmarks];
}

typedef $ApodEntriesCreateCompanionBuilder =
    ApodEntriesCompanion Function({
      required String date,
      Value<String?> copyright,
      Value<String?> explanation,
      Value<String?> hdurl,
      Value<String?> mediaType,
      Value<String?> serviceVersion,
      Value<String?> title,
      Value<String?> url,
      Value<DateTime> fetchedAt,
      Value<int> rowid,
    });
typedef $ApodEntriesUpdateCompanionBuilder =
    ApodEntriesCompanion Function({
      Value<String> date,
      Value<String?> copyright,
      Value<String?> explanation,
      Value<String?> hdurl,
      Value<String?> mediaType,
      Value<String?> serviceVersion,
      Value<String?> title,
      Value<String?> url,
      Value<DateTime> fetchedAt,
      Value<int> rowid,
    });

class $ApodEntriesFilterComposer extends Composer<_$AppDatabase, ApodEntries> {
  $ApodEntriesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get copyright => $composableBuilder(
    column: $table.copyright,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hdurl => $composableBuilder(
    column: $table.hdurl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mediaType => $composableBuilder(
    column: $table.mediaType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serviceVersion => $composableBuilder(
    column: $table.serviceVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $ApodEntriesOrderingComposer
    extends Composer<_$AppDatabase, ApodEntries> {
  $ApodEntriesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get copyright => $composableBuilder(
    column: $table.copyright,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hdurl => $composableBuilder(
    column: $table.hdurl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mediaType => $composableBuilder(
    column: $table.mediaType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serviceVersion => $composableBuilder(
    column: $table.serviceVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $ApodEntriesAnnotationComposer
    extends Composer<_$AppDatabase, ApodEntries> {
  $ApodEntriesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get copyright =>
      $composableBuilder(column: $table.copyright, builder: (column) => column);

  GeneratedColumn<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hdurl =>
      $composableBuilder(column: $table.hdurl, builder: (column) => column);

  GeneratedColumn<String> get mediaType =>
      $composableBuilder(column: $table.mediaType, builder: (column) => column);

  GeneratedColumn<String> get serviceVersion => $composableBuilder(
    column: $table.serviceVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<DateTime> get fetchedAt =>
      $composableBuilder(column: $table.fetchedAt, builder: (column) => column);
}

class $ApodEntriesTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          ApodEntries,
          ApodEntry,
          $ApodEntriesFilterComposer,
          $ApodEntriesOrderingComposer,
          $ApodEntriesAnnotationComposer,
          $ApodEntriesCreateCompanionBuilder,
          $ApodEntriesUpdateCompanionBuilder,
          (ApodEntry, BaseReferences<_$AppDatabase, ApodEntries, ApodEntry>),
          ApodEntry,
          PrefetchHooks Function()
        > {
  $ApodEntriesTableManager(_$AppDatabase db, ApodEntries table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $ApodEntriesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $ApodEntriesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $ApodEntriesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> date = const Value.absent(),
                Value<String?> copyright = const Value.absent(),
                Value<String?> explanation = const Value.absent(),
                Value<String?> hdurl = const Value.absent(),
                Value<String?> mediaType = const Value.absent(),
                Value<String?> serviceVersion = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<DateTime> fetchedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ApodEntriesCompanion(
                date: date,
                copyright: copyright,
                explanation: explanation,
                hdurl: hdurl,
                mediaType: mediaType,
                serviceVersion: serviceVersion,
                title: title,
                url: url,
                fetchedAt: fetchedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String date,
                Value<String?> copyright = const Value.absent(),
                Value<String?> explanation = const Value.absent(),
                Value<String?> hdurl = const Value.absent(),
                Value<String?> mediaType = const Value.absent(),
                Value<String?> serviceVersion = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<DateTime> fetchedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ApodEntriesCompanion.insert(
                date: date,
                copyright: copyright,
                explanation: explanation,
                hdurl: hdurl,
                mediaType: mediaType,
                serviceVersion: serviceVersion,
                title: title,
                url: url,
                fetchedAt: fetchedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $ApodEntriesProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      ApodEntries,
      ApodEntry,
      $ApodEntriesFilterComposer,
      $ApodEntriesOrderingComposer,
      $ApodEntriesAnnotationComposer,
      $ApodEntriesCreateCompanionBuilder,
      $ApodEntriesUpdateCompanionBuilder,
      (ApodEntry, BaseReferences<_$AppDatabase, ApodEntries, ApodEntry>),
      ApodEntry,
      PrefetchHooks Function()
    >;
typedef $BookmarksCreateCompanionBuilder =
    BookmarksCompanion Function({
      required String date,
      Value<String?> copyright,
      Value<String?> explanation,
      Value<String?> hdurl,
      Value<String?> mediaType,
      Value<String?> serviceVersion,
      Value<String?> title,
      Value<String?> url,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $BookmarksUpdateCompanionBuilder =
    BookmarksCompanion Function({
      Value<String> date,
      Value<String?> copyright,
      Value<String?> explanation,
      Value<String?> hdurl,
      Value<String?> mediaType,
      Value<String?> serviceVersion,
      Value<String?> title,
      Value<String?> url,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $BookmarksFilterComposer extends Composer<_$AppDatabase, Bookmarks> {
  $BookmarksFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get copyright => $composableBuilder(
    column: $table.copyright,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hdurl => $composableBuilder(
    column: $table.hdurl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mediaType => $composableBuilder(
    column: $table.mediaType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serviceVersion => $composableBuilder(
    column: $table.serviceVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $BookmarksOrderingComposer extends Composer<_$AppDatabase, Bookmarks> {
  $BookmarksOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get copyright => $composableBuilder(
    column: $table.copyright,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hdurl => $composableBuilder(
    column: $table.hdurl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mediaType => $composableBuilder(
    column: $table.mediaType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serviceVersion => $composableBuilder(
    column: $table.serviceVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $BookmarksAnnotationComposer extends Composer<_$AppDatabase, Bookmarks> {
  $BookmarksAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get copyright =>
      $composableBuilder(column: $table.copyright, builder: (column) => column);

  GeneratedColumn<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hdurl =>
      $composableBuilder(column: $table.hdurl, builder: (column) => column);

  GeneratedColumn<String> get mediaType =>
      $composableBuilder(column: $table.mediaType, builder: (column) => column);

  GeneratedColumn<String> get serviceVersion => $composableBuilder(
    column: $table.serviceVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $BookmarksTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Bookmarks,
          Bookmark,
          $BookmarksFilterComposer,
          $BookmarksOrderingComposer,
          $BookmarksAnnotationComposer,
          $BookmarksCreateCompanionBuilder,
          $BookmarksUpdateCompanionBuilder,
          (Bookmark, BaseReferences<_$AppDatabase, Bookmarks, Bookmark>),
          Bookmark,
          PrefetchHooks Function()
        > {
  $BookmarksTableManager(_$AppDatabase db, Bookmarks table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $BookmarksFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $BookmarksOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $BookmarksAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> date = const Value.absent(),
                Value<String?> copyright = const Value.absent(),
                Value<String?> explanation = const Value.absent(),
                Value<String?> hdurl = const Value.absent(),
                Value<String?> mediaType = const Value.absent(),
                Value<String?> serviceVersion = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BookmarksCompanion(
                date: date,
                copyright: copyright,
                explanation: explanation,
                hdurl: hdurl,
                mediaType: mediaType,
                serviceVersion: serviceVersion,
                title: title,
                url: url,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String date,
                Value<String?> copyright = const Value.absent(),
                Value<String?> explanation = const Value.absent(),
                Value<String?> hdurl = const Value.absent(),
                Value<String?> mediaType = const Value.absent(),
                Value<String?> serviceVersion = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BookmarksCompanion.insert(
                date: date,
                copyright: copyright,
                explanation: explanation,
                hdurl: hdurl,
                mediaType: mediaType,
                serviceVersion: serviceVersion,
                title: title,
                url: url,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $BookmarksProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Bookmarks,
      Bookmark,
      $BookmarksFilterComposer,
      $BookmarksOrderingComposer,
      $BookmarksAnnotationComposer,
      $BookmarksCreateCompanionBuilder,
      $BookmarksUpdateCompanionBuilder,
      (Bookmark, BaseReferences<_$AppDatabase, Bookmarks, Bookmark>),
      Bookmark,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $ApodEntriesTableManager get apodEntries =>
      $ApodEntriesTableManager(_db, _db.apodEntries);
  $BookmarksTableManager get bookmarks =>
      $BookmarksTableManager(_db, _db.bookmarks);
}
