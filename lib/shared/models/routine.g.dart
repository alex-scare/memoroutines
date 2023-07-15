// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRoutineCollection on Isar {
  IsarCollection<Routine> get routines => this.collection();
}

const RoutineSchema = CollectionSchema(
  name: r'Routine',
  id: 9144663503541703680,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'frequency': PropertySchema(
      id: 1,
      name: r'frequency',
      type: IsarType.string,
      enumMap: _RoutinefrequencyEnumValueMap,
    ),
    r'isFlexible': PropertySchema(
      id: 2,
      name: r'isFlexible',
      type: IsarType.bool,
    ),
    r'metaData': PropertySchema(
      id: 3,
      name: r'metaData',
      type: IsarType.object,
      target: r'RoutineMetaData',
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'notifications': PropertySchema(
      id: 5,
      name: r'notifications',
      type: IsarType.bool,
    ),
    r'repetitionsNumberToComplete': PropertySchema(
      id: 6,
      name: r'repetitionsNumberToComplete',
      type: IsarType.long,
    ),
    r'singleRepetitionDuration': PropertySchema(
      id: 7,
      name: r'singleRepetitionDuration',
      type: IsarType.long,
    ),
    r'stats': PropertySchema(
      id: 8,
      name: r'stats',
      type: IsarType.object,
      target: r'RoutineStats',
    ),
    r'status': PropertySchema(
      id: 9,
      name: r'status',
      type: IsarType.string,
      enumMap: _RoutinestatusEnumValueMap,
    ),
    r'timesPerPeriod': PropertySchema(
      id: 10,
      name: r'timesPerPeriod',
      type: IsarType.long,
    )
  },
  estimateSize: _routineEstimateSize,
  serialize: _routineSerialize,
  deserialize: _routineDeserialize,
  deserializeProp: _routineDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'completions': LinkSchema(
      id: -2116845057547117351,
      name: r'completions',
      target: r'Completion',
      single: false,
    )
  },
  embeddedSchemas: {
    r'RoutineMetaData': RoutineMetaDataSchema,
    r'RoutineStats': RoutineStatsSchema
  },
  getId: _routineGetId,
  getLinks: _routineGetLinks,
  attach: _routineAttach,
  version: '3.1.0+1',
);

int _routineEstimateSize(
  Routine object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.frequency.name.length * 3;
  bytesCount += 3 +
      RoutineMetaDataSchema.estimateSize(
          object.metaData, allOffsets[RoutineMetaData]!, allOffsets);
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 +
      RoutineStatsSchema.estimateSize(
          object.stats, allOffsets[RoutineStats]!, allOffsets);
  bytesCount += 3 + object.status.name.length * 3;
  return bytesCount;
}

void _routineSerialize(
  Routine object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeString(offsets[1], object.frequency.name);
  writer.writeBool(offsets[2], object.isFlexible);
  writer.writeObject<RoutineMetaData>(
    offsets[3],
    allOffsets,
    RoutineMetaDataSchema.serialize,
    object.metaData,
  );
  writer.writeString(offsets[4], object.name);
  writer.writeBool(offsets[5], object.notifications);
  writer.writeLong(offsets[6], object.repetitionsNumberToComplete);
  writer.writeLong(offsets[7], object.singleRepetitionDuration);
  writer.writeObject<RoutineStats>(
    offsets[8],
    allOffsets,
    RoutineStatsSchema.serialize,
    object.stats,
  );
  writer.writeString(offsets[9], object.status.name);
  writer.writeLong(offsets[10], object.timesPerPeriod);
}

