// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState<$T>()';
}


}

/// @nodoc
class $HomeStateCopyWith<T,$Res>  {
$HomeStateCopyWith(HomeState<T> _, $Res Function(HomeState<T>) __);
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns<T> on HomeState<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _initial<T> value)?  initial,TResult Function( SpecializationLoading<T> value)?  specializationLoading,TResult Function( SpecializationSuccess<T> value)?  specializationSuccess,TResult Function( SpecializationError<T> value)?  specializationsError,TResult Function( DoctorsSuccess<T> value)?  doctorsSuccess,TResult Function( DoctorsError<T> value)?  doctorsError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _initial() when initial != null:
return initial(_that);case SpecializationLoading() when specializationLoading != null:
return specializationLoading(_that);case SpecializationSuccess() when specializationSuccess != null:
return specializationSuccess(_that);case SpecializationError() when specializationsError != null:
return specializationsError(_that);case DoctorsSuccess() when doctorsSuccess != null:
return doctorsSuccess(_that);case DoctorsError() when doctorsError != null:
return doctorsError(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _initial<T> value)  initial,required TResult Function( SpecializationLoading<T> value)  specializationLoading,required TResult Function( SpecializationSuccess<T> value)  specializationSuccess,required TResult Function( SpecializationError<T> value)  specializationsError,required TResult Function( DoctorsSuccess<T> value)  doctorsSuccess,required TResult Function( DoctorsError<T> value)  doctorsError,}){
final _that = this;
switch (_that) {
case _initial():
return initial(_that);case SpecializationLoading():
return specializationLoading(_that);case SpecializationSuccess():
return specializationSuccess(_that);case SpecializationError():
return specializationsError(_that);case DoctorsSuccess():
return doctorsSuccess(_that);case DoctorsError():
return doctorsError(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _initial<T> value)?  initial,TResult? Function( SpecializationLoading<T> value)?  specializationLoading,TResult? Function( SpecializationSuccess<T> value)?  specializationSuccess,TResult? Function( SpecializationError<T> value)?  specializationsError,TResult? Function( DoctorsSuccess<T> value)?  doctorsSuccess,TResult? Function( DoctorsError<T> value)?  doctorsError,}){
final _that = this;
switch (_that) {
case _initial() when initial != null:
return initial(_that);case SpecializationLoading() when specializationLoading != null:
return specializationLoading(_that);case SpecializationSuccess() when specializationSuccess != null:
return specializationSuccess(_that);case SpecializationError() when specializationsError != null:
return specializationsError(_that);case DoctorsSuccess() when doctorsSuccess != null:
return doctorsSuccess(_that);case DoctorsError() when doctorsError != null:
return doctorsError(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  specializationLoading,TResult Function( List<SpecializationsData?>? specializationDataList)?  specializationSuccess,TResult Function( ApiErrorModel apiErrorModel)?  specializationsError,TResult Function( List<Doctors?>? doctorsList)?  doctorsSuccess,TResult Function()?  doctorsError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _initial() when initial != null:
return initial();case SpecializationLoading() when specializationLoading != null:
return specializationLoading();case SpecializationSuccess() when specializationSuccess != null:
return specializationSuccess(_that.specializationDataList);case SpecializationError() when specializationsError != null:
return specializationsError(_that.apiErrorModel);case DoctorsSuccess() when doctorsSuccess != null:
return doctorsSuccess(_that.doctorsList);case DoctorsError() when doctorsError != null:
return doctorsError();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  specializationLoading,required TResult Function( List<SpecializationsData?>? specializationDataList)  specializationSuccess,required TResult Function( ApiErrorModel apiErrorModel)  specializationsError,required TResult Function( List<Doctors?>? doctorsList)  doctorsSuccess,required TResult Function()  doctorsError,}) {final _that = this;
switch (_that) {
case _initial():
return initial();case SpecializationLoading():
return specializationLoading();case SpecializationSuccess():
return specializationSuccess(_that.specializationDataList);case SpecializationError():
return specializationsError(_that.apiErrorModel);case DoctorsSuccess():
return doctorsSuccess(_that.doctorsList);case DoctorsError():
return doctorsError();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  specializationLoading,TResult? Function( List<SpecializationsData?>? specializationDataList)?  specializationSuccess,TResult? Function( ApiErrorModel apiErrorModel)?  specializationsError,TResult? Function( List<Doctors?>? doctorsList)?  doctorsSuccess,TResult? Function()?  doctorsError,}) {final _that = this;
switch (_that) {
case _initial() when initial != null:
return initial();case SpecializationLoading() when specializationLoading != null:
return specializationLoading();case SpecializationSuccess() when specializationSuccess != null:
return specializationSuccess(_that.specializationDataList);case SpecializationError() when specializationsError != null:
return specializationsError(_that.apiErrorModel);case DoctorsSuccess() when doctorsSuccess != null:
return doctorsSuccess(_that.doctorsList);case DoctorsError() when doctorsError != null:
return doctorsError();case _:
  return null;

}
}

}

/// @nodoc


