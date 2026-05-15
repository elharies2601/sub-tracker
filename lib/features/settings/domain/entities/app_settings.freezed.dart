// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppSettings {
// Always id=1 — single-row table
  int get id => throw _privateConstructorUsedError; // Currency
  String get defaultCurrency =>
      throw _privateConstructorUsedError; // Appearance
  AppTheme get theme => throw _privateConstructorUsedError; // Notifications
  int get reminderHour => throw _privateConstructorUsedError; // default 09:00
  int get reminderMinute => throw _privateConstructorUsedError;
  bool get notificationsEnabled =>
      throw _privateConstructorUsedError; // Security
  bool get biometricLock => throw _privateConstructorUsedError; // Misc
  String get language =>
      throw _privateConstructorUsedError; // BCP-47: 'id', 'en'
// Onboarding
  bool get onboardingCompleted => throw _privateConstructorUsedError; // Ads
  DateTime? get adsHiddenUntil => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) then) =
      _$AppSettingsCopyWithImpl<$Res, AppSettings>;
  @useResult
  $Res call(
      {int id,
      String defaultCurrency,
      AppTheme theme,
      int reminderHour,
      int reminderMinute,
      bool notificationsEnabled,
      bool biometricLock,
      String language,
      bool onboardingCompleted,
      DateTime? adsHiddenUntil,
      DateTime updatedAt});
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res, $Val extends AppSettings>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? defaultCurrency = null,
    Object? theme = null,
    Object? reminderHour = null,
    Object? reminderMinute = null,
    Object? notificationsEnabled = null,
    Object? biometricLock = null,
    Object? language = null,
    Object? onboardingCompleted = null,
    Object? adsHiddenUntil = freezed,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      defaultCurrency: null == defaultCurrency
          ? _value.defaultCurrency
          : defaultCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
      reminderHour: null == reminderHour
          ? _value.reminderHour
          : reminderHour // ignore: cast_nullable_to_non_nullable
              as int,
      reminderMinute: null == reminderMinute
          ? _value.reminderMinute
          : reminderMinute // ignore: cast_nullable_to_non_nullable
              as int,
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      biometricLock: null == biometricLock
          ? _value.biometricLock
          : biometricLock // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      onboardingCompleted: null == onboardingCompleted
          ? _value.onboardingCompleted
          : onboardingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      adsHiddenUntil: freezed == adsHiddenUntil
          ? _value.adsHiddenUntil
          : adsHiddenUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingsImplCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$$AppSettingsImplCopyWith(
          _$AppSettingsImpl value, $Res Function(_$AppSettingsImpl) then) =
      __$$AppSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String defaultCurrency,
      AppTheme theme,
      int reminderHour,
      int reminderMinute,
      bool notificationsEnabled,
      bool biometricLock,
      String language,
      bool onboardingCompleted,
      DateTime? adsHiddenUntil,
      DateTime updatedAt});
}

