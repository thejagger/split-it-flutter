// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters, duplicate_ignore
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_internal_member

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class GroupCollectionReference
    implements
        GroupQuery,
        FirestoreCollectionReference<Group, GroupQuerySnapshot> {
  factory GroupCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$GroupCollectionReference;

  static Group fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Group.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Group value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<Group> get reference;

  @override
  GroupDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<GroupDocumentReference> add(Group value);
}

class _$GroupCollectionReference extends _$GroupQuery
    implements GroupCollectionReference {
  factory _$GroupCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$GroupCollectionReference._(
      firestore.collection('groups').withConverter(
            fromFirestore: GroupCollectionReference.fromFirestore,
            toFirestore: GroupCollectionReference.toFirestore,
          ),
    );
  }

  _$GroupCollectionReference._(
    CollectionReference<Group> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Group> get reference =>
      super.reference as CollectionReference<Group>;

  @override
  GroupDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return GroupDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<GroupDocumentReference> add(Group value) {
    return reference.add(value).then((ref) => GroupDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$GroupCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class GroupDocumentReference
    extends FirestoreDocumentReference<Group, GroupDocumentSnapshot> {
  factory GroupDocumentReference(DocumentReference<Group> reference) =
      _$GroupDocumentReference;

  DocumentReference<Group> get reference;

  /// A reference to the [GroupCollectionReference] containing this document.
  GroupCollectionReference get parent {
    return _$GroupCollectionReference(reference.firestore);
  }

  late final ExpenseCollectionReference expenses = _$ExpenseCollectionReference(
    reference,
  );

  @override
  Stream<GroupDocumentSnapshot> snapshots();

  @override
  Future<GroupDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String name,
    FieldValue nameFieldValue,
    int colorValue,
    FieldValue colorValueFieldValue,
    String createdBy,
    FieldValue createdByFieldValue,
    double? sumAmount,
    FieldValue sumAmountFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String name,
    FieldValue nameFieldValue,
    int colorValue,
    FieldValue colorValueFieldValue,
    String createdBy,
    FieldValue createdByFieldValue,
    double? sumAmount,
    FieldValue sumAmountFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String name,
    FieldValue nameFieldValue,
    int colorValue,
    FieldValue colorValueFieldValue,
    String createdBy,
    FieldValue createdByFieldValue,
    double? sumAmount,
    FieldValue sumAmountFieldValue,
  });
}

class _$GroupDocumentReference
    extends FirestoreDocumentReference<Group, GroupDocumentSnapshot>
    implements GroupDocumentReference {
  _$GroupDocumentReference(this.reference);

  @override
  final DocumentReference<Group> reference;

  /// A reference to the [GroupCollectionReference] containing this document.
  GroupCollectionReference get parent {
    return _$GroupCollectionReference(reference.firestore);
  }

  late final ExpenseCollectionReference expenses = _$ExpenseCollectionReference(
    reference,
  );

  @override
  Stream<GroupDocumentSnapshot> snapshots() {
    return reference.snapshots().map(GroupDocumentSnapshot._);
  }

  @override
  Future<GroupDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(GroupDocumentSnapshot._);
  }

  @override
  Future<GroupDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(GroupDocumentSnapshot._);
  }

  Future<void> update({
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? colorValue = _sentinel,
    FieldValue? colorValueFieldValue,
    Object? createdBy = _sentinel,
    FieldValue? createdByFieldValue,
    Object? sumAmount = _sentinel,
    FieldValue? sumAmountFieldValue,
  }) async {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      colorValue == _sentinel || colorValueFieldValue == null,
      "Cannot specify both colorValue and colorValueFieldValue",
    );
    assert(
      createdBy == _sentinel || createdByFieldValue == null,
      "Cannot specify both createdBy and createdByFieldValue",
    );
    assert(
      sumAmount == _sentinel || sumAmountFieldValue == null,
      "Cannot specify both sumAmount and sumAmountFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$GroupFieldMap['name']!: _$GroupPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$GroupFieldMap['name']!: nameFieldValue,
      if (colorValue != _sentinel)
        _$GroupFieldMap['colorValue']!:
            _$GroupPerFieldToJson.colorValue(colorValue as int),
      if (colorValueFieldValue != null)
        _$GroupFieldMap['colorValue']!: colorValueFieldValue,
      if (createdBy != _sentinel)
        _$GroupFieldMap['createdBy']!:
            _$GroupPerFieldToJson.createdBy(createdBy as String),
      if (createdByFieldValue != null)
        _$GroupFieldMap['createdBy']!: createdByFieldValue,
      if (sumAmount != _sentinel)
        _$GroupFieldMap['sumAmount']!:
            _$GroupPerFieldToJson.sumAmount(sumAmount as double?),
      if (sumAmountFieldValue != null)
        _$GroupFieldMap['sumAmount']!: sumAmountFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? colorValue = _sentinel,
    FieldValue? colorValueFieldValue,
    Object? createdBy = _sentinel,
    FieldValue? createdByFieldValue,
    Object? sumAmount = _sentinel,
    FieldValue? sumAmountFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      colorValue == _sentinel || colorValueFieldValue == null,
      "Cannot specify both colorValue and colorValueFieldValue",
    );
    assert(
      createdBy == _sentinel || createdByFieldValue == null,
      "Cannot specify both createdBy and createdByFieldValue",
    );
    assert(
      sumAmount == _sentinel || sumAmountFieldValue == null,
      "Cannot specify both sumAmount and sumAmountFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$GroupFieldMap['name']!: _$GroupPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$GroupFieldMap['name']!: nameFieldValue,
      if (colorValue != _sentinel)
        _$GroupFieldMap['colorValue']!:
            _$GroupPerFieldToJson.colorValue(colorValue as int),
      if (colorValueFieldValue != null)
        _$GroupFieldMap['colorValue']!: colorValueFieldValue,
      if (createdBy != _sentinel)
        _$GroupFieldMap['createdBy']!:
            _$GroupPerFieldToJson.createdBy(createdBy as String),
      if (createdByFieldValue != null)
        _$GroupFieldMap['createdBy']!: createdByFieldValue,
      if (sumAmount != _sentinel)
        _$GroupFieldMap['sumAmount']!:
            _$GroupPerFieldToJson.sumAmount(sumAmount as double?),
      if (sumAmountFieldValue != null)
        _$GroupFieldMap['sumAmount']!: sumAmountFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? colorValue = _sentinel,
    FieldValue? colorValueFieldValue,
    Object? createdBy = _sentinel,
    FieldValue? createdByFieldValue,
    Object? sumAmount = _sentinel,
    FieldValue? sumAmountFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      colorValue == _sentinel || colorValueFieldValue == null,
      "Cannot specify both colorValue and colorValueFieldValue",
    );
    assert(
      createdBy == _sentinel || createdByFieldValue == null,
      "Cannot specify both createdBy and createdByFieldValue",
    );
    assert(
      sumAmount == _sentinel || sumAmountFieldValue == null,
      "Cannot specify both sumAmount and sumAmountFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$GroupFieldMap['name']!: _$GroupPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$GroupFieldMap['name']!: nameFieldValue,
      if (colorValue != _sentinel)
        _$GroupFieldMap['colorValue']!:
            _$GroupPerFieldToJson.colorValue(colorValue as int),
      if (colorValueFieldValue != null)
        _$GroupFieldMap['colorValue']!: colorValueFieldValue,
      if (createdBy != _sentinel)
        _$GroupFieldMap['createdBy']!:
            _$GroupPerFieldToJson.createdBy(createdBy as String),
      if (createdByFieldValue != null)
        _$GroupFieldMap['createdBy']!: createdByFieldValue,
      if (sumAmount != _sentinel)
        _$GroupFieldMap['sumAmount']!:
            _$GroupPerFieldToJson.sumAmount(sumAmount as double?),
      if (sumAmountFieldValue != null)
        _$GroupFieldMap['sumAmount']!: sumAmountFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class GroupQuery implements QueryReference<Group, GroupQuerySnapshot> {
  @override
  GroupQuery limit(int limit);

  @override
  GroupQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  GroupQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  GroupQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  GroupQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  GroupQuery whereColorValue({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  });

  GroupQuery whereCreatedBy({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  GroupQuery whereSumAmount({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    List<double?>? whereIn,
    List<double?>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  GroupQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  });

  GroupQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  });

  GroupQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  });

  GroupQuery orderByColorValue({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  });

  GroupQuery orderByCreatedBy({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  });

  GroupQuery orderBySumAmount({
    bool descending = false,
    double? startAt,
    double? startAfter,
    double? endAt,
    double? endBefore,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  });
}

