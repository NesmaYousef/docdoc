// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointments_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppointmentsViewState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentsViewState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppointmentsViewState()';
}


}

/// @nodoc
class $AppointmentsViewStateCopyWith<$Res>  {
$AppointmentsViewStateCopyWith(AppointmentsViewState _, $Res Function(AppointmentsViewState) __);
}


/// Adds pattern-matching-related methods to [AppointmentsViewState].
extension AppointmentsViewStatePatterns on AppointmentsViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AppointmentsViewInitial value)?  initial,TResult Function( AppointmentsViewLoading value)?  loading,TResult Function( AppointmentsViewSuccess value)?  success,TResult Function( AppointmentsViewError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AppointmentsViewInitial() when initial != null:
return initial(_that);case AppointmentsViewLoading() when loading != null:
return loading(_that);case AppointmentsViewSuccess() when success != null:
return success(_that);case AppointmentsViewError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AppointmentsViewInitial value)  initial,required TResult Function( AppointmentsViewLoading value)  loading,required TResult Function( AppointmentsViewSuccess value)  success,required TResult Function( AppointmentsViewError value)  error,}){
final _that = this;
switch (_that) {
case AppointmentsViewInitial():
return initial(_that);case AppointmentsViewLoading():
return loading(_that);case AppointmentsViewSuccess():
return success(_that);case AppointmentsViewError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AppointmentsViewInitial value)?  initial,TResult? Function( AppointmentsViewLoading value)?  loading,TResult? Function( AppointmentsViewSuccess value)?  success,TResult? Function( AppointmentsViewError value)?  error,}){
final _that = this;
switch (_that) {
case AppointmentsViewInitial() when initial != null:
return initial(_that);case AppointmentsViewLoading() when loading != null:
return loading(_that);case AppointmentsViewSuccess() when success != null:
return success(_that);case AppointmentsViewError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<AppointmentModel> appointmentsList)?  success,TResult Function( ApiErrorModel apiErrorModel)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AppointmentsViewInitial() when initial != null:
return initial();case AppointmentsViewLoading() when loading != null:
return loading();case AppointmentsViewSuccess() when success != null:
return success(_that.appointmentsList);case AppointmentsViewError() when error != null:
return error(_that.apiErrorModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<AppointmentModel> appointmentsList)  success,required TResult Function( ApiErrorModel apiErrorModel)  error,}) {final _that = this;
switch (_that) {
case AppointmentsViewInitial():
return initial();case AppointmentsViewLoading():
return loading();case AppointmentsViewSuccess():
return success(_that.appointmentsList);case AppointmentsViewError():
return error(_that.apiErrorModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<AppointmentModel> appointmentsList)?  success,TResult? Function( ApiErrorModel apiErrorModel)?  error,}) {final _that = this;
switch (_that) {
case AppointmentsViewInitial() when initial != null:
return initial();case AppointmentsViewLoading() when loading != null:
return loading();case AppointmentsViewSuccess() when success != null:
return success(_that.appointmentsList);case AppointmentsViewError() when error != null:
return error(_that.apiErrorModel);case _:
  return null;

}
}

}

/// @nodoc


class AppointmentsViewInitial implements AppointmentsViewState {
  const AppointmentsViewInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentsViewInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppointmentsViewState.initial()';
}


}




/// @nodoc


class AppointmentsViewLoading implements AppointmentsViewState {
  const AppointmentsViewLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentsViewLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppointmentsViewState.loading()';
}


}




/// @nodoc


class AppointmentsViewSuccess implements AppointmentsViewState {
  const AppointmentsViewSuccess(final  List<AppointmentModel> appointmentsList): _appointmentsList = appointmentsList;
  

 final  List<AppointmentModel> _appointmentsList;
 List<AppointmentModel> get appointmentsList {
  if (_appointmentsList is EqualUnmodifiableListView) return _appointmentsList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_appointmentsList);
}


/// Create a copy of AppointmentsViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentsViewSuccessCopyWith<AppointmentsViewSuccess> get copyWith => _$AppointmentsViewSuccessCopyWithImpl<AppointmentsViewSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentsViewSuccess&&const DeepCollectionEquality().equals(other._appointmentsList, _appointmentsList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_appointmentsList));

@override
String toString() {
  return 'AppointmentsViewState.success(appointmentsList: $appointmentsList)';
}


}

/// @nodoc
abstract mixin class $AppointmentsViewSuccessCopyWith<$Res> implements $AppointmentsViewStateCopyWith<$Res> {
  factory $AppointmentsViewSuccessCopyWith(AppointmentsViewSuccess value, $Res Function(AppointmentsViewSuccess) _then) = _$AppointmentsViewSuccessCopyWithImpl;
@useResult
$Res call({
 List<AppointmentModel> appointmentsList
});




}
/// @nodoc
class _$AppointmentsViewSuccessCopyWithImpl<$Res>
    implements $AppointmentsViewSuccessCopyWith<$Res> {
  _$AppointmentsViewSuccessCopyWithImpl(this._self, this._then);

  final AppointmentsViewSuccess _self;
  final $Res Function(AppointmentsViewSuccess) _then;

/// Create a copy of AppointmentsViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appointmentsList = null,}) {
  return _then(AppointmentsViewSuccess(
null == appointmentsList ? _self._appointmentsList : appointmentsList // ignore: cast_nullable_to_non_nullable
as List<AppointmentModel>,
  ));
}


}

/// @nodoc


class AppointmentsViewError implements AppointmentsViewState {
  const AppointmentsViewError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of AppointmentsViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentsViewErrorCopyWith<AppointmentsViewError> get copyWith => _$AppointmentsViewErrorCopyWithImpl<AppointmentsViewError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentsViewError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'AppointmentsViewState.error(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $AppointmentsViewErrorCopyWith<$Res> implements $AppointmentsViewStateCopyWith<$Res> {
  factory $AppointmentsViewErrorCopyWith(AppointmentsViewError value, $Res Function(AppointmentsViewError) _then) = _$AppointmentsViewErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$AppointmentsViewErrorCopyWithImpl<$Res>
    implements $AppointmentsViewErrorCopyWith<$Res> {
  _$AppointmentsViewErrorCopyWithImpl(this._self, this._then);

  final AppointmentsViewError _self;
  final $Res Function(AppointmentsViewError) _then;

/// Create a copy of AppointmentsViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(AppointmentsViewError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