/// @nodoc
class __$$AppSettingsImplCopyWithImpl<$Res>
    extends _$AppSettingsCopyWithImpl<$Res, _$AppSettingsImpl>
    implements _$$AppSettingsImplCopyWith<$Res> {
  __$$AppSettingsImplCopyWithImpl(
      _$AppSettingsImpl _value, $Res Function(_$AppSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? defaultCurrency = null,
    Object? theme = null,
    Object? reminderHour = null,
    Object? reminderMinute = null,
    Object? notificationsEnabled = null,
    Object? biometricLock = null,
    Object? language = null,
    Object? onboardingCompleted = null,
    Object? adsHiddenUntil = freezed,
    Object? updatedAt = null,
  }) {
    return _then(_$AppSettingsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      defaultCurrency: null == defaultCurrency
          ? _value.defaultCurrency
          : defaultCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
      reminderHour: null == reminderHour
          ? _value.reminderHour
          : reminderHour // ignore: cast_nullable_to_non_nullable
              as int,
      reminderMinute: null == reminderMinute
          ? _value.reminderMinute
          : reminderMinute // ignore: cast_nullable_to_non_nullable
              as int,
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      biometricLock: null == biometricLock
          ? _value.biometricLock
          : biometricLock // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      onboardingCompleted: null == onboardingCompleted
          ? _value.onboardingCompleted
          : onboardingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      adsHiddenUntil: freezed == adsHiddenUntil
          ? _value.adsHiddenUntil
          : adsHiddenUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$AppSettingsImpl extends _AppSettings {
  const _$AppSettingsImpl(
      {this.id = 1,
      this.defaultCurrency = 'IDR',
      this.theme = AppTheme.system,
      this.reminderHour = 9,
      this.reminderMinute = 0,
      this.notificationsEnabled = true,
      this.biometricLock = false,
      this.language = 'id',
      this.onboardingCompleted = false,
      this.adsHiddenUntil,
      required this.updatedAt})
      : super._();

// Always id=1 — single-row table
  @override
  @JsonKey()
  final int id;
// Currency
  @override
  @JsonKey()
  final String defaultCurrency;
// Appearance
  @override
  @JsonKey()
  final AppTheme theme;
// Notifications
  @override
  @JsonKey()
  final int reminderHour;
// default 09:00
  @override
  @JsonKey()
  final int reminderMinute;
  @override
  @JsonKey()
  final bool notificationsEnabled;
// Security
  @override
  @JsonKey()
  final bool biometricLock;
// Misc
  @override
  @JsonKey()
  final String language;
// BCP-47: 'id', 'en'
// Onboarding
  @override
  @JsonKey()
  final bool onboardingCompleted;
// Ads
  @override
  final DateTime? adsHiddenUntil;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'AppSettings(id: $id, defaultCurrency: $defaultCurrency, theme: $theme, reminderHour: $reminderHour, reminderMinute: $reminderMinute, notificationsEnabled: $notificationsEnabled, biometricLock: $biometricLock, language: $language, onboardingCompleted: $onboardingCompleted, adsHiddenUntil: $adsHiddenUntil, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.defaultCurrency, defaultCurrency) ||
                other.defaultCurrency == defaultCurrency) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.reminderHour, reminderHour) ||
                other.reminderHour == reminderHour) &&
            (identical(other.reminderMinute, reminderMinute) ||
                other.reminderMinute == reminderMinute) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled) &&
            (identical(other.biometricLock, biometricLock) ||
                other.biometricLock == biometricLock) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.onboardingCompleted, onboardingCompleted) ||
                other.onboardingCompleted == onboardingCompleted) &&
            (identical(other.adsHiddenUntil, adsHiddenUntil) ||
                other.adsHiddenUntil == adsHiddenUntil) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      defaultCurrency,
      theme,
      reminderHour,
      reminderMinute,
      notificationsEnabled,
      biometricLock,
      language,
      onboardingCompleted,
      adsHiddenUntil,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      __$$AppSettingsImplCopyWithImpl<_$AppSettingsImpl>(this, _$identity);
}

abstract class _AppSettings extends AppSettings {
  const factory _AppSettings(
      {final int id,
      final String defaultCurrency,
      final AppTheme theme,
      final int reminderHour,
      final int reminderMinute,
      final bool notificationsEnabled,
      final bool biometricLock,
      final String language,
      final bool onboardingCompleted,
      final DateTime? adsHiddenUntil,
      required final DateTime updatedAt}) = _$AppSettingsImpl;
  const _AppSettings._() : super._();

  @override // Always id=1 — single-row table
  int get id;
  @override // Currency
  String get defaultCurrency;
  @override // Appearance
  AppTheme get theme;
  @override // Notifications
  int get reminderHour;
  @override // default 09:00
  int get reminderMinute;
  @override
  bool get notificationsEnabled;
  @override // Security
  bool get biometricLock;
  @override // Misc
  String get language;
  @override // BCP-47: 'id', 'en'
// Onboarding
  bool get onboardingCompleted;
  @override // Ads
  DateTime? get adsHiddenUntil;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
