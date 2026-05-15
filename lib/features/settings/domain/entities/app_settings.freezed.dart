// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppSettings {

// Always id=1 — single-row table
 int get id;// Currency
 String get defaultCurrency;// Appearance
 AppTheme get theme;// Notifications
 int get reminderHour;// default 09:00
 int get reminderMinute; bool get notificationsEnabled;// Security
 bool get biometricLock;// Misc
 String get language;// BCP-47: 'id', 'en'
// Onboarding
 bool get onboardingCompleted;// Ads
 DateTime? get adsHiddenUntil; DateTime get updatedAt;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.id, id) || other.id == id)&&(identical(other.defaultCurrency, defaultCurrency) || other.defaultCurrency == defaultCurrency)&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.reminderHour, reminderHour) || other.reminderHour == reminderHour)&&(identical(other.reminderMinute, reminderMinute) || other.reminderMinute == reminderMinute)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.biometricLock, biometricLock) || other.biometricLock == biometricLock)&&(identical(other.language, language) || other.language == language)&&(identical(other.onboardingCompleted, onboardingCompleted) || other.onboardingCompleted == onboardingCompleted)&&(identical(other.adsHiddenUntil, adsHiddenUntil) || other.adsHiddenUntil == adsHiddenUntil)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,defaultCurrency,theme,reminderHour,reminderMinute,notificationsEnabled,biometricLock,language,onboardingCompleted,adsHiddenUntil,updatedAt);

@override
String toString() {
  return 'AppSettings(id: $id, defaultCurrency: $defaultCurrency, theme: $theme, reminderHour: $reminderHour, reminderMinute: $reminderMinute, notificationsEnabled: $notificationsEnabled, biometricLock: $biometricLock, language: $language, onboardingCompleted: $onboardingCompleted, adsHiddenUntil: $adsHiddenUntil, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 int id, String defaultCurrency, AppTheme theme, int reminderHour, int reminderMinute, bool notificationsEnabled, bool biometricLock, String language, bool onboardingCompleted, DateTime? adsHiddenUntil, DateTime updatedAt
});




}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? defaultCurrency = null,Object? theme = null,Object? reminderHour = null,Object? reminderMinute = null,Object? notificationsEnabled = null,Object? biometricLock = null,Object? language = null,Object? onboardingCompleted = null,Object? adsHiddenUntil = freezed,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,defaultCurrency: null == defaultCurrency ? _self.defaultCurrency : defaultCurrency // ignore: cast_nullable_to_non_nullable
as String,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as AppTheme,reminderHour: null == reminderHour ? _self.reminderHour : reminderHour // ignore: cast_nullable_to_non_nullable
as int,reminderMinute: null == reminderMinute ? _self.reminderMinute : reminderMinute // ignore: cast_nullable_to_non_nullable
as int,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,biometricLock: null == biometricLock ? _self.biometricLock : biometricLock // ignore: cast_nullable_to_non_nullable
as bool,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,onboardingCompleted: null == onboardingCompleted ? _self.onboardingCompleted : onboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool,adsHiddenUntil: freezed == adsHiddenUntil ? _self.adsHiddenUntil : adsHiddenUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettings].
extension AppSettingsPatterns on AppSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettings value)  $default,){
final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String defaultCurrency,  AppTheme theme,  int reminderHour,  int reminderMinute,  bool notificationsEnabled,  bool biometricLock,  String language,  bool onboardingCompleted,  DateTime? adsHiddenUntil,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.id,_that.defaultCurrency,_that.theme,_that.reminderHour,_that.reminderMinute,_that.notificationsEnabled,_that.biometricLock,_that.language,_that.onboardingCompleted,_that.adsHiddenUntil,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String defaultCurrency,  AppTheme theme,  int reminderHour,  int reminderMinute,  bool notificationsEnabled,  bool biometricLock,  String language,  bool onboardingCompleted,  DateTime? adsHiddenUntil,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.id,_that.defaultCurrency,_that.theme,_that.reminderHour,_that.reminderMinute,_that.notificationsEnabled,_that.biometricLock,_that.language,_that.onboardingCompleted,_that.adsHiddenUntil,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String defaultCurrency,  AppTheme theme,  int reminderHour,  int reminderMinute,  bool notificationsEnabled,  bool biometricLock,  String language,  bool onboardingCompleted,  DateTime? adsHiddenUntil,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.id,_that.defaultCurrency,_that.theme,_that.reminderHour,_that.reminderMinute,_that.notificationsEnabled,_that.biometricLock,_that.language,_that.onboardingCompleted,_that.adsHiddenUntil,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _AppSettings extends AppSettings {
  const _AppSettings({this.id = 1, this.defaultCurrency = 'IDR', this.theme = AppTheme.system, this.reminderHour = 9, this.reminderMinute = 0, this.notificationsEnabled = true, this.biometricLock = false, this.language = 'id', this.onboardingCompleted = false, this.adsHiddenUntil, required this.updatedAt}): super._();
  

// Always id=1 — single-row table
@override@JsonKey() final  int id;
// Currency
@override@JsonKey() final  String defaultCurrency;
// Appearance
@override@JsonKey() final  AppTheme theme;
// Notifications
@override@JsonKey() final  int reminderHour;
// default 09:00
@override@JsonKey() final  int reminderMinute;
@override@JsonKey() final  bool notificationsEnabled;
// Security
@override@JsonKey() final  bool biometricLock;
// Misc
@override@JsonKey() final  String language;
// BCP-47: 'id', 'en'
// Onboarding
@override@JsonKey() final  bool onboardingCompleted;
// Ads
@override final  DateTime? adsHiddenUntil;
@override final  DateTime updatedAt;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsCopyWith<_AppSettings> get copyWith => __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.id, id) || other.id == id)&&(identical(other.defaultCurrency, defaultCurrency) || other.defaultCurrency == defaultCurrency)&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.reminderHour, reminderHour) || other.reminderHour == reminderHour)&&(identical(other.reminderMinute, reminderMinute) || other.reminderMinute == reminderMinute)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.biometricLock, biometricLock) || other.biometricLock == biometricLock)&&(identical(other.language, language) || other.language == language)&&(identical(other.onboardingCompleted, onboardingCompleted) || other.onboardingCompleted == onboardingCompleted)&&(identical(other.adsHiddenUntil, adsHiddenUntil) || other.adsHiddenUntil == adsHiddenUntil)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,defaultCurrency,theme,reminderHour,reminderMinute,notificationsEnabled,biometricLock,language,onboardingCompleted,adsHiddenUntil,updatedAt);

