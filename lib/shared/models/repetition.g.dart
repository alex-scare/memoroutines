// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repetition.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRepetitionCollection on Isar {
  IsarCollection<Repetition> get repetitions => this.collection();
}

const RepetitionSchema = CollectionSchema(
  name: r'Repetition',
  id: 3953275675774205543,
  properties: {
    r'deviationFromPlannedDuration': PropertySchema(
      id: 0,
      name: r'deviationFromPlannedDuration',
      type: IsarType.long,
    ),
    r'performedAt': PropertySchema(
      id: 1,
      name: r'performedAt',
      type: IsarType.dateTime,
    ),
    r'scheduledCompletionDate': PropertySchema(
      id: 2,
      name: r'scheduledCompletionDate',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 3,
      name: r'status',
      type: IsarType.string,
      enumMap: _RepetitionstatusEnumValueMap,
    )
  },
  estimateSize: _repetitionEstimateSize,
  serialize: _repetitionSerialize,
  deserialize: _repetitionDeserialize,
  deserializeProp: _repetitionDeserializeProp,
  idName: r'id',
  indexes: {
    r'scheduledCompletionDate': IndexSchema(
      id: -9188762129815993713,
      name: r'scheduledCompletionDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'scheduledCompletionDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'routine': LinkSchema(
      id: 613267370174553022,
      name: r'routine',
      target: r'Routine',
      single: true,
      linkName: r'repetitions',
    )
  },
  embeddedSchemas: {},
  getId: _repetitionGetId,
  getLinks: _repetitionGetLinks,
  attach: _repetitionAttach,
  version: '3.1.0+1',
);

int _repetitionEstimateSize(
  Repetition object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.status.name.length * 3;
  return bytesCount;
}

void _repetitionSerialize(
  Repetition object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.deviationFromPlannedDuration);
  writer.writeDateTime(offsets[1], object.performedAt);
  writer.writeDateTime(offsets[2], object.scheduledCompletionDate);
  writer.writeString(offsets[3], object.status.name);
}

Repetition _repetitionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Repetition(
    performedAt: reader.readDateTimeOrNull(offsets[1]),
    scheduledCompletionDate: reader.readDateTime(offsets[2]),
    status:
        _RepetitionstatusValueEnumMap[reader.readStringOrNull(offsets[3])] ??
            RepetitionStatus.upcoming,
  );
  object.deviationFromPlannedDuration = reader.readLongOrNull(offsets[0]);
  object.id = id;
  return object;
}

P _repetitionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (_RepetitionstatusValueEnumMap[reader.readStringOrNull(offset)] ??
          RepetitionStatus.upcoming) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RepetitionstatusEnumValueMap = {
  r'completed': r'completed',
  r'missed': r'missed',
  r'upcoming': r'upcoming',
  r'skipped': r'skipped',
};
const _RepetitionstatusValueEnumMap = {
  r'completed': RepetitionStatus.completed,
  r'missed': RepetitionStatus.missed,
  r'upcoming': RepetitionStatus.upcoming,
  r'skipped': RepetitionStatus.skipped,
};

Id _repetitionGetId(Repetition object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _repetitionGetLinks(Repetition object) {
  return [object.routine];
}

void _repetitionAttach(IsarCollection<dynamic> col, Id id, Repetition object) {
  object.id = id;
  object.routine.attach(col, col.isar.collection<Routine>(), r'routine', id);
}

extension RepetitionQueryWhereSort
    on QueryBuilder<Repetition, Repetition, QWhere> {
  QueryBuilder<Repetition, Repetition, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterWhere>
      anyScheduledCompletionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'scheduledCompletionDate'),
      );
    });
  }
}

