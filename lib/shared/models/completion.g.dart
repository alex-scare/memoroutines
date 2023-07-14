// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCompletionCollection on Isar {
  IsarCollection<Completion> get completions => this.collection();
}

const CompletionSchema = CollectionSchema(
  name: r'Completion',
  id: -5586095416965545486,
  properties: {
    r'actionedAt': PropertySchema(
      id: 0,
      name: r'actionedAt',
      type: IsarType.dateTime,
    ),
    r'dateToBeCompleted': PropertySchema(
      id: 1,
      name: r'dateToBeCompleted',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 2,
      name: r'status',
      type: IsarType.string,
      enumMap: _CompletionstatusEnumValueMap,
    )
  },
  estimateSize: _completionEstimateSize,
  serialize: _completionSerialize,
  deserialize: _completionDeserialize,
  deserializeProp: _completionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'routine': LinkSchema(
      id: -4468112437395105708,
      name: r'routine',
      target: r'Routine',
      single: true,
      linkName: r'completions',
    )
  },
  embeddedSchemas: {},
  getId: _completionGetId,
  getLinks: _completionGetLinks,
  attach: _completionAttach,
  version: '3.1.0+1',
);

int _completionEstimateSize(
  Completion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.status.name.length * 3;
  return bytesCount;
}

void _completionSerialize(
  Completion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.actionedAt);
  writer.writeDateTime(offsets[1], object.dateToBeCompleted);
  writer.writeString(offsets[2], object.status.name);
}

Completion _completionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Completion(
    actionedAt: reader.readDateTimeOrNull(offsets[0]),
    dateToBeCompleted: reader.readDateTime(offsets[1]),
    status:
        _CompletionstatusValueEnumMap[reader.readStringOrNull(offsets[2])] ??
            CompletionStatus.upcoming,
  );
  object.id = id;
  return object;
}

P _completionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (_CompletionstatusValueEnumMap[reader.readStringOrNull(offset)] ??
          CompletionStatus.upcoming) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CompletionstatusEnumValueMap = {
  r'completed': r'completed',
  r'missed': r'missed',
  r'upcoming': r'upcoming',
  r'skipped': r'skipped',
};
const _CompletionstatusValueEnumMap = {
  r'completed': CompletionStatus.completed,
  r'missed': CompletionStatus.missed,
  r'upcoming': CompletionStatus.upcoming,
  r'skipped': CompletionStatus.skipped,
};