Routine _routineDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Routine(
    description: reader.readString(offsets[0]),
    frequency:
        _RoutinefrequencyValueEnumMap[reader.readStringOrNull(offsets[1])] ??
            RoutineFrequency.daily,
    isFlexible: reader.readBoolOrNull(offsets[2]) ?? false,
    name: reader.readString(offsets[4]),
    notifications: reader.readBoolOrNull(offsets[5]) ?? false,
    repetitionsNumberToComplete: reader.readLongOrNull(offsets[6]) ?? 30,
    singleRepetitionDuration: reader.readLongOrNull(offsets[7]) ?? 30,
    status: _RoutinestatusValueEnumMap[reader.readStringOrNull(offsets[9])] ??
        RoutineStatus.active,
    timesPerPeriod: reader.readLongOrNull(offsets[10]) ?? 1,
  );
  object.id = id;
  object.metaData = reader.readObjectOrNull<RoutineMetaData>(
        offsets[3],
        RoutineMetaDataSchema.deserialize,
        allOffsets,
      ) ??
      RoutineMetaData();
  object.stats = reader.readObjectOrNull<RoutineStats>(
        offsets[8],
        RoutineStatsSchema.deserialize,
        allOffsets,
      ) ??
      RoutineStats();
  return object;
}

P _routineDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_RoutinefrequencyValueEnumMap[reader.readStringOrNull(offset)] ??
          RoutineFrequency.daily) as P;
    case 2:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 3:
      return (reader.readObjectOrNull<RoutineMetaData>(
            offset,
            RoutineMetaDataSchema.deserialize,
            allOffsets,
          ) ??
          RoutineMetaData()) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 6:
      return (reader.readLongOrNull(offset) ?? 30) as P;
    case 7:
      return (reader.readLongOrNull(offset) ?? 30) as P;
    case 8:
      return (reader.readObjectOrNull<RoutineStats>(
            offset,
            RoutineStatsSchema.deserialize,
            allOffsets,
          ) ??
          RoutineStats()) as P;
    case 9:
      return (_RoutinestatusValueEnumMap[reader.readStringOrNull(offset)] ??
          RoutineStatus.active) as P;
    case 10:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RoutinefrequencyEnumValueMap = {
  r'daily': r'daily',
  r'dayAfterDay': r'dayAfterDay',
  r'weekly': r'weekly',
  r'monthly': r'monthly',
  r'yearly': r'yearly',
};
const _RoutinefrequencyValueEnumMap = {
  r'daily': RoutineFrequency.daily,
  r'dayAfterDay': RoutineFrequency.dayAfterDay,
  r'weekly': RoutineFrequency.weekly,
  r'monthly': RoutineFrequency.monthly,
  r'yearly': RoutineFrequency.yearly,
};
const _RoutinestatusEnumValueMap = {
  r'active': r'active',
  r'paused': r'paused',
  r'completed': r'completed',
  r'archived': r'archived',
};
const _RoutinestatusValueEnumMap = {
  r'active': RoutineStatus.active,
  r'paused': RoutineStatus.paused,
  r'completed': RoutineStatus.completed,
  r'archived': RoutineStatus.archived,
};

