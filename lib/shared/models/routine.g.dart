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
    r'completionRepetitionCount': PropertySchema(
      id: 0,
      name: r'completionRepetitionCount',
      type: IsarType.long,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'frequency': PropertySchema(
      id: 2,
      name: r'frequency',
      type: IsarType.string,
      enumMap: _RoutinefrequencyEnumValueMap,
    ),
    r'icon': PropertySchema(
      id: 3,
      name: r'icon',
      type: IsarType.string,
      enumMap: _RoutineiconEnumValueMap,
    ),
    r'metaData': PropertySchema(
      id: 4,
      name: r'metaData',
      type: IsarType.object,
      target: r'RoutineMetaData',
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'singleRepetitionDuration': PropertySchema(
      id: 6,
      name: r'singleRepetitionDuration',
      type: IsarType.long,
    ),
    r'stats': PropertySchema(
      id: 7,
      name: r'stats',
      type: IsarType.object,
      target: r'RoutineStats',
    ),
    r'status': PropertySchema(
      id: 8,
      name: r'status',
      type: IsarType.string,
      enumMap: _RoutinestatusEnumValueMap,
    )
  },
  estimateSize: _routineEstimateSize,
  serialize: _routineSerialize,
  deserialize: _routineDeserialize,
  deserializeProp: _routineDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'repetitions': LinkSchema(
      id: -1494824519875501274,
      name: r'repetitions',
      target: r'Repetition',
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
  bytesCount += 3 + object.icon.name.length * 3;
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
  writer.writeLong(offsets[0], object.completionRepetitionCount);
  writer.writeString(offsets[1], object.description);
  writer.writeString(offsets[2], object.frequency.name);
  writer.writeString(offsets[3], object.icon.name);
  writer.writeObject<RoutineMetaData>(
    offsets[4],
    allOffsets,
    RoutineMetaDataSchema.serialize,
    object.metaData,
  );
  writer.writeString(offsets[5], object.name);
  writer.writeLong(offsets[6], object.singleRepetitionDuration);
  writer.writeObject<RoutineStats>(
    offsets[7],
    allOffsets,
    RoutineStatsSchema.serialize,
    object.stats,
  );
  writer.writeString(offsets[8], object.status.name);
}

Routine _routineDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Routine(
    completionRepetitionCount: reader.readLongOrNull(offsets[0]) ?? 30,
    description: reader.readString(offsets[1]),
    frequency:
        _RoutinefrequencyValueEnumMap[reader.readStringOrNull(offsets[2])] ??
            RoutineFrequency.daily,
    icon: _RoutineiconValueEnumMap[reader.readStringOrNull(offsets[3])] ??
        RoutineIcon.cat,
    name: reader.readString(offsets[5]),
    singleRepetitionDuration: reader.readLongOrNull(offsets[6]) ?? 30,
    status: _RoutinestatusValueEnumMap[reader.readStringOrNull(offsets[8])] ??
        RoutineStatus.active,
  );
  object.id = id;
  object.metaData = reader.readObjectOrNull<RoutineMetaData>(
        offsets[4],
        RoutineMetaDataSchema.deserialize,
        allOffsets,
      ) ??
      RoutineMetaData();
  object.stats = reader.readObjectOrNull<RoutineStats>(
        offsets[7],
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
      return (reader.readLongOrNull(offset) ?? 30) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (_RoutinefrequencyValueEnumMap[reader.readStringOrNull(offset)] ??
          RoutineFrequency.daily) as P;
    case 3:
      return (_RoutineiconValueEnumMap[reader.readStringOrNull(offset)] ??
          RoutineIcon.cat) as P;
    case 4:
      return (reader.readObjectOrNull<RoutineMetaData>(
            offset,
            RoutineMetaDataSchema.deserialize,
            allOffsets,
          ) ??
          RoutineMetaData()) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset) ?? 30) as P;
    case 7:
      return (reader.readObjectOrNull<RoutineStats>(
            offset,
            RoutineStatsSchema.deserialize,
            allOffsets,
          ) ??
          RoutineStats()) as P;
    case 8:
      return (_RoutinestatusValueEnumMap[reader.readStringOrNull(offset)] ??
          RoutineStatus.active) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RoutinefrequencyEnumValueMap = {
  r'daily': r'daily',
  r'weekly': r'weekly',
  r'monthly': r'monthly',
};
const _RoutinefrequencyValueEnumMap = {
  r'daily': RoutineFrequency.daily,
  r'weekly': RoutineFrequency.weekly,
  r'monthly': RoutineFrequency.monthly,
};
const _RoutineiconEnumValueMap = {
  r'cat': r'cat',
  r'dog': r'dog',
  r'paw': r'paw',
  r'hiking': r'hiking',
  r'glassCheers': r'glassCheers',
  r'cocktail': r'cocktail',
  r'coffee': r'coffee',
  r'freeCodeCamp': r'freeCodeCamp',
  r'git': r'git',
  r'github': r'github',
  r'gitlab': r'gitlab',
  r'instagram': r'instagram',
  r'microsoft': r'microsoft',
  r'java': r'java',
  r'python': r'python',
  r'react': r'react',
  r'swift': r'swift',
  r'telegram': r'telegram',
  r'windows': r'windows',
  r'campground': r'campground',
  r'route': r'route',
  r'mountain': r'mountain',
  r'fire': r'fire',
  r'compass': r'compass',
  r'seedling': r'seedling',
  r'handHoldingHeart': r'handHoldingHeart',
  r'chess': r'chess',
  r'gamepad': r'gamepad',
  r'terminal': r'terminal',
  r'code': r'code',
  r'laptop': r'laptop',
  r'paintRoller': r'paintRoller',
  r'paintBrush': r'paintBrush',
  r'ethereum': r'ethereum',
  r'btc': r'btc',
  r'moneyBill': r'moneyBill',
  r'palette': r'palette',
  r'glasses': r'glasses',
  r'atom': r'atom',
  r'laptopCode': r'laptopCode',
  r'theaterMasks': r'theaterMasks',
  r'microscope': r'microscope',
  r'music': r'music',
  r'water': r'water',
  r'wallet': r'wallet',
  r'coins': r'coins',
  r'bicycle': r'bicycle',
  r'skiing': r'skiing',
  r'running': r'running',
  r'swimmer': r'swimmer',
  r'spa': r'spa',
  r'pizzaSlice': r'pizzaSlice',
  r'cheese': r'cheese',
  r'twitch': r'twitch',
  r'steam': r'steam',
  r'diceD6': r'diceD6',
  r'dumbbell': r'dumbbell',
  r'camera': r'camera',
  r'bomb': r'bomb',
  r'car': r'car',
  r'globe': r'globe',
  r'book': r'book',
  r'couch': r'couch',
  r'spotify': r'spotify',
  r'drum': r'drum',
  r'beer': r'beer',
  r'futbol': r'futbol',
  r'graduationCap': r'graduationCap',
  r'gem': r'gem',
  r'guitar': r'guitar',
  r'shoppingCart': r'shoppingCart',
  r'university': r'university',
  r'golfBall': r'golfBall',
  r'skating': r'skating',
  r'scroll': r'scroll',
  r'dungeon': r'dungeon',
  r'dragon': r'dragon',
  r'bed': r'bed',
  r'meteor': r'meteor',
  r'snowboarding': r'snowboarding',
};
const _RoutineiconValueEnumMap = {
  r'cat': RoutineIcon.cat,
  r'dog': RoutineIcon.dog,
  r'paw': RoutineIcon.paw,
  r'hiking': RoutineIcon.hiking,
  r'glassCheers': RoutineIcon.glassCheers,
  r'cocktail': RoutineIcon.cocktail,
  r'coffee': RoutineIcon.coffee,
  r'freeCodeCamp': RoutineIcon.freeCodeCamp,
  r'git': RoutineIcon.git,
  r'github': RoutineIcon.github,
  r'gitlab': RoutineIcon.gitlab,
  r'instagram': RoutineIcon.instagram,
  r'microsoft': RoutineIcon.microsoft,
  r'java': RoutineIcon.java,
  r'python': RoutineIcon.python,
  r'react': RoutineIcon.react,
  r'swift': RoutineIcon.swift,
  r'telegram': RoutineIcon.telegram,
  r'windows': RoutineIcon.windows,
  r'campground': RoutineIcon.campground,
  r'route': RoutineIcon.route,
  r'mountain': RoutineIcon.mountain,
  r'fire': RoutineIcon.fire,
  r'compass': RoutineIcon.compass,
  r'seedling': RoutineIcon.seedling,
  r'handHoldingHeart': RoutineIcon.handHoldingHeart,
  r'chess': RoutineIcon.chess,
  r'gamepad': RoutineIcon.gamepad,
  r'terminal': RoutineIcon.terminal,
  r'code': RoutineIcon.code,
  r'laptop': RoutineIcon.laptop,
  r'paintRoller': RoutineIcon.paintRoller,
  r'paintBrush': RoutineIcon.paintBrush,
  r'ethereum': RoutineIcon.ethereum,
  r'btc': RoutineIcon.btc,
  r'moneyBill': RoutineIcon.moneyBill,
  r'palette': RoutineIcon.palette,
  r'glasses': RoutineIcon.glasses,
  r'atom': RoutineIcon.atom,
  r'laptopCode': RoutineIcon.laptopCode,
  r'theaterMasks': RoutineIcon.theaterMasks,
  r'microscope': RoutineIcon.microscope,
  r'music': RoutineIcon.music,
  r'water': RoutineIcon.water,
  r'wallet': RoutineIcon.wallet,
  r'coins': RoutineIcon.coins,
  r'bicycle': RoutineIcon.bicycle,
  r'skiing': RoutineIcon.skiing,
  r'running': RoutineIcon.running,
  r'swimmer': RoutineIcon.swimmer,
  r'spa': RoutineIcon.spa,
  r'pizzaSlice': RoutineIcon.pizzaSlice,
  r'cheese': RoutineIcon.cheese,
  r'twitch': RoutineIcon.twitch,
  r'steam': RoutineIcon.steam,
  r'diceD6': RoutineIcon.diceD6,
  r'dumbbell': RoutineIcon.dumbbell,
  r'camera': RoutineIcon.camera,
  r'bomb': RoutineIcon.bomb,
  r'car': RoutineIcon.car,
  r'globe': RoutineIcon.globe,
  r'book': RoutineIcon.book,
  r'couch': RoutineIcon.couch,
  r'spotify': RoutineIcon.spotify,
  r'drum': RoutineIcon.drum,
  r'beer': RoutineIcon.beer,
  r'futbol': RoutineIcon.futbol,
  r'graduationCap': RoutineIcon.graduationCap,
  r'gem': RoutineIcon.gem,
  r'guitar': RoutineIcon.guitar,
  r'shoppingCart': RoutineIcon.shoppingCart,
  r'university': RoutineIcon.university,
  r'golfBall': RoutineIcon.golfBall,
  r'skating': RoutineIcon.skating,
  r'scroll': RoutineIcon.scroll,
  r'dungeon': RoutineIcon.dungeon,
  r'dragon': RoutineIcon.dragon,
  r'bed': RoutineIcon.bed,
  r'meteor': RoutineIcon.meteor,
  r'snowboarding': RoutineIcon.snowboarding,
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
  return [object.repetitions];
}

