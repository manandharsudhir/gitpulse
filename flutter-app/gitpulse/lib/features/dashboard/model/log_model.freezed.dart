// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LogModel _$LogModelFromJson(Map<String, dynamic> json) {
  return _LogModel.fromJson(json);
}

/// @nodoc
mixin _$LogModel {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  dynamic get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "project_id")
  String? get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: "hours_logged")
  int? get hoursLogged => throw _privateConstructorUsedError;
  @JsonKey(name: "date_created")
  DateTime? get dateCreated => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this LogModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LogModelCopyWith<LogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogModelCopyWith<$Res> {
  factory $LogModelCopyWith(LogModel value, $Res Function(LogModel) then) =
      _$LogModelCopyWithImpl<$Res, LogModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "user_id") dynamic userId,
      @JsonKey(name: "project_id") String? projectId,
      @JsonKey(name: "hours_logged") int? hoursLogged,
      @JsonKey(name: "date_created") DateTime? dateCreated,
      @JsonKey(name: "description") String? description});
}

/// @nodoc
class _$LogModelCopyWithImpl<$Res, $Val extends LogModel>
    implements $LogModelCopyWith<$Res> {
  _$LogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? projectId = freezed,
    Object? hoursLogged = freezed,
    Object? dateCreated = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      hoursLogged: freezed == hoursLogged
          ? _value.hoursLogged
          : hoursLogged // ignore: cast_nullable_to_non_nullable
              as int?,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogModelImplCopyWith<$Res>
    implements $LogModelCopyWith<$Res> {
  factory _$$LogModelImplCopyWith(
          _$LogModelImpl value, $Res Function(_$LogModelImpl) then) =
      __$$LogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "user_id") dynamic userId,
      @JsonKey(name: "project_id") String? projectId,
      @JsonKey(name: "hours_logged") int? hoursLogged,
      @JsonKey(name: "date_created") DateTime? dateCreated,
      @JsonKey(name: "description") String? description});
}

/// @nodoc
class __$$LogModelImplCopyWithImpl<$Res>
    extends _$LogModelCopyWithImpl<$Res, _$LogModelImpl>
    implements _$$LogModelImplCopyWith<$Res> {
  __$$LogModelImplCopyWithImpl(
      _$LogModelImpl _value, $Res Function(_$LogModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? projectId = freezed,
    Object? hoursLogged = freezed,
    Object? dateCreated = freezed,
    Object? description = freezed,
  }) {
    return _then(_$LogModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      hoursLogged: freezed == hoursLogged
          ? _value.hoursLogged
          : hoursLogged // ignore: cast_nullable_to_non_nullable
              as int?,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogModelImpl implements _LogModel {
  const _$LogModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "project_id") this.projectId,
      @JsonKey(name: "hours_logged") this.hoursLogged,
      @JsonKey(name: "date_created") this.dateCreated,
      @JsonKey(name: "description") this.description});

  factory _$LogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "user_id")
  final dynamic userId;
  @override
  @JsonKey(name: "project_id")
  final String? projectId;
  @override
  @JsonKey(name: "hours_logged")
  final int? hoursLogged;
  @override
  @JsonKey(name: "date_created")
  final DateTime? dateCreated;
  @override
  @JsonKey(name: "description")
  final String? description;

  @override
  String toString() {
    return 'LogModel(id: $id, userId: $userId, projectId: $projectId, hoursLogged: $hoursLogged, dateCreated: $dateCreated, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.hoursLogged, hoursLogged) ||
                other.hoursLogged == hoursLogged) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(userId),
      projectId,
      hoursLogged,
      dateCreated,
      description);

  /// Create a copy of LogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogModelImplCopyWith<_$LogModelImpl> get copyWith =>
      __$$LogModelImplCopyWithImpl<_$LogModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogModelImplToJson(
      this,
    );
  }
}

abstract class _LogModel implements LogModel {
  const factory _LogModel(
          {@JsonKey(name: "id") final String? id,
          @JsonKey(name: "user_id") final dynamic userId,
          @JsonKey(name: "project_id") final String? projectId,
          @JsonKey(name: "hours_logged") final int? hoursLogged,
          @JsonKey(name: "date_created") final DateTime? dateCreated,
          @JsonKey(name: "description") final String? description}) =
      _$LogModelImpl;

  factory _LogModel.fromJson(Map<String, dynamic> json) =
      _$LogModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "user_id")
  dynamic get userId;
  @override
  @JsonKey(name: "project_id")
  String? get projectId;
  @override
  @JsonKey(name: "hours_logged")
  int? get hoursLogged;
  @override
  @JsonKey(name: "date_created")
  DateTime? get dateCreated;
  @override
  @JsonKey(name: "description")
  String? get description;

  /// Create a copy of LogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogModelImplCopyWith<_$LogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
