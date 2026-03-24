// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState()';
}


}

/// @nodoc
class $ProfileStateCopyWith<$Res>  {
$ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( LogoutLoading value)?  logoutLoading,TResult Function( LogoutSuccess value)?  logoutSuccess,TResult Function( LogoutError value)?  logoutError,TResult Function( ProfileLoading value)?  profileLoading,TResult Function( ProfileSuccess value)?  profileSuccess,TResult Function( ProfileImageUpdated value)?  profileImageUpdated,TResult Function( ProfileError value)?  profileError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LogoutLoading() when logoutLoading != null:
return logoutLoading(_that);case LogoutSuccess() when logoutSuccess != null:
return logoutSuccess(_that);case LogoutError() when logoutError != null:
return logoutError(_that);case ProfileLoading() when profileLoading != null:
return profileLoading(_that);case ProfileSuccess() when profileSuccess != null:
return profileSuccess(_that);case ProfileImageUpdated() when profileImageUpdated != null:
return profileImageUpdated(_that);case ProfileError() when profileError != null:
return profileError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( LogoutLoading value)  logoutLoading,required TResult Function( LogoutSuccess value)  logoutSuccess,required TResult Function( LogoutError value)  logoutError,required TResult Function( ProfileLoading value)  profileLoading,required TResult Function( ProfileSuccess value)  profileSuccess,required TResult Function( ProfileImageUpdated value)  profileImageUpdated,required TResult Function( ProfileError value)  profileError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case LogoutLoading():
return logoutLoading(_that);case LogoutSuccess():
return logoutSuccess(_that);case LogoutError():
return logoutError(_that);case ProfileLoading():
return profileLoading(_that);case ProfileSuccess():
return profileSuccess(_that);case ProfileImageUpdated():
return profileImageUpdated(_that);case ProfileError():
return profileError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( LogoutLoading value)?  logoutLoading,TResult? Function( LogoutSuccess value)?  logoutSuccess,TResult? Function( LogoutError value)?  logoutError,TResult? Function( ProfileLoading value)?  profileLoading,TResult? Function( ProfileSuccess value)?  profileSuccess,TResult? Function( ProfileImageUpdated value)?  profileImageUpdated,TResult? Function( ProfileError value)?  profileError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LogoutLoading() when logoutLoading != null:
return logoutLoading(_that);case LogoutSuccess() when logoutSuccess != null:
return logoutSuccess(_that);case LogoutError() when logoutError != null:
return logoutError(_that);case ProfileLoading() when profileLoading != null:
return profileLoading(_that);case ProfileSuccess() when profileSuccess != null:
return profileSuccess(_that);case ProfileImageUpdated() when profileImageUpdated != null:
return profileImageUpdated(_that);case ProfileError() when profileError != null:
return profileError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  logoutLoading,TResult Function()?  logoutSuccess,TResult Function( String error)?  logoutError,TResult Function()?  profileLoading,TResult Function( ProfileData data)?  profileSuccess,TResult Function( String imagePath)?  profileImageUpdated,TResult Function( String error)?  profileError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LogoutLoading() when logoutLoading != null:
return logoutLoading();case LogoutSuccess() when logoutSuccess != null:
return logoutSuccess();case LogoutError() when logoutError != null:
return logoutError(_that.error);case ProfileLoading() when profileLoading != null:
return profileLoading();case ProfileSuccess() when profileSuccess != null:
return profileSuccess(_that.data);case ProfileImageUpdated() when profileImageUpdated != null:
return profileImageUpdated(_that.imagePath);case ProfileError() when profileError != null:
return profileError(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  logoutLoading,required TResult Function()  logoutSuccess,required TResult Function( String error)  logoutError,required TResult Function()  profileLoading,required TResult Function( ProfileData data)  profileSuccess,required TResult Function( String imagePath)  profileImageUpdated,required TResult Function( String error)  profileError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case LogoutLoading():
return logoutLoading();case LogoutSuccess():
return logoutSuccess();case LogoutError():
return logoutError(_that.error);case ProfileLoading():
return profileLoading();case ProfileSuccess():
return profileSuccess(_that.data);case ProfileImageUpdated():
return profileImageUpdated(_that.imagePath);case ProfileError():
return profileError(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  logoutLoading,TResult? Function()?  logoutSuccess,TResult? Function( String error)?  logoutError,TResult? Function()?  profileLoading,TResult? Function( ProfileData data)?  profileSuccess,TResult? Function( String imagePath)?  profileImageUpdated,TResult? Function( String error)?  profileError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LogoutLoading() when logoutLoading != null:
return logoutLoading();case LogoutSuccess() when logoutSuccess != null:
return logoutSuccess();case LogoutError() when logoutError != null:
return logoutError(_that.error);case ProfileLoading() when profileLoading != null:
return profileLoading();case ProfileSuccess() when profileSuccess != null:
return profileSuccess(_that.data);case ProfileImageUpdated() when profileImageUpdated != null:
return profileImageUpdated(_that.imagePath);case ProfileError() when profileError != null:
return profileError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProfileState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.initial()';
}


}




/// @nodoc


class LogoutLoading implements ProfileState {
  const LogoutLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.logoutLoading()';
}


}