void _routineAttach(IsarCollection<dynamic> col, Id id, Routine object) {
  object.id = id;
  object.repetitions
      .attach(col, col.isar.collection<Repetition>(), r'repetitions', id);
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
  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      completionRepetitionCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completionRepetitionCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      completionRepetitionCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completionRepetitionCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      completionRepetitionCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completionRepetitionCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      completionRepetitionCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completionRepetitionCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

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

  QueryBuilder<Routine, Routine, QAfterFilterCondition> iconEqualTo(
    RoutineIcon value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> iconGreaterThan(
    RoutineIcon value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> iconLessThan(
    RoutineIcon value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> iconBetween(
    RoutineIcon lower,
    RoutineIcon upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'icon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> iconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> iconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> iconContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> iconMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'icon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> iconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'icon',
        value: '',
      ));
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> iconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'icon',
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
  QueryBuilder<Routine, Routine, QAfterFilterCondition> repetitions(
      FilterQuery<Repetition> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'repetitions');
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      repetitionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'repetitions', length, true, length, true);
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> repetitionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'repetitions', 0, true, 0, true);
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      repetitionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'repetitions', 0, false, 999999, true);
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      repetitionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'repetitions', 0, true, length, include);
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      repetitionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'repetitions', length, include, 999999, true);
    });
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      repetitionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'repetitions', lower, includeLower, upper, includeUpper);
    });
  }
}