Id _routineGetId(Routine object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _routineGetLinks(Routine object) {
  return [object.completions];
}

void _routineAttach(IsarCollection<dynamic> col, Id id, Routine object) {
  object.id = id;
  object.completions
      .attach(col, col.isar.collection<Completion>(), r'completions', id);
}

extension RoutineQueryWhereSort on QueryBuilder<Routine, Routine, QWhere> {
  QueryBuilder<Routine, Routine, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RoutineQueryWhere on QueryBuilder<Routine, Routine, QWhereClause> {
  QueryBuilder<Routine, Routine, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Routine, Routine, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Routine, Routine, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Routine, Routine, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RoutineQueryFilter
    on QueryBuilder<Routine, Routine, QFilterCondition> {
  QueryBuilder<Routine, Routine, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> frequencyEqualTo(
    RoutineFrequency value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> frequencyGreaterThan(
    RoutineFrequency value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> frequencyLessThan(
    RoutineFrequency value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> frequencyBetween(
    RoutineFrequency lower,
    RoutineFrequency upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frequency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> frequencyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> frequencyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> frequencyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> frequencyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frequency',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> frequencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frequency',
        value: '',
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> frequencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frequency',
        value: '',
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> isFlexibleEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFlexible',
        value: value,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> notificationsEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notifications',
        value: value,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      repetitionsNumberToCompleteEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repetitionsNumberToComplete',
        value: value,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      repetitionsNumberToCompleteGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'repetitionsNumberToComplete',
        value: value,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      repetitionsNumberToCompleteLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'repetitionsNumberToComplete',
        value: value,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      repetitionsNumberToCompleteBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'repetitionsNumberToComplete',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      singleRepetitionDurationEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'singleRepetitionDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      singleRepetitionDurationGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'singleRepetitionDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      singleRepetitionDurationLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'singleRepetitionDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      singleRepetitionDurationBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'singleRepetitionDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> statusEqualTo(
    RoutineStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> statusGreaterThan(
    RoutineStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> statusLessThan(
    RoutineStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> statusBetween(
    RoutineStatus lower,
    RoutineStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> timesPerPeriodEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timesPerPeriod',
        value: value,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      timesPerPeriodGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timesPerPeriod',
        value: value,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> timesPerPeriodLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timesPerPeriod',
        value: value,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> timesPerPeriodBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timesPerPeriod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RoutineQueryObject
    on QueryBuilder<Routine, Routine, QFilterCondition> {
  QueryBuilder<Routine, Routine, QAfterFilterCondition> metaData(
      FilterQuery<RoutineMetaData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'metaData');
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> stats(
      FilterQuery<RoutineStats> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'stats');
    });
  }
}

extension RoutineQueryLinks
    on QueryBuilder<Routine, Routine, QFilterCondition> {
  QueryBuilder<Routine, Routine, QAfterFilterCondition> completions(
      FilterQuery<Completion> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'completions');
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      completionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'completions', length, true, length, true);
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> completionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'completions', 0, true, 0, true);
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      completionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'completions', 0, false, 999999, true);
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      completionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'completions', 0, true, length, include);
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      completionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'completions', length, include, 999999, true);
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      completionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'completions', lower, includeLower, upper, includeUpper);
    });
  }
}

extension RoutineQuerySortBy on QueryBuilder<Routine, Routine, QSortBy> {
  QueryBuilder<Routine, Routine, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.desc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByIsFlexible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFlexible', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByIsFlexibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFlexible', Sort.desc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifications', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByNotificationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifications', Sort.desc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy>
      sortByRepetitionsNumberToComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repetitionsNumberToComplete', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy>
      sortByRepetitionsNumberToCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repetitionsNumberToComplete', Sort.desc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy>
      sortBySingleRepetitionDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'singleRepetitionDuration', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy>
      sortBySingleRepetitionDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'singleRepetitionDuration', Sort.desc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByTimesPerPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesPerPeriod', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByTimesPerPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesPerPeriod', Sort.desc);
    });
  }
}

extension RoutineQuerySortThenBy
    on QueryBuilder<Routine, Routine, QSortThenBy> {
  QueryBuilder<Routine, Routine, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.desc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByIsFlexible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFlexible', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByIsFlexibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFlexible', Sort.desc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifications', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByNotificationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifications', Sort.desc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy>
      thenByRepetitionsNumberToComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repetitionsNumberToComplete', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy>
      thenByRepetitionsNumberToCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repetitionsNumberToComplete', Sort.desc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy>
      thenBySingleRepetitionDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'singleRepetitionDuration', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy>
      thenBySingleRepetitionDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'singleRepetitionDuration', Sort.desc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByTimesPerPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesPerPeriod', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByTimesPerPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesPerPeriod', Sort.desc);
    });
  }
}

extension RoutineQueryWhereDistinct
    on QueryBuilder<Routine, Routine, QDistinct> {
  QueryBuilder<Routine, Routine, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Routine, Routine, QDistinct> distinctByFrequency(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frequency', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Routine, Routine, QDistinct> distinctByIsFlexible() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFlexible');
    });
  }

  QueryBuilder<Routine, Routine, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Routine, Routine, QDistinct> distinctByNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notifications');
    });
  }

  QueryBuilder<Routine, Routine, QDistinct>
      distinctByRepetitionsNumberToComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repetitionsNumberToComplete');
    });
  }

  QueryBuilder<Routine, Routine, QDistinct>
      distinctBySingleRepetitionDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'singleRepetitionDuration');
    });
  }

  QueryBuilder<Routine, Routine, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Routine, Routine, QDistinct> distinctByTimesPerPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timesPerPeriod');
    });
  }
}