Id _completionGetId(Completion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _completionGetLinks(Completion object) {
  return [object.routine];
}

void _completionAttach(IsarCollection<dynamic> col, Id id, Completion object) {
  object.id = id;
  object.routine.attach(col, col.isar.collection<Routine>(), r'routine', id);
}

extension CompletionQueryWhereSort
    on QueryBuilder<Completion, Completion, QWhere> {
  QueryBuilder<Completion, Completion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CompletionQueryWhere
    on QueryBuilder<Completion, Completion, QWhereClause> {
  QueryBuilder<Completion, Completion, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Completion, Completion, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Completion, Completion, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Completion, Completion, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Completion, Completion, QAfterWhereClause> idBetween(
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

extension CompletionQueryFilter
    on QueryBuilder<Completion, Completion, QFilterCondition> {
  QueryBuilder<Completion, Completion, QAfterFilterCondition>
      actionedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actionedAt',
      ));
    });
  }

  QueryBuilder<Completion, Completion, QAfterFilterCondition>
      actionedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actionedAt',
      ));
    });
  }

  QueryBuilder<Completion, Completion, QAfterFilterCondition> actionedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actionedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Completion, Completion, QAfterFilterCondition>
      actionedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actionedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Completion, Completion, QAfterFilterCondition>
      actionedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actionedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Completion, Completion, QAfterFilterCondition> actionedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actionedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Completion, Completion, QAfterFilterCondition>
      dateToBeCompletedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateToBeCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<Completion, Completion, QAfterFilterCondition>
      dateToBeCompletedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateToBeCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<Completion, Completion, QAfterFilterCondition>
      dateToBeCompletedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateToBeCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<Completion, Completion, QAfterFilterCondition>
      dateToBeCompletedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateToBeCompleted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Completion, Completion, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Completion, Completion, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Completion, Completion, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Completion, Completion, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Completion, Completion, QAfterFilterCondition> statusEqualTo(
    CompletionStatus value, {
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

  QueryBuilder<Completion, Completion, QAfterFilterCondition> statusGreaterThan(
    CompletionStatus value, {
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

  QueryBuilder<Completion, Completion, QAfterFilterCondition> statusLessThan(
    CompletionStatus value, {
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

  QueryBuilder<Completion, Completion, QAfterFilterCondition> statusBetween(
    CompletionStatus lower,
    CompletionStatus upper, {
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

  QueryBuilder<Completion, Completion, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<Completion, Completion, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<Completion, Completion, QAfterFilterCondition> statusContains(
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

  QueryBuilder<Completion, Completion, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<Completion, Completion, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Completion, Completion, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }
}

extension CompletionQueryObject
    on QueryBuilder<Completion, Completion, QFilterCondition> {}

extension CompletionQueryLinks
    on QueryBuilder<Completion, Completion, QFilterCondition> {
  QueryBuilder<Completion, Completion, QAfterFilterCondition> routine(
      FilterQuery<Routine> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'routine');
    });
  }

  QueryBuilder<Completion, Completion, QAfterFilterCondition> routineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'routine', 0, true, 0, true);
    });
  }
}

extension CompletionQuerySortBy
    on QueryBuilder<Completion, Completion, QSortBy> {
  QueryBuilder<Completion, Completion, QAfterSortBy> sortByActionedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actionedAt', Sort.asc);
    });
  }

  QueryBuilder<Completion, Completion, QAfterSortBy> sortByActionedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actionedAt', Sort.desc);
    });
  }

  QueryBuilder<Completion, Completion, QAfterSortBy> sortByDateToBeCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateToBeCompleted', Sort.asc);
    });
  }

  QueryBuilder<Completion, Completion, QAfterSortBy>
      sortByDateToBeCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateToBeCompleted', Sort.desc);
    });
  }

  QueryBuilder<Completion, Completion, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Completion, Completion, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension CompletionQuerySortThenBy
    on QueryBuilder<Completion, Completion, QSortThenBy> {
  QueryBuilder<Completion, Completion, QAfterSortBy> thenByActionedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actionedAt', Sort.asc);
    });
  }

  QueryBuilder<Completion, Completion, QAfterSortBy> thenByActionedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actionedAt', Sort.desc);
    });
  }

  QueryBuilder<Completion, Completion, QAfterSortBy> thenByDateToBeCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateToBeCompleted', Sort.asc);
    });
  }

  QueryBuilder<Completion, Completion, QAfterSortBy>
      thenByDateToBeCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateToBeCompleted', Sort.desc);
    });
  }

  QueryBuilder<Completion, Completion, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Completion, Completion, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Completion, Completion, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Completion, Completion, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension CompletionQueryWhereDistinct
    on QueryBuilder<Completion, Completion, QDistinct> {
  QueryBuilder<Completion, Completion, QDistinct> distinctByActionedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actionedAt');
    });
  }

  QueryBuilder<Completion, Completion, QDistinct>
      distinctByDateToBeCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateToBeCompleted');
    });
  }

  QueryBuilder<Completion, Completion, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }
}

extension CompletionQueryProperty
    on QueryBuilder<Completion, Completion, QQueryProperty> {
  QueryBuilder<Completion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Completion, DateTime?, QQueryOperations> actionedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actionedAt');
    });
  }

  QueryBuilder<Completion, DateTime, QQueryOperations>
      dateToBeCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateToBeCompleted');
    });
  }

  QueryBuilder<Completion, CompletionStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