extension RoutineQuerySortBy on QueryBuilder<Routine, Routine, QSortBy> {
  QueryBuilder<Routine, Routine, QAfterSortBy>
      sortByCompletionRepetitionCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionRepetitionCount', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy>
      sortByCompletionRepetitionCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionRepetitionCount', Sort.desc);
    });
  }

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

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.desc);
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
}

extension RoutineQuerySortThenBy
    on QueryBuilder<Routine, Routine, QSortThenBy> {
  QueryBuilder<Routine, Routine, QAfterSortBy>
      thenByCompletionRepetitionCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionRepetitionCount', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy>
      thenByCompletionRepetitionCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionRepetitionCount', Sort.desc);
    });
  }

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

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.asc);
    });
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.desc);
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
}

extension RoutineQueryWhereDistinct
    on QueryBuilder<Routine, Routine, QDistinct> {
  QueryBuilder<Routine, Routine, QDistinct>
      distinctByCompletionRepetitionCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completionRepetitionCount');
    });
  }

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

  QueryBuilder<Routine, Routine, QDistinct> distinctByIcon(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'icon', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Routine, Routine, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
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
}

extension RoutineQueryProperty
    on QueryBuilder<Routine, Routine, QQueryProperty> {
  QueryBuilder<Routine, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Routine, int, QQueryOperations>
      completionRepetitionCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completionRepetitionCount');
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

  QueryBuilder<Routine, RoutineIcon, QQueryOperations> iconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'icon');
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
    r'flexibleRepetitionCount': PropertySchema(
      id: 1,
      name: r'flexibleRepetitionCount',
      type: IsarType.long,
    ),
    r'isFlexible': PropertySchema(
      id: 2,
      name: r'isFlexible',
      type: IsarType.bool,
    ),
    r'lastDoneAt': PropertySchema(
      id: 3,
      name: r'lastDoneAt',
      type: IsarType.dateTime,
    ),
    r'scheduledDaysOfMonth': PropertySchema(
      id: 4,
      name: r'scheduledDaysOfMonth',
      type: IsarType.longList,
    ),
    r'updatedAt': PropertySchema(
      id: 5,
      name: r'updatedAt',
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
  bytesCount += 3 + object.scheduledDaysOfMonth.length * 8;
  return bytesCount;
}