class _initial<T> implements HomeState<T> {
  const _initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _initial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState<$T>.initial()';
}


}




/// @nodoc


class SpecializationLoading<T> implements HomeState<T> {
  const SpecializationLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecializationLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState<$T>.specializationLoading()';
}


}




/// @nodoc


class SpecializationSuccess<T> implements HomeState<T> {
  const SpecializationSuccess(final  List<SpecializationsData?>? specializationDataList): _specializationDataList = specializationDataList;
  

 final  List<SpecializationsData?>? _specializationDataList;
 List<SpecializationsData?>? get specializationDataList {
  final value = _specializationDataList;
  if (value == null) return null;
  if (_specializationDataList is EqualUnmodifiableListView) return _specializationDataList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpecializationSuccessCopyWith<T, SpecializationSuccess<T>> get copyWith => _$SpecializationSuccessCopyWithImpl<T, SpecializationSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecializationSuccess<T>&&const DeepCollectionEquality().equals(other._specializationDataList, _specializationDataList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_specializationDataList));

@override
String toString() {
  return 'HomeState<$T>.specializationSuccess(specializationDataList: $specializationDataList)';
}


}

/// @nodoc
abstract mixin class $SpecializationSuccessCopyWith<T,$Res> implements $HomeStateCopyWith<T, $Res> {
  factory $SpecializationSuccessCopyWith(SpecializationSuccess<T> value, $Res Function(SpecializationSuccess<T>) _then) = _$SpecializationSuccessCopyWithImpl;
@useResult
$Res call({
 List<SpecializationsData?>? specializationDataList
});




}
/// @nodoc
class _$SpecializationSuccessCopyWithImpl<T,$Res>
    implements $SpecializationSuccessCopyWith<T, $Res> {
  _$SpecializationSuccessCopyWithImpl(this._self, this._then);

  final SpecializationSuccess<T> _self;
  final $Res Function(SpecializationSuccess<T>) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? specializationDataList = freezed,}) {
  return _then(SpecializationSuccess<T>(
freezed == specializationDataList ? _self._specializationDataList : specializationDataList // ignore: cast_nullable_to_non_nullable
as List<SpecializationsData?>?,
  ));
}


}

/// @nodoc


class SpecializationError<T> implements HomeState<T> {
  const SpecializationError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpecializationErrorCopyWith<T, SpecializationError<T>> get copyWith => _$SpecializationErrorCopyWithImpl<T, SpecializationError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecializationError<T>&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'HomeState<$T>.specializationsError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $SpecializationErrorCopyWith<T,$Res> implements $HomeStateCopyWith<T, $Res> {
  factory $SpecializationErrorCopyWith(SpecializationError<T> value, $Res Function(SpecializationError<T>) _then) = _$SpecializationErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$SpecializationErrorCopyWithImpl<T,$Res>
    implements $SpecializationErrorCopyWith<T, $Res> {
  _$SpecializationErrorCopyWithImpl(this._self, this._then);

  final SpecializationError<T> _self;
  final $Res Function(SpecializationError<T>) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(SpecializationError<T>(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class DoctorsSuccess<T> implements HomeState<T> {
  const DoctorsSuccess(final  List<Doctors?>? doctorsList): _doctorsList = doctorsList;
  

 final  List<Doctors?>? _doctorsList;
 List<Doctors?>? get doctorsList {
  final value = _doctorsList;
  if (value == null) return null;
  if (_doctorsList is EqualUnmodifiableListView) return _doctorsList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorsSuccessCopyWith<T, DoctorsSuccess<T>> get copyWith => _$DoctorsSuccessCopyWithImpl<T, DoctorsSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorsSuccess<T>&&const DeepCollectionEquality().equals(other._doctorsList, _doctorsList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_doctorsList));

@override
String toString() {
  return 'HomeState<$T>.doctorsSuccess(doctorsList: $doctorsList)';
}


}

/// @nodoc
abstract mixin class $DoctorsSuccessCopyWith<T,$Res> implements $HomeStateCopyWith<T, $Res> {
  factory $DoctorsSuccessCopyWith(DoctorsSuccess<T> value, $Res Function(DoctorsSuccess<T>) _then) = _$DoctorsSuccessCopyWithImpl;
@useResult
$Res call({
 List<Doctors?>? doctorsList
});




}
/// @nodoc
class _$DoctorsSuccessCopyWithImpl<T,$Res>
    implements $DoctorsSuccessCopyWith<T, $Res> {
  _$DoctorsSuccessCopyWithImpl(this._self, this._then);

  final DoctorsSuccess<T> _self;
  final $Res Function(DoctorsSuccess<T>) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? doctorsList = freezed,}) {
  return _then(DoctorsSuccess<T>(
freezed == doctorsList ? _self._doctorsList : doctorsList // ignore: cast_nullable_to_non_nullable
as List<Doctors?>?,
  ));
}


}

/// @nodoc


class DoctorsError<T> implements HomeState<T> {
  const DoctorsError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorsError<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState<$T>.doctorsError()';
}


}




// dart format on