class _$GroupQuery extends QueryReference<Group, GroupQuerySnapshot>
    implements GroupQuery {
  _$GroupQuery(
    this._collection, {
    required Query<Group> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<GroupQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(GroupQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<GroupQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(GroupQuerySnapshot._fromQuerySnapshot);
  }

  @override
  GroupQuery limit(int limit) {
    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  GroupQuery limitToLast(int limit) {
    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  GroupQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  GroupQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  GroupQuery whereName({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$GroupFieldMap['name']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$GroupPerFieldToJson.name(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$GroupPerFieldToJson.name(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$GroupPerFieldToJson.name(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$GroupPerFieldToJson.name(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$GroupPerFieldToJson.name(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$GroupPerFieldToJson.name(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$GroupPerFieldToJson.name(e)),
        whereNotIn: whereNotIn?.map((e) => _$GroupPerFieldToJson.name(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  GroupQuery whereColorValue({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  }) {
    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$GroupFieldMap['colorValue']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$GroupPerFieldToJson.colorValue(isEqualTo as int)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$GroupPerFieldToJson.colorValue(isNotEqualTo as int)
            : null,
        isLessThan: isLessThan != null
            ? _$GroupPerFieldToJson.colorValue(isLessThan as int)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$GroupPerFieldToJson.colorValue(isLessThanOrEqualTo as int)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$GroupPerFieldToJson.colorValue(isGreaterThan as int)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$GroupPerFieldToJson.colorValue(isGreaterThanOrEqualTo as int)
            : null,
        whereIn: whereIn?.map((e) => _$GroupPerFieldToJson.colorValue(e)),
        whereNotIn: whereNotIn?.map((e) => _$GroupPerFieldToJson.colorValue(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  GroupQuery whereCreatedBy({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$GroupFieldMap['createdBy']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$GroupPerFieldToJson.createdBy(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$GroupPerFieldToJson.createdBy(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$GroupPerFieldToJson.createdBy(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$GroupPerFieldToJson.createdBy(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$GroupPerFieldToJson.createdBy(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$GroupPerFieldToJson.createdBy(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$GroupPerFieldToJson.createdBy(e)),
        whereNotIn: whereNotIn?.map((e) => _$GroupPerFieldToJson.createdBy(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  GroupQuery whereSumAmount({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<double?>? whereIn,
    List<double?>? whereNotIn,
    bool? isNull,
  }) {
    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$GroupFieldMap['sumAmount']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$GroupPerFieldToJson.sumAmount(isEqualTo as double?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$GroupPerFieldToJson.sumAmount(isNotEqualTo as double?)
            : null,
        isLessThan: isLessThan != null
            ? _$GroupPerFieldToJson.sumAmount(isLessThan as double?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$GroupPerFieldToJson.sumAmount(isLessThanOrEqualTo as double?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$GroupPerFieldToJson.sumAmount(isGreaterThan as double?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$GroupPerFieldToJson.sumAmount(isGreaterThanOrEqualTo as double?)
            : null,
        whereIn: whereIn?.map((e) => _$GroupPerFieldToJson.sumAmount(e)),
        whereNotIn: whereNotIn?.map((e) => _$GroupPerFieldToJson.sumAmount(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  GroupQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  GroupQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  GroupQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$GroupFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  GroupQuery orderByColorValue({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$GroupFieldMap['colorValue']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  GroupQuery orderByCreatedBy({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$GroupFieldMap['createdBy']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  GroupQuery orderBySumAmount({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$GroupFieldMap['sumAmount']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$GroupQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class GroupDocumentSnapshot extends FirestoreDocumentSnapshot<Group> {
  GroupDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Group> snapshot;

  @override
  GroupDocumentReference get reference {
    return GroupDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Group? data;
}

class GroupQuerySnapshot
    extends FirestoreQuerySnapshot<Group, GroupQueryDocumentSnapshot> {
  GroupQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory GroupQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Group> snapshot,
  ) {
    final docs = snapshot.docs.map(GroupQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        GroupDocumentSnapshot._,
      );
    }).toList();

    return GroupQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<GroupDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    GroupDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<GroupDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Group> snapshot;

  @override
  final List<GroupQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<GroupDocumentSnapshot>> docChanges;
}

class GroupQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Group>
    implements GroupDocumentSnapshot {
  GroupQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Group> snapshot;

  @override
  final Group data;

  @override
  GroupDocumentReference get reference {
    return GroupDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class ExpenseCollectionReference
    implements
        ExpenseQuery,
        FirestoreCollectionReference<Expense, ExpenseQuerySnapshot> {
  factory ExpenseCollectionReference(
    DocumentReference<Group> parent,
  ) = _$ExpenseCollectionReference;

  static Expense fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Expense.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Expense value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<Expense> get reference;

  /// A reference to the containing [GroupDocumentReference] if this is a subcollection.
  GroupDocumentReference get parent;

  @override
  ExpenseDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ExpenseDocumentReference> add(Expense value);
}

class _$ExpenseCollectionReference extends _$ExpenseQuery
    implements ExpenseCollectionReference {
  factory _$ExpenseCollectionReference(
    DocumentReference<Group> parent,
  ) {
    return _$ExpenseCollectionReference._(
      GroupDocumentReference(parent),
      parent.collection('expenses').withConverter(
            fromFirestore: ExpenseCollectionReference.fromFirestore,
            toFirestore: ExpenseCollectionReference.toFirestore,
          ),
    );
  }

  _$ExpenseCollectionReference._(
    this.parent,
    CollectionReference<Expense> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final GroupDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Expense> get reference =>
      super.reference as CollectionReference<Expense>;

  @override
  ExpenseDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return ExpenseDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ExpenseDocumentReference> add(Expense value) {
    return reference.add(value).then((ref) => ExpenseDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ExpenseCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ExpenseDocumentReference
    extends FirestoreDocumentReference<Expense, ExpenseDocumentSnapshot> {
  factory ExpenseDocumentReference(DocumentReference<Expense> reference) =
      _$ExpenseDocumentReference;

  DocumentReference<Expense> get reference;

  /// A reference to the [ExpenseCollectionReference] containing this document.
  ExpenseCollectionReference get parent {
    return _$ExpenseCollectionReference(
      reference.parent.parent!.withConverter<Group>(
        fromFirestore: GroupCollectionReference.fromFirestore,
        toFirestore: GroupCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ExpenseDocumentSnapshot> snapshots();

  @override
  Future<ExpenseDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String name,
    FieldValue nameFieldValue,
    double amount,
    FieldValue amountFieldValue,
    String createdBy,
    FieldValue createdByFieldValue,
    Timestamp createdAt,
    FieldValue createdAtFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String name,
    FieldValue nameFieldValue,
    double amount,
    FieldValue amountFieldValue,
    String createdBy,
    FieldValue createdByFieldValue,
    Timestamp createdAt,
    FieldValue createdAtFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String name,
    FieldValue nameFieldValue,
    double amount,
    FieldValue amountFieldValue,
    String createdBy,
    FieldValue createdByFieldValue,
    Timestamp createdAt,
    FieldValue createdAtFieldValue,
  });
}

class _$ExpenseDocumentReference
    extends FirestoreDocumentReference<Expense, ExpenseDocumentSnapshot>
    implements ExpenseDocumentReference {
  _$ExpenseDocumentReference(this.reference);

  @override
  final DocumentReference<Expense> reference;

  /// A reference to the [ExpenseCollectionReference] containing this document.
  ExpenseCollectionReference get parent {
    return _$ExpenseCollectionReference(
      reference.parent.parent!.withConverter<Group>(
        fromFirestore: GroupCollectionReference.fromFirestore,
        toFirestore: GroupCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ExpenseDocumentSnapshot> snapshots() {
    return reference.snapshots().map(ExpenseDocumentSnapshot._);
  }

  @override
  Future<ExpenseDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(ExpenseDocumentSnapshot._);
  }

  @override
  Future<ExpenseDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(ExpenseDocumentSnapshot._);
  }

  Future<void> update({
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? amount = _sentinel,
    FieldValue? amountFieldValue,
    Object? createdBy = _sentinel,
    FieldValue? createdByFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
  }) async {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      amount == _sentinel || amountFieldValue == null,
      "Cannot specify both amount and amountFieldValue",
    );
    assert(
      createdBy == _sentinel || createdByFieldValue == null,
      "Cannot specify both createdBy and createdByFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$ExpenseFieldMap['name']!:
            _$ExpensePerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$ExpenseFieldMap['name']!: nameFieldValue,
      if (amount != _sentinel)
        _$ExpenseFieldMap['amount']!:
            _$ExpensePerFieldToJson.amount(amount as double),
      if (amountFieldValue != null)
        _$ExpenseFieldMap['amount']!: amountFieldValue,
      if (createdBy != _sentinel)
        _$ExpenseFieldMap['createdBy']!:
            _$ExpensePerFieldToJson.createdBy(createdBy as String),
      if (createdByFieldValue != null)
        _$ExpenseFieldMap['createdBy']!: createdByFieldValue,
      if (createdAt != _sentinel)
        _$ExpenseFieldMap['createdAt']!:
            _$ExpensePerFieldToJson.createdAt(createdAt as Timestamp),
      if (createdAtFieldValue != null)
        _$ExpenseFieldMap['createdAt']!: createdAtFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? amount = _sentinel,
    FieldValue? amountFieldValue,
    Object? createdBy = _sentinel,
    FieldValue? createdByFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      amount == _sentinel || amountFieldValue == null,
      "Cannot specify both amount and amountFieldValue",
    );
    assert(
      createdBy == _sentinel || createdByFieldValue == null,
      "Cannot specify both createdBy and createdByFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$ExpenseFieldMap['name']!:
            _$ExpensePerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$ExpenseFieldMap['name']!: nameFieldValue,
      if (amount != _sentinel)
        _$ExpenseFieldMap['amount']!:
            _$ExpensePerFieldToJson.amount(amount as double),
      if (amountFieldValue != null)
        _$ExpenseFieldMap['amount']!: amountFieldValue,
      if (createdBy != _sentinel)
        _$ExpenseFieldMap['createdBy']!:
            _$ExpensePerFieldToJson.createdBy(createdBy as String),
      if (createdByFieldValue != null)
        _$ExpenseFieldMap['createdBy']!: createdByFieldValue,
      if (createdAt != _sentinel)
        _$ExpenseFieldMap['createdAt']!:
            _$ExpensePerFieldToJson.createdAt(createdAt as Timestamp),
      if (createdAtFieldValue != null)
        _$ExpenseFieldMap['createdAt']!: createdAtFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? amount = _sentinel,
    FieldValue? amountFieldValue,
    Object? createdBy = _sentinel,
    FieldValue? createdByFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      amount == _sentinel || amountFieldValue == null,
      "Cannot specify both amount and amountFieldValue",
    );
    assert(
      createdBy == _sentinel || createdByFieldValue == null,
      "Cannot specify both createdBy and createdByFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$ExpenseFieldMap['name']!:
            _$ExpensePerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$ExpenseFieldMap['name']!: nameFieldValue,
      if (amount != _sentinel)
        _$ExpenseFieldMap['amount']!:
            _$ExpensePerFieldToJson.amount(amount as double),
      if (amountFieldValue != null)
        _$ExpenseFieldMap['amount']!: amountFieldValue,
      if (createdBy != _sentinel)
        _$ExpenseFieldMap['createdBy']!:
            _$ExpensePerFieldToJson.createdBy(createdBy as String),
      if (createdByFieldValue != null)
        _$ExpenseFieldMap['createdBy']!: createdByFieldValue,
      if (createdAt != _sentinel)
        _$ExpenseFieldMap['createdAt']!:
            _$ExpensePerFieldToJson.createdAt(createdAt as Timestamp),
      if (createdAtFieldValue != null)
        _$ExpenseFieldMap['createdAt']!: createdAtFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpenseDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class ExpenseQuery
    implements QueryReference<Expense, ExpenseQuerySnapshot> {
  @override
  ExpenseQuery limit(int limit);

  @override
  ExpenseQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  ExpenseQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  ExpenseQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  ExpenseQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  ExpenseQuery whereAmount({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    List<double>? whereIn,
    List<double>? whereNotIn,
    bool? isNull,
  });

  ExpenseQuery whereCreatedBy({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  ExpenseQuery whereCreatedAt({
    Timestamp? isEqualTo,
    Timestamp? isNotEqualTo,
    Timestamp? isLessThan,
    Timestamp? isLessThanOrEqualTo,
    Timestamp? isGreaterThan,
    Timestamp? isGreaterThanOrEqualTo,
    List<Timestamp>? whereIn,
    List<Timestamp>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  ExpenseQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });

  ExpenseQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });

  ExpenseQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });

  ExpenseQuery orderByAmount({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });

  ExpenseQuery orderByCreatedBy({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });

  ExpenseQuery orderByCreatedAt({
    bool descending = false,
    Timestamp startAt,
    Timestamp startAfter,
    Timestamp endAt,
    Timestamp endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });
}

class _$ExpenseQuery extends QueryReference<Expense, ExpenseQuerySnapshot>
    implements ExpenseQuery {
  _$ExpenseQuery(
    this._collection, {
    required Query<Expense> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<ExpenseQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(ExpenseQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<ExpenseQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(ExpenseQuerySnapshot._fromQuerySnapshot);
  }

  @override
  ExpenseQuery limit(int limit) {
    return _$ExpenseQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ExpenseQuery limitToLast(int limit) {
    return _$ExpenseQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ExpenseQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$ExpenseQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ExpenseQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$ExpenseQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ExpenseQuery whereName({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$ExpenseQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ExpenseFieldMap['name']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$ExpensePerFieldToJson.name(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$ExpensePerFieldToJson.name(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$ExpensePerFieldToJson.name(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ExpensePerFieldToJson.name(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ExpensePerFieldToJson.name(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ExpensePerFieldToJson.name(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$ExpensePerFieldToJson.name(e)),
        whereNotIn: whereNotIn?.map((e) => _$ExpensePerFieldToJson.name(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ExpenseQuery whereAmount({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<double>? whereIn,
    List<double>? whereNotIn,
    bool? isNull,
  }) {
    return _$ExpenseQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ExpenseFieldMap['amount']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$ExpensePerFieldToJson.amount(isEqualTo as double)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$ExpensePerFieldToJson.amount(isNotEqualTo as double)
            : null,
        isLessThan: isLessThan != null
            ? _$ExpensePerFieldToJson.amount(isLessThan as double)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ExpensePerFieldToJson.amount(isLessThanOrEqualTo as double)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ExpensePerFieldToJson.amount(isGreaterThan as double)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ExpensePerFieldToJson.amount(isGreaterThanOrEqualTo as double)
            : null,
        whereIn: whereIn?.map((e) => _$ExpensePerFieldToJson.amount(e)),
        whereNotIn: whereNotIn?.map((e) => _$ExpensePerFieldToJson.amount(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ExpenseQuery whereCreatedBy({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$ExpenseQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ExpenseFieldMap['createdBy']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$ExpensePerFieldToJson.createdBy(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$ExpensePerFieldToJson.createdBy(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$ExpensePerFieldToJson.createdBy(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ExpensePerFieldToJson.createdBy(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ExpensePerFieldToJson.createdBy(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ExpensePerFieldToJson
                .createdBy(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$ExpensePerFieldToJson.createdBy(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$ExpensePerFieldToJson.createdBy(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ExpenseQuery whereCreatedAt({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<Timestamp>? whereIn,
    List<Timestamp>? whereNotIn,
    bool? isNull,
  }) {
    return _$ExpenseQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ExpenseFieldMap['createdAt']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$ExpensePerFieldToJson.createdAt(isEqualTo as Timestamp)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$ExpensePerFieldToJson.createdAt(isNotEqualTo as Timestamp)
            : null,
        isLessThan: isLessThan != null
            ? _$ExpensePerFieldToJson.createdAt(isLessThan as Timestamp)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ExpensePerFieldToJson
                .createdAt(isLessThanOrEqualTo as Timestamp)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ExpensePerFieldToJson.createdAt(isGreaterThan as Timestamp)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ExpensePerFieldToJson
                .createdAt(isGreaterThanOrEqualTo as Timestamp)
            : null,
        whereIn: whereIn?.map((e) => _$ExpensePerFieldToJson.createdAt(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$ExpensePerFieldToJson.createdAt(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ExpenseQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ExpenseQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ExpenseQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ExpenseQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ExpenseQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$ExpenseFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ExpenseQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ExpenseQuery orderByAmount({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$ExpenseFieldMap['amount']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ExpenseQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ExpenseQuery orderByCreatedBy({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$ExpenseFieldMap['createdBy']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ExpenseQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ExpenseQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$ExpenseFieldMap['createdAt']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ExpenseQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$ExpenseQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ExpenseDocumentSnapshot extends FirestoreDocumentSnapshot<Expense> {
  ExpenseDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Expense> snapshot;

  @override
  ExpenseDocumentReference get reference {
    return ExpenseDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Expense? data;
}

class ExpenseQuerySnapshot
    extends FirestoreQuerySnapshot<Expense, ExpenseQueryDocumentSnapshot> {
  ExpenseQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory ExpenseQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Expense> snapshot,
  ) {
    final docs = snapshot.docs.map(ExpenseQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        ExpenseDocumentSnapshot._,
      );
    }).toList();

    return ExpenseQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<ExpenseDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    ExpenseDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<ExpenseDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Expense> snapshot;

  @override
  final List<ExpenseQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ExpenseDocumentSnapshot>> docChanges;
}

class ExpenseQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Expense>
    implements ExpenseDocumentSnapshot {
  ExpenseQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Expense> snapshot;

  @override
  final Expense data;

  @override
  ExpenseDocumentReference get reference {
    return ExpenseDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      id: json['id'] as String,
      name: json['name'] as String,
      colorValue: (json['colorValue'] as num).toInt(),
      createdBy: json['createdBy'] as String,
      sumAmount: (json['sumAmount'] as num?)?.toDouble(),
    );

const _$GroupFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'colorValue': 'colorValue',
  'createdBy': 'createdBy',
  'sumAmount': 'sumAmount',
};

// ignore: unused_element
abstract class _$GroupPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? colorValue(int instance) => instance;
  // ignore: unused_element
  static Object? createdBy(String instance) => instance;
  // ignore: unused_element
  static Object? sumAmount(double? instance) => instance;
}

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'colorValue': instance.colorValue,
      'createdBy': instance.createdBy,
      'sumAmount': instance.sumAmount,
    };

Expense _$ExpenseFromJson(Map<String, dynamic> json) => Expense(
      id: json['id'] as String,
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
      createdBy: json['createdBy'] as String,
      createdAt: const FirestoreTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp),
    );

const _$ExpenseFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'amount': 'amount',
  'createdBy': 'createdBy',
  'createdAt': 'createdAt',
};

// ignore: unused_element
abstract class _$ExpensePerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? amount(double instance) => instance;
  // ignore: unused_element
  static Object? createdBy(String instance) => instance;
  // ignore: unused_element
  static Object? createdAt(Timestamp instance) =>
      const FirestoreTimestampConverter().toJson(instance);
}

Map<String, dynamic> _$ExpenseToJson(Expense instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'createdBy': instance.createdBy,
      'createdAt':
          const FirestoreTimestampConverter().toJson(instance.createdAt),
    };