extension RoutineQueryProperty
    on QueryBuilder<Routine, Routine, QQueryProperty> {
  QueryBuilder<Routine, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Routine, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Routine, RoutineFrequency, QQueryOperations>
      frequencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frequency');
    });
  }

  QueryBuilder<Routine, bool, QQueryOperations> isFlexibleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFlexible');
    });
  }

  QueryBuilder<Routine, RoutineMetaData, QQueryOperations> metaDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metaData');
    });
  }

  QueryBuilder<Routine, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Routine, bool, QQueryOperations> notificationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notifications');
    });
  }

  QueryBuilder<Routine, int, QQueryOperations>
      repetitionsNumberToCompleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repetitionsNumberToComplete');
    });
  }

  QueryBuilder<Routine, int, QQueryOperations>
      singleRepetitionDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'singleRepetitionDuration');
    });
  }

  QueryBuilder<Routine, RoutineStats, QQueryOperations> statsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stats');
    });
  }

  QueryBuilder<Routine, RoutineStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Routine, int, QQueryOperations> timesPerPeriodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timesPerPeriod');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const RoutineMetaDataSchema = Schema(
  name: r'RoutineMetaData',
  id: 8708798876081192830,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dayOfMonth': PropertySchema(
      id: 1,
      name: r'dayOfMonth',
      type: IsarType.long,
    ),
    r'daysOfWeek': PropertySchema(
      id: 2,
      name: r'daysOfWeek',
      type: IsarType.longList,
    ),
    r'lastDoneAt': PropertySchema(
      id: 3,
      name: r'lastDoneAt',
      type: IsarType.dateTime,
    ),
    r'updatedAt': PropertySchema(
      id: 4,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'yearlyRoutineDate': PropertySchema(
      id: 5,
      name: r'yearlyRoutineDate',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _routineMetaDataEstimateSize,
  serialize: _routineMetaDataSerialize,
  deserialize: _routineMetaDataDeserialize,
  deserializeProp: _routineMetaDataDeserializeProp,
);

int _routineMetaDataEstimateSize(
  RoutineMetaData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.daysOfWeek.length * 8;
  return bytesCount;
}

void _routineMetaDataSerialize(
  RoutineMetaData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeLong(offsets[1], object.dayOfMonth);
  writer.writeLongList(offsets[2], object.daysOfWeek);
  writer.writeDateTime(offsets[3], object.lastDoneAt);
  writer.writeDateTime(offsets[4], object.updatedAt);
  writer.writeDateTime(offsets[5], object.yearlyRoutineDate);
}

RoutineMetaData _routineMetaDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RoutineMetaData();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.dayOfMonth = reader.readLongOrNull(offsets[1]);
  object.daysOfWeek = reader.readLongList(offsets[2]) ?? [];
  object.lastDoneAt = reader.readDateTimeOrNull(offsets[3]);
  object.updatedAt = reader.readDateTime(offsets[4]);
  object.yearlyRoutineDate = reader.readDateTimeOrNull(offsets[5]);
  return object;
}