/// @nodoc


class LogoutSuccess implements ProfileState {
  const LogoutSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.logoutSuccess()';
}


}




/// @nodoc


class LogoutError implements ProfileState {
  const LogoutError(this.error);
  

 final  String error;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutErrorCopyWith<LogoutError> get copyWith => _$LogoutErrorCopyWithImpl<LogoutError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ProfileState.logoutError(error: $error)';
}


}

/// @nodoc
abstract mixin class $LogoutErrorCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $LogoutErrorCopyWith(LogoutError value, $Res Function(LogoutError) _then) = _$LogoutErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$LogoutErrorCopyWithImpl<$Res>
    implements $LogoutErrorCopyWith<$Res> {
  _$LogoutErrorCopyWithImpl(this._self, this._then);

  final LogoutError _self;
  final $Res Function(LogoutError) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(LogoutError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProfileLoading implements ProfileState {
  const ProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.profileLoading()';
}


}




/// @nodoc


class ProfileSuccess implements ProfileState {
  const ProfileSuccess(this.data);
  

 final  ProfileData data;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileSuccessCopyWith<ProfileSuccess> get copyWith => _$ProfileSuccessCopyWithImpl<ProfileSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'ProfileState.profileSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $ProfileSuccessCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ProfileSuccessCopyWith(ProfileSuccess value, $Res Function(ProfileSuccess) _then) = _$ProfileSuccessCopyWithImpl;
@useResult
$Res call({
 ProfileData data
});




}
/// @nodoc
class _$ProfileSuccessCopyWithImpl<$Res>
    implements $ProfileSuccessCopyWith<$Res> {
  _$ProfileSuccessCopyWithImpl(this._self, this._then);

  final ProfileSuccess _self;
  final $Res Function(ProfileSuccess) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(ProfileSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ProfileData,
  ));
}


}

/// @nodoc


class ProfileImageUpdated implements ProfileState {
  const ProfileImageUpdated(this.imagePath);
  

 final  String imagePath;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileImageUpdatedCopyWith<ProfileImageUpdated> get copyWith => _$ProfileImageUpdatedCopyWithImpl<ProfileImageUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileImageUpdated&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}


@override
int get hashCode => Object.hash(runtimeType,imagePath);

@override
String toString() {
  return 'ProfileState.profileImageUpdated(imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class $ProfileImageUpdatedCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ProfileImageUpdatedCopyWith(ProfileImageUpdated value, $Res Function(ProfileImageUpdated) _then) = _$ProfileImageUpdatedCopyWithImpl;
@useResult
$Res call({
 String imagePath
});




}
/// @nodoc
class _$ProfileImageUpdatedCopyWithImpl<$Res>
    implements $ProfileImageUpdatedCopyWith<$Res> {
  _$ProfileImageUpdatedCopyWithImpl(this._self, this._then);

  final ProfileImageUpdated _self;
  final $Res Function(ProfileImageUpdated) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imagePath = null,}) {
  return _then(ProfileImageUpdated(
null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProfileError implements ProfileState {
  const ProfileError(this.error);
  

 final  String error;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileErrorCopyWith<ProfileError> get copyWith => _$ProfileErrorCopyWithImpl<ProfileError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ProfileState.profileError(error: $error)';
}


}

/// @nodoc
abstract mixin class $ProfileErrorCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ProfileErrorCopyWith(ProfileError value, $Res Function(ProfileError) _then) = _$ProfileErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ProfileErrorCopyWithImpl<$Res>
    implements $ProfileErrorCopyWith<$Res> {
  _$ProfileErrorCopyWithImpl(this._self, this._then);

  final ProfileError _self;
  final $Res Function(ProfileError) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ProfileError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