void _routineMetaDataSerialize(
  RoutineMetaData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeLong(offsets[1], object.flexibleRepetitionCount);
  writer.writeBool(offsets[2], object.isFlexible);
  writer.writeDateTime(offsets[3], object.lastDoneAt);
  writer.writeLongList(offsets[4], object.scheduledDaysOfMonth);
  writer.writeDateTime(offsets[5], object.updatedAt);
}

RoutineMetaData _routineMetaDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RoutineMetaData(
    flexibleRepetitionCount: reader.readLongOrNull(offsets[1]) ?? 1,
    isFlexible: reader.readBoolOrNull(offsets[2]) ?? false,
    scheduledDaysOfMonth: reader.readLongList(offsets[4]) ?? const [],
  );
  object.createdAt = reader.readDateTime(offsets[0]);
  object.lastDoneAt = reader.readDateTimeOrNull(offsets[3]);
  object.updatedAt = reader.readDateTime(offsets[5]);
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
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 2:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readLongList(offset) ?? const []) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
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
      flexibleRepetitionCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flexibleRepetitionCount',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      flexibleRepetitionCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'flexibleRepetitionCount',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      flexibleRepetitionCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'flexibleRepetitionCount',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      flexibleRepetitionCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'flexibleRepetitionCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      isFlexibleEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFlexible',
        value: value,
      ));
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
      scheduledDaysOfMonthElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduledDaysOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      scheduledDaysOfMonthElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scheduledDaysOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      scheduledDaysOfMonthElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scheduledDaysOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      scheduledDaysOfMonthElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scheduledDaysOfMonth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      scheduledDaysOfMonthLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'scheduledDaysOfMonth',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      scheduledDaysOfMonthIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'scheduledDaysOfMonth',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      scheduledDaysOfMonthIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'scheduledDaysOfMonth',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      scheduledDaysOfMonthLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'scheduledDaysOfMonth',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      scheduledDaysOfMonthLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'scheduledDaysOfMonth',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RoutineMetaData, RoutineMetaData, QAfterFilterCondition>
      scheduledDaysOfMonthLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'scheduledDaysOfMonth',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
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