@override
String toString() {
  return 'AppSettings(id: $id, defaultCurrency: $defaultCurrency, theme: $theme, reminderHour: $reminderHour, reminderMinute: $reminderMinute, notificationsEnabled: $notificationsEnabled, biometricLock: $biometricLock, language: $language, onboardingCompleted: $onboardingCompleted, adsHiddenUntil: $adsHiddenUntil, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 int id, String defaultCurrency, AppTheme theme, int reminderHour, int reminderMinute, bool notificationsEnabled, bool biometricLock, String language, bool onboardingCompleted, DateTime? adsHiddenUntil, DateTime updatedAt
});




}
/// @nodoc
class __$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? defaultCurrency = null,Object? theme = null,Object? reminderHour = null,Object? reminderMinute = null,Object? notificationsEnabled = null,Object? biometricLock = null,Object? language = null,Object? onboardingCompleted = null,Object? adsHiddenUntil = freezed,Object? updatedAt = null,}) {
  return _then(_AppSettings(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,defaultCurrency: null == defaultCurrency ? _self.defaultCurrency : defaultCurrency // ignore: cast_nullable_to_non_nullable
as String,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as AppTheme,reminderHour: null == reminderHour ? _self.reminderHour : reminderHour // ignore: cast_nullable_to_non_nullable
as int,reminderMinute: null == reminderMinute ? _self.reminderMinute : reminderMinute // ignore: cast_nullable_to_non_nullable
as int,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,biometricLock: null == biometricLock ? _self.biometricLock : biometricLock // ignore: cast_nullable_to_non_nullable
as bool,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,onboardingCompleted: null == onboardingCompleted ? _self.onboardingCompleted : onboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool,adsHiddenUntil: freezed == adsHiddenUntil ? _self.adsHiddenUntil : adsHiddenUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