P _routineMetaDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongList(offset) ?? []) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension RoutineMetaDataQueryFilter
    on QueryBuilder<RoutineMetaData, RoutineMetaData, QFilterCondition> {
  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      dayOfMonthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dayOfMonth',
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      dayOfMonthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dayOfMonth',
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      dayOfMonthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      dayOfMonthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      dayOfMonthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      dayOfMonthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dayOfMonth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      daysOfWeekElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'daysOfWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      daysOfWeekElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'daysOfWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      daysOfWeekElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'daysOfWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      daysOfWeekElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'daysOfWeek',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      daysOfWeekLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfWeek',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      daysOfWeekIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfWeek',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      daysOfWeekIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfWeek',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      daysOfWeekLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfWeek',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      daysOfWeekLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfWeek',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      daysOfWeekLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfWeek',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      lastDoneAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastDoneAt',
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      lastDoneAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastDoneAt',
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      lastDoneAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastDoneAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      lastDoneAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastDoneAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      lastDoneAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastDoneAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      lastDoneAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastDoneAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      yearlyRoutineDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'yearlyRoutineDate',
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      yearlyRoutineDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'yearlyRoutineDate',
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      yearlyRoutineDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yearlyRoutineDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      yearlyRoutineDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'yearlyRoutineDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      yearlyRoutineDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'yearlyRoutineDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      yearlyRoutineDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'yearlyRoutineDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RoutineMetaDataQueryObject
    on QueryBuilder<RoutineMetaData, RoutineMetaData, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const RoutineStatsSchema = Schema(
  name: r'RoutineStats',
  id: 3135902264215478807,
  properties: {
    r'currentStreak': PropertySchema(
      id: 0,
      name: r'currentStreak',
      type: IsarType.long,
    ),
    r'longestStreak': PropertySchema(
      id: 1,
      name: r'longestStreak',
      type: IsarType.long,
    ),
    r'timesCompleted': PropertySchema(
      id: 2,
      name: r'timesCompleted',
      type: IsarType.long,
    ),
    r'timesMissed': PropertySchema(
      id: 3,
      name: r'timesMissed',
      type: IsarType.long,
    )
  },
  estimateSize: _routineStatsEstimateSize,
  serialize: _routineStatsSerialize,
  deserialize: _routineStatsDeserialize,
  deserializeProp: _routineStatsDeserializeProp,
);

int _routineStatsEstimateSize(
  RoutineStats object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _routineStatsSerialize(
  RoutineStats object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.currentStreak);
  writer.writeLong(offsets[1], object.longestStreak);
  writer.writeLong(offsets[2], object.timesCompleted);
  writer.writeLong(offsets[3], object.timesMissed);
}

RoutineStats _routineStatsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RoutineStats(
    currentStreak: reader.readLongOrNull(offsets[0]) ?? 0,
    longestStreak: reader.readLongOrNull(offsets[1]) ?? 0,
    timesCompleted: reader.readLongOrNull(offsets[2]) ?? 0,
    timesMissed: reader.readLongOrNull(offsets[3]) ?? 0,
  );
  return object;
}

P _routineStatsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 3:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension RoutineStatsQueryFilter
    on QueryBuilder<RoutineStats, RoutineStats, QFilterCondition> {
  QueryBuilder<RoutineStats, RoutineStats, QAfterFilterCondition>
      currentStreakEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentStreak',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineStats, RoutineStats, QAfterFilterCondition>
      currentStreakGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentStreak',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineStats, RoutineStats, QAfterFilterCondition>
      currentStreakLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentStreak',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineStats, RoutineStats, QAfterFilterCondition>
      currentStreakBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentStreak',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoutineStats, RoutineStats, QAfterFilterCondition>
      longestStreakEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longestStreak',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineStats, RoutineStats, QAfterFilterCondition>
      longestStreakGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longestStreak',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineStats, RoutineStats, QAfterFilterCondition>
      longestStreakLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longestStreak',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineStats, RoutineStats, QAfterFilterCondition>
      longestStreakBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longestStreak',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoutineStats, RoutineStats, QAfterFilterCondition>
      timesCompletedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timesCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineStats, RoutineStats, QAfterFilterCondition>
      timesCompletedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timesCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineStats, RoutineStats, QAfterFilterCondition>
      timesCompletedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timesCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineStats, RoutineStats, QAfterFilterCondition>
      timesCompletedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timesCompleted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoutineStats, RoutineStats, QAfterFilterCondition>
      timesMissedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timesMissed',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineStats, RoutineStats, QAfterFilterCondition>
      timesMissedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timesMissed',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineStats, RoutineStats, QAfterFilterCondition>
      timesMissedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timesMissed',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineStats, RoutineStats, QAfterFilterCondition>
      timesMissedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timesMissed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RoutineStatsQueryObject
    on QueryBuilder<RoutineStats, RoutineStats, QFilterCondition> {}