extension RepetitionQueryWhere
    on QueryBuilder<Repetition, Repetition, QWhereClause> {
  QueryBuilder<Repetition, Repetition, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Repetition, Repetition, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterWhereClause> idBetween(
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

  QueryBuilder<Repetition, Repetition, QAfterWhereClause>
      scheduledCompletionDateEqualTo(DateTime scheduledCompletionDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'scheduledCompletionDate',
        value: [scheduledCompletionDate],
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterWhereClause>
      scheduledCompletionDateNotEqualTo(DateTime scheduledCompletionDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scheduledCompletionDate',
              lower: [],
              upper: [scheduledCompletionDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scheduledCompletionDate',
              lower: [scheduledCompletionDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scheduledCompletionDate',
              lower: [scheduledCompletionDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scheduledCompletionDate',
              lower: [],
              upper: [scheduledCompletionDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterWhereClause>
      scheduledCompletionDateGreaterThan(
    DateTime scheduledCompletionDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scheduledCompletionDate',
        lower: [scheduledCompletionDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterWhereClause>
      scheduledCompletionDateLessThan(
    DateTime scheduledCompletionDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scheduledCompletionDate',
        lower: [],
        upper: [scheduledCompletionDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterWhereClause>
      scheduledCompletionDateBetween(
    DateTime lowerScheduledCompletionDate,
    DateTime upperScheduledCompletionDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scheduledCompletionDate',
        lower: [lowerScheduledCompletionDate],
        includeLower: includeLower,
        upper: [upperScheduledCompletionDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RepetitionQueryFilter
    on QueryBuilder<Repetition, Repetition, QFilterCondition> {
  QueryBuilder<Repetition, Repetition, QAfterFilterCondition>
      deviationFromPlannedDurationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deviationFromPlannedDuration',
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition>
      deviationFromPlannedDurationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deviationFromPlannedDuration',
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition>
      deviationFromPlannedDurationEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviationFromPlannedDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition>
      deviationFromPlannedDurationGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviationFromPlannedDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition>
      deviationFromPlannedDurationLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviationFromPlannedDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition>
      deviationFromPlannedDurationBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviationFromPlannedDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition>
      performedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'performedAt',
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition>
      performedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'performedAt',
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition>
      performedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'performedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition>
      performedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'performedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition>
      performedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'performedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition>
      performedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'performedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition>
      scheduledCompletionDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduledCompletionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition>
      scheduledCompletionDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scheduledCompletionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition>
      scheduledCompletionDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scheduledCompletionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition>
      scheduledCompletionDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scheduledCompletionDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition> statusEqualTo(
    RepetitionStatus value, {
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

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition> statusGreaterThan(
    RepetitionStatus value, {
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

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition> statusLessThan(
    RepetitionStatus value, {
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

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition> statusBetween(
    RepetitionStatus lower,
    RepetitionStatus upper, {
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

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition> statusContains(
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

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }
}

extension RepetitionQueryObject
    on QueryBuilder<Repetition, Repetition, QFilterCondition> {}

extension RepetitionQueryLinks
    on QueryBuilder<Repetition, Repetition, QFilterCondition> {
  QueryBuilder<Repetition, Repetition, QAfterFilterCondition> routine(
      FilterQuery<Routine> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'routine');
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterFilterCondition> routineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'routine', 0, true, 0, true);
    });
  }
}

extension RepetitionQuerySortBy
    on QueryBuilder<Repetition, Repetition, QSortBy> {
  QueryBuilder<Repetition, Repetition, QAfterSortBy>
      sortByDeviationFromPlannedDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviationFromPlannedDuration', Sort.asc);
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterSortBy>
      sortByDeviationFromPlannedDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviationFromPlannedDuration', Sort.desc);
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterSortBy> sortByPerformedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedAt', Sort.asc);
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterSortBy> sortByPerformedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedAt', Sort.desc);
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterSortBy>
      sortByScheduledCompletionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledCompletionDate', Sort.asc);
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterSortBy>
      sortByScheduledCompletionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledCompletionDate', Sort.desc);
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension RepetitionQuerySortThenBy
    on QueryBuilder<Repetition, Repetition, QSortThenBy> {
  QueryBuilder<Repetition, Repetition, QAfterSortBy>
      thenByDeviationFromPlannedDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviationFromPlannedDuration', Sort.asc);
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterSortBy>
      thenByDeviationFromPlannedDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviationFromPlannedDuration', Sort.desc);
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterSortBy> thenByPerformedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedAt', Sort.asc);
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterSortBy> thenByPerformedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedAt', Sort.desc);
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterSortBy>
      thenByScheduledCompletionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledCompletionDate', Sort.asc);
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterSortBy>
      thenByScheduledCompletionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledCompletionDate', Sort.desc);
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Repetition, Repetition, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension RepetitionQueryWhereDistinct
    on QueryBuilder<Repetition, Repetition, QDistinct> {
  QueryBuilder<Repetition, Repetition, QDistinct>
      distinctByDeviationFromPlannedDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviationFromPlannedDuration');
    });
  }

  QueryBuilder<Repetition, Repetition, QDistinct> distinctByPerformedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'performedAt');
    });
  }

  QueryBuilder<Repetition, Repetition, QDistinct>
      distinctByScheduledCompletionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduledCompletionDate');
    });
  }

  QueryBuilder<Repetition, Repetition, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }
}

extension RepetitionQueryProperty
    on QueryBuilder<Repetition, Repetition, QQueryProperty> {
  QueryBuilder<Repetition, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Repetition, int?, QQueryOperations>
      deviationFromPlannedDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviationFromPlannedDuration');
    });
  }

  QueryBuilder<Repetition, DateTime?, QQueryOperations> performedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'performedAt');
    });
  }

  QueryBuilder<Repetition, DateTime, QQueryOperations>
      scheduledCompletionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduledCompletionDate');
    });
  }

  QueryBuilder<Repetition, RepetitionStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
