// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_appointment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookAppointmentState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookAppointmentState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookAppointmentState()';
}


}

/// @nodoc
class $BookAppointmentStateCopyWith<$Res>  {
$BookAppointmentStateCopyWith(BookAppointmentState _, $Res Function(BookAppointmentState) __);
}


/// Adds pattern-matching-related methods to [BookAppointmentState].
extension BookAppointmentStatePatterns on BookAppointmentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BookAppointmentInitial value)?  initial,TResult Function( BookAppointmentLoading value)?  loading,TResult Function( BookAppointmentSuccess value)?  success,TResult Function( BookAppointmentError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BookAppointmentInitial() when initial != null:
return initial(_that);case BookAppointmentLoading() when loading != null:
return loading(_that);case BookAppointmentSuccess() when success != null:
return success(_that);case BookAppointmentError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BookAppointmentInitial value)  initial,required TResult Function( BookAppointmentLoading value)  loading,required TResult Function( BookAppointmentSuccess value)  success,required TResult Function( BookAppointmentError value)  error,}){
final _that = this;
switch (_that) {
case BookAppointmentInitial():
return initial(_that);case BookAppointmentLoading():
return loading(_that);case BookAppointmentSuccess():
return success(_that);case BookAppointmentError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BookAppointmentInitial value)?  initial,TResult? Function( BookAppointmentLoading value)?  loading,TResult? Function( BookAppointmentSuccess value)?  success,TResult? Function( BookAppointmentError value)?  error,}){
final _that = this;
switch (_that) {
case BookAppointmentInitial() when initial != null:
return initial(_that);case BookAppointmentLoading() when loading != null:
return loading(_that);case BookAppointmentSuccess() when success != null:
return success(_that);case BookAppointmentError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( AppointmentModel appointment)?  success,TResult Function( ApiErrorModel apiErrorModel)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BookAppointmentInitial() when initial != null:
return initial();case BookAppointmentLoading() when loading != null:
return loading();case BookAppointmentSuccess() when success != null:
return success(_that.appointment);case BookAppointmentError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( AppointmentModel appointment)  success,required TResult Function( ApiErrorModel apiErrorModel)  error,}) {final _that = this;
switch (_that) {
case BookAppointmentInitial():
return initial();case BookAppointmentLoading():
return loading();case BookAppointmentSuccess():
return success(_that.appointment);case BookAppointmentError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( AppointmentModel appointment)?  success,TResult? Function( ApiErrorModel apiErrorModel)?  error,}) {final _that = this;
switch (_that) {
case BookAppointmentInitial() when initial != null:
return initial();case BookAppointmentLoading() when loading != null:
return loading();case BookAppointmentSuccess() when success != null:
return success(_that.appointment);case BookAppointmentError() when error != null:
return error(_that.apiErrorModel);case _:
  return null;

}
}

}

/// @nodoc


class BookAppointmentInitial implements BookAppointmentState {
  const BookAppointmentInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookAppointmentInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookAppointmentState.initial()';
}


}




/// @nodoc


class BookAppointmentLoading implements BookAppointmentState {
  const BookAppointmentLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookAppointmentLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookAppointmentState.loading()';
}


}




/// @nodoc


class BookAppointmentSuccess implements BookAppointmentState {
  const BookAppointmentSuccess(this.appointment);
  

 final  AppointmentModel appointment;

/// Create a copy of BookAppointmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookAppointmentSuccessCopyWith<BookAppointmentSuccess> get copyWith => _$BookAppointmentSuccessCopyWithImpl<BookAppointmentSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookAppointmentSuccess&&(identical(other.appointment, appointment) || other.appointment == appointment));
}


@override
int get hashCode => Object.hash(runtimeType,appointment);

@override
String toString() {
  return 'BookAppointmentState.success(appointment: $appointment)';
}


}

/// @nodoc
abstract mixin class $BookAppointmentSuccessCopyWith<$Res> implements $BookAppointmentStateCopyWith<$Res> {
  factory $BookAppointmentSuccessCopyWith(BookAppointmentSuccess value, $Res Function(BookAppointmentSuccess) _then) = _$BookAppointmentSuccessCopyWithImpl;
@useResult
$Res call({
 AppointmentModel appointment
});




}
/// @nodoc
class _$BookAppointmentSuccessCopyWithImpl<$Res>
    implements $BookAppointmentSuccessCopyWith<$Res> {
  _$BookAppointmentSuccessCopyWithImpl(this._self, this._then);

  final BookAppointmentSuccess _self;
  final $Res Function(BookAppointmentSuccess) _then;

/// Create a copy of BookAppointmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appointment = null,}) {
  return _then(BookAppointmentSuccess(
null == appointment ? _self.appointment : appointment // ignore: cast_nullable_to_non_nullable
as AppointmentModel,
  ));
}


}

/// @nodoc


class BookAppointmentError implements BookAppointmentState {
  const BookAppointmentError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of BookAppointmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookAppointmentErrorCopyWith<BookAppointmentError> get copyWith => _$BookAppointmentErrorCopyWithImpl<BookAppointmentError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookAppointmentError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'BookAppointmentState.error(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $BookAppointmentErrorCopyWith<$Res> implements $BookAppointmentStateCopyWith<$Res> {
  factory $BookAppointmentErrorCopyWith(BookAppointmentError value, $Res Function(BookAppointmentError) _then) = _$BookAppointmentErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$BookAppointmentErrorCopyWithImpl<$Res>
    implements $BookAppointmentErrorCopyWith<$Res> {
  _$BookAppointmentErrorCopyWithImpl(this._self, this._then);

  final BookAppointmentError _self;
  final $Res Function(BookAppointmentError) _then;

/// Create a copy of BookAppointmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(BookAppointmentError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
