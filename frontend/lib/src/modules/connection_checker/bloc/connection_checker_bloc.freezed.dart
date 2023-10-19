// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_checker_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectionCheckerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool connected) ready,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool connected)? ready,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool connected)? ready,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConnectionCheckerStateInitial value) initial,
    required TResult Function(ConnectionCheckerStateLoading value) loading,
    required TResult Function(ConnectionCheckerStateReady value) ready,
    required TResult Function(ConnectionCheckerStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConnectionCheckerStateInitial value)? initial,
    TResult? Function(ConnectionCheckerStateLoading value)? loading,
    TResult? Function(ConnectionCheckerStateReady value)? ready,
    TResult? Function(ConnectionCheckerStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConnectionCheckerStateInitial value)? initial,
    TResult Function(ConnectionCheckerStateLoading value)? loading,
    TResult Function(ConnectionCheckerStateReady value)? ready,
    TResult Function(ConnectionCheckerStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionCheckerStateCopyWith<$Res> {
  factory $ConnectionCheckerStateCopyWith(ConnectionCheckerState value,
          $Res Function(ConnectionCheckerState) then) =
      _$ConnectionCheckerStateCopyWithImpl<$Res, ConnectionCheckerState>;
}

/// @nodoc
class _$ConnectionCheckerStateCopyWithImpl<$Res,
        $Val extends ConnectionCheckerState>
    implements $ConnectionCheckerStateCopyWith<$Res> {
  _$ConnectionCheckerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ConnectionCheckerStateInitialCopyWith<$Res> {
  factory _$$_ConnectionCheckerStateInitialCopyWith(
          _$_ConnectionCheckerStateInitial value,
          $Res Function(_$_ConnectionCheckerStateInitial) then) =
      __$$_ConnectionCheckerStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ConnectionCheckerStateInitialCopyWithImpl<$Res>
    extends _$ConnectionCheckerStateCopyWithImpl<$Res,
        _$_ConnectionCheckerStateInitial>
    implements _$$_ConnectionCheckerStateInitialCopyWith<$Res> {
  __$$_ConnectionCheckerStateInitialCopyWithImpl(
      _$_ConnectionCheckerStateInitial _value,
      $Res Function(_$_ConnectionCheckerStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ConnectionCheckerStateInitial
    implements _ConnectionCheckerStateInitial {
  const _$_ConnectionCheckerStateInitial();

  @override
  String toString() {
    return 'ConnectionCheckerState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectionCheckerStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool connected) ready,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool connected)? ready,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool connected)? ready,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConnectionCheckerStateInitial value) initial,
    required TResult Function(ConnectionCheckerStateLoading value) loading,
    required TResult Function(ConnectionCheckerStateReady value) ready,
    required TResult Function(ConnectionCheckerStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConnectionCheckerStateInitial value)? initial,
    TResult? Function(ConnectionCheckerStateLoading value)? loading,
    TResult? Function(ConnectionCheckerStateReady value)? ready,
    TResult? Function(ConnectionCheckerStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConnectionCheckerStateInitial value)? initial,
    TResult Function(ConnectionCheckerStateLoading value)? loading,
    TResult Function(ConnectionCheckerStateReady value)? ready,
    TResult Function(ConnectionCheckerStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ConnectionCheckerStateInitial
    implements ConnectionCheckerState {
  const factory _ConnectionCheckerStateInitial() =
      _$_ConnectionCheckerStateInitial;
}

/// @nodoc
abstract class _$$ConnectionCheckerStateLoadingCopyWith<$Res> {
  factory _$$ConnectionCheckerStateLoadingCopyWith(
          _$ConnectionCheckerStateLoading value,
          $Res Function(_$ConnectionCheckerStateLoading) then) =
      __$$ConnectionCheckerStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectionCheckerStateLoadingCopyWithImpl<$Res>
    extends _$ConnectionCheckerStateCopyWithImpl<$Res,
        _$ConnectionCheckerStateLoading>
    implements _$$ConnectionCheckerStateLoadingCopyWith<$Res> {
  __$$ConnectionCheckerStateLoadingCopyWithImpl(
      _$ConnectionCheckerStateLoading _value,
      $Res Function(_$ConnectionCheckerStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConnectionCheckerStateLoading implements ConnectionCheckerStateLoading {
  const _$ConnectionCheckerStateLoading();

  @override
  String toString() {
    return 'ConnectionCheckerState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionCheckerStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool connected) ready,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool connected)? ready,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool connected)? ready,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConnectionCheckerStateInitial value) initial,
    required TResult Function(ConnectionCheckerStateLoading value) loading,
    required TResult Function(ConnectionCheckerStateReady value) ready,
    required TResult Function(ConnectionCheckerStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConnectionCheckerStateInitial value)? initial,
    TResult? Function(ConnectionCheckerStateLoading value)? loading,
    TResult? Function(ConnectionCheckerStateReady value)? ready,
    TResult? Function(ConnectionCheckerStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConnectionCheckerStateInitial value)? initial,
    TResult Function(ConnectionCheckerStateLoading value)? loading,
    TResult Function(ConnectionCheckerStateReady value)? ready,
    TResult Function(ConnectionCheckerStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ConnectionCheckerStateLoading implements ConnectionCheckerState {
  const factory ConnectionCheckerStateLoading() =
      _$ConnectionCheckerStateLoading;
}

/// @nodoc
abstract class _$$ConnectionCheckerStateReadyCopyWith<$Res> {
  factory _$$ConnectionCheckerStateReadyCopyWith(
          _$ConnectionCheckerStateReady value,
          $Res Function(_$ConnectionCheckerStateReady) then) =
      __$$ConnectionCheckerStateReadyCopyWithImpl<$Res>;
  @useResult
  $Res call({bool connected});
}

/// @nodoc
class __$$ConnectionCheckerStateReadyCopyWithImpl<$Res>
    extends _$ConnectionCheckerStateCopyWithImpl<$Res,
        _$ConnectionCheckerStateReady>
    implements _$$ConnectionCheckerStateReadyCopyWith<$Res> {
  __$$ConnectionCheckerStateReadyCopyWithImpl(
      _$ConnectionCheckerStateReady _value,
      $Res Function(_$ConnectionCheckerStateReady) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connected = null,
  }) {
    return _then(_$ConnectionCheckerStateReady(
      connected: null == connected
          ? _value.connected
          : connected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ConnectionCheckerStateReady implements ConnectionCheckerStateReady {
  const _$ConnectionCheckerStateReady({required this.connected});

  @override
  final bool connected;

  @override
  String toString() {
    return 'ConnectionCheckerState.ready(connected: $connected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionCheckerStateReady &&
            (identical(other.connected, connected) ||
                other.connected == connected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, connected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionCheckerStateReadyCopyWith<_$ConnectionCheckerStateReady>
      get copyWith => __$$ConnectionCheckerStateReadyCopyWithImpl<
          _$ConnectionCheckerStateReady>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool connected) ready,
    required TResult Function(String message) error,
  }) {
    return ready(connected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool connected)? ready,
    TResult? Function(String message)? error,
  }) {
    return ready?.call(connected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool connected)? ready,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(connected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConnectionCheckerStateInitial value) initial,
    required TResult Function(ConnectionCheckerStateLoading value) loading,
    required TResult Function(ConnectionCheckerStateReady value) ready,
    required TResult Function(ConnectionCheckerStateError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConnectionCheckerStateInitial value)? initial,
    TResult? Function(ConnectionCheckerStateLoading value)? loading,
    TResult? Function(ConnectionCheckerStateReady value)? ready,
    TResult? Function(ConnectionCheckerStateError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConnectionCheckerStateInitial value)? initial,
    TResult Function(ConnectionCheckerStateLoading value)? loading,
    TResult Function(ConnectionCheckerStateReady value)? ready,
    TResult Function(ConnectionCheckerStateError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class ConnectionCheckerStateReady implements ConnectionCheckerState {
  const factory ConnectionCheckerStateReady({required final bool connected}) =
      _$ConnectionCheckerStateReady;

  bool get connected;
  @JsonKey(ignore: true)
  _$$ConnectionCheckerStateReadyCopyWith<_$ConnectionCheckerStateReady>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectionCheckerStateErrorCopyWith<$Res> {
  factory _$$ConnectionCheckerStateErrorCopyWith(
          _$ConnectionCheckerStateError value,
          $Res Function(_$ConnectionCheckerStateError) then) =
      __$$ConnectionCheckerStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ConnectionCheckerStateErrorCopyWithImpl<$Res>
    extends _$ConnectionCheckerStateCopyWithImpl<$Res,
        _$ConnectionCheckerStateError>
    implements _$$ConnectionCheckerStateErrorCopyWith<$Res> {
  __$$ConnectionCheckerStateErrorCopyWithImpl(
      _$ConnectionCheckerStateError _value,
      $Res Function(_$ConnectionCheckerStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ConnectionCheckerStateError(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConnectionCheckerStateError implements ConnectionCheckerStateError {
  const _$ConnectionCheckerStateError({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ConnectionCheckerState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionCheckerStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionCheckerStateErrorCopyWith<_$ConnectionCheckerStateError>
      get copyWith => __$$ConnectionCheckerStateErrorCopyWithImpl<
          _$ConnectionCheckerStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool connected) ready,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool connected)? ready,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool connected)? ready,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConnectionCheckerStateInitial value) initial,
    required TResult Function(ConnectionCheckerStateLoading value) loading,
    required TResult Function(ConnectionCheckerStateReady value) ready,
    required TResult Function(ConnectionCheckerStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConnectionCheckerStateInitial value)? initial,
    TResult? Function(ConnectionCheckerStateLoading value)? loading,
    TResult? Function(ConnectionCheckerStateReady value)? ready,
    TResult? Function(ConnectionCheckerStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConnectionCheckerStateInitial value)? initial,
    TResult Function(ConnectionCheckerStateLoading value)? loading,
    TResult Function(ConnectionCheckerStateReady value)? ready,
    TResult Function(ConnectionCheckerStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ConnectionCheckerStateError implements ConnectionCheckerState {
  const factory ConnectionCheckerStateError({required final String message}) =
      _$ConnectionCheckerStateError;

  String get message;
  @JsonKey(ignore: true)
  _$$ConnectionCheckerStateErrorCopyWith<_$ConnectionCheckerStateError>
      get copyWith => throw _privateConstructorUsedError;
}
