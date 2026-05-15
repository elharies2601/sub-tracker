// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReminderModelCollection on Isar {
  IsarCollection<ReminderModel> get reminderModels => this.collection();
}

const ReminderModelSchema = CollectionSchema(
  name: r'ReminderModel',
  id: -6553527084112746384,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'daysBefore': PropertySchema(
      id: 1,
      name: r'daysBefore',
      type: IsarType.long,
    ),
    r'isEnabled': PropertySchema(
      id: 2,
      name: r'isEnabled',
      type: IsarType.bool,
    ),
    r'remindHour': PropertySchema(
      id: 3,
      name: r'remindHour',
      type: IsarType.long,
    ),
    r'remindMinute': PropertySchema(
      id: 4,
      name: r'remindMinute',
      type: IsarType.long,
    ),
    r'subscriptionId': PropertySchema(
      id: 5,
      name: r'subscriptionId',
      type: IsarType.long,
    )
  },
  estimateSize: _reminderModelEstimateSize,
  serialize: _reminderModelSerialize,
  deserialize: _reminderModelDeserialize,
  deserializeProp: _reminderModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _reminderModelGetId,
  getLinks: _reminderModelGetLinks,
  attach: _reminderModelAttach,
  version: '3.1.0+1',
);

int _reminderModelEstimateSize(
  ReminderModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _reminderModelSerialize(
  ReminderModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeLong(offsets[1], object.daysBefore);
  writer.writeBool(offsets[2], object.isEnabled);
  writer.writeLong(offsets[3], object.remindHour);
  writer.writeLong(offsets[4], object.remindMinute);
  writer.writeLong(offsets[5], object.subscriptionId);
}

ReminderModel _reminderModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReminderModel();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.daysBefore = reader.readLong(offsets[1]);
  object.id = id;
  object.isEnabled = reader.readBool(offsets[2]);
  object.remindHour = reader.readLong(offsets[3]);
  object.remindMinute = reader.readLong(offsets[4]);
  object.subscriptionId = reader.readLong(offsets[5]);
  return object;
}

P _reminderModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _reminderModelGetId(ReminderModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _reminderModelGetLinks(ReminderModel object) {
  return [];
}

void _reminderModelAttach(
    IsarCollection<dynamic> col, Id id, ReminderModel object) {
  object.id = id;
}

extension ReminderModelQueryWhereSort
    on QueryBuilder<ReminderModel, ReminderModel, QWhere> {
  QueryBuilder<ReminderModel, ReminderModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ReminderModelQueryWhere
    on QueryBuilder<ReminderModel, ReminderModel, QWhereClause> {
  QueryBuilder<ReminderModel, ReminderModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<ReminderModel, ReminderModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterWhereClause> idBetween(
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

extension ReminderModelQueryFilter
    on QueryBuilder<ReminderModel, ReminderModel, QFilterCondition> {
  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
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

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
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

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
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

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      daysBeforeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'daysBefore',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      daysBeforeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'daysBefore',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      daysBeforeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'daysBefore',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      daysBeforeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'daysBefore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      isEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      remindHourEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remindHour',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      remindHourGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remindHour',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      remindHourLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remindHour',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      remindHourBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remindHour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      remindMinuteEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remindMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      remindMinuteGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remindMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      remindMinuteLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remindMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      remindMinuteBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remindMinute',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      subscriptionIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subscriptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      subscriptionIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subscriptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      subscriptionIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subscriptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterFilterCondition>
      subscriptionIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subscriptionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ReminderModelQueryObject
    on QueryBuilder<ReminderModel, ReminderModel, QFilterCondition> {}

extension ReminderModelQueryLinks
    on QueryBuilder<ReminderModel, ReminderModel, QFilterCondition> {}

extension ReminderModelQuerySortBy
    on QueryBuilder<ReminderModel, ReminderModel, QSortBy> {
  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy> sortByDaysBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysBefore', Sort.asc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy>
      sortByDaysBeforeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysBefore', Sort.desc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy> sortByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.asc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy>
      sortByIsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.desc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy> sortByRemindHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindHour', Sort.asc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy>
      sortByRemindHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindHour', Sort.desc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy>
      sortByRemindMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindMinute', Sort.asc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy>
      sortByRemindMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindMinute', Sort.desc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy>
      sortBySubscriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscriptionId', Sort.asc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy>
      sortBySubscriptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscriptionId', Sort.desc);
    });
  }
}

extension ReminderModelQuerySortThenBy
    on QueryBuilder<ReminderModel, ReminderModel, QSortThenBy> {
  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy> thenByDaysBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysBefore', Sort.asc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy>
      thenByDaysBeforeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysBefore', Sort.desc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy> thenByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.asc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy>
      thenByIsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEnabled', Sort.desc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy> thenByRemindHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindHour', Sort.asc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy>
      thenByRemindHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindHour', Sort.desc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy>
      thenByRemindMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindMinute', Sort.asc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy>
      thenByRemindMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindMinute', Sort.desc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy>
      thenBySubscriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscriptionId', Sort.asc);
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QAfterSortBy>
      thenBySubscriptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscriptionId', Sort.desc);
    });
  }
}

extension ReminderModelQueryWhereDistinct
    on QueryBuilder<ReminderModel, ReminderModel, QDistinct> {
  QueryBuilder<ReminderModel, ReminderModel, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QDistinct> distinctByDaysBefore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'daysBefore');
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QDistinct> distinctByIsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isEnabled');
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QDistinct> distinctByRemindHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remindHour');
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QDistinct>
      distinctByRemindMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remindMinute');
    });
  }

  QueryBuilder<ReminderModel, ReminderModel, QDistinct>
      distinctBySubscriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subscriptionId');
    });
  }
}

extension ReminderModelQueryProperty
    on QueryBuilder<ReminderModel, ReminderModel, QQueryProperty> {
  QueryBuilder<ReminderModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReminderModel, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ReminderModel, int, QQueryOperations> daysBeforeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'daysBefore');
    });
  }

  QueryBuilder<ReminderModel, bool, QQueryOperations> isEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isEnabled');
    });
  }

  QueryBuilder<ReminderModel, int, QQueryOperations> remindHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remindHour');
    });
  }

  QueryBuilder<ReminderModel, int, QQueryOperations> remindMinuteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remindMinute');
    });
  }

  QueryBuilder<ReminderModel, int, QQueryOperations> subscriptionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subscriptionId');
    });
  }
}
