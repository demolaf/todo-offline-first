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
abstract class _$$ConnectionCheckerStateInitialImplCopyWith<$Res> {
  factory _$$ConnectionCheckerStateInitialImplCopyWith(
          _$ConnectionCheckerStateInitialImpl value,
          $Res Function(_$ConnectionCheckerStateInitialImpl) then) =
      __$$ConnectionCheckerStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectionCheckerStateInitialImplCopyWithImpl<$Res>
    extends _$ConnectionCheckerStateCopyWithImpl<$Res,
        _$ConnectionCheckerStateInitialImpl>
    implements _$$ConnectionCheckerStateInitialImplCopyWith<$Res> {
  __$$ConnectionCheckerStateInitialImplCopyWithImpl(
      _$ConnectionCheckerStateInitialImpl _value,
      $Res Function(_$ConnectionCheckerStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConnectionCheckerStateInitialImpl
    implements _ConnectionCheckerStateInitial {
  const _$ConnectionCheckerStateInitialImpl();

  @override
  String toString() {
    return 'ConnectionCheckerState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionCheckerStateInitialImpl);
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
      _$ConnectionCheckerStateInitialImpl;
}

/// @nodoc
abstract class _$$ConnectionCheckerStateLoadingImplCopyWith<$Res> {
  factory _$$ConnectionCheckerStateLoadingImplCopyWith(
          _$ConnectionCheckerStateLoadingImpl value,
          $Res Function(_$ConnectionCheckerStateLoadingImpl) then) =
      __$$ConnectionCheckerStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectionCheckerStateLoadingImplCopyWithImpl<$Res>
    extends _$ConnectionCheckerStateCopyWithImpl<$Res,
        _$ConnectionCheckerStateLoadingImpl>
    implements _$$ConnectionCheckerStateLoadingImplCopyWith<$Res> {
  __$$ConnectionCheckerStateLoadingImplCopyWithImpl(
      _$ConnectionCheckerStateLoadingImpl _value,
      $Res Function(_$ConnectionCheckerStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConnectionCheckerStateLoadingImpl
    implements ConnectionCheckerStateLoading {
  const _$ConnectionCheckerStateLoadingImpl();

  @override
  String toString() {
    return 'ConnectionCheckerState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionCheckerStateLoadingImpl);
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
      _$ConnectionCheckerStateLoadingImpl;
}

/// @nodoc
abstract class _$$ConnectionCheckerStateReadyImplCopyWith<$Res> {
  factory _$$ConnectionCheckerStateReadyImplCopyWith(
          _$ConnectionCheckerStateReadyImpl value,
          $Res Function(_$ConnectionCheckerStateReadyImpl) then) =
      __$$ConnectionCheckerStateReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool connected});
}

/// @nodoc
class __$$ConnectionCheckerStateReadyImplCopyWithImpl<$Res>
    extends _$ConnectionCheckerStateCopyWithImpl<$Res,
        _$ConnectionCheckerStateReadyImpl>
    implements _$$ConnectionCheckerStateReadyImplCopyWith<$Res> {
  __$$ConnectionCheckerStateReadyImplCopyWithImpl(
      _$ConnectionCheckerStateReadyImpl _value,
      $Res Function(_$ConnectionCheckerStateReadyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connected = null,
  }) {
    return _then(_$ConnectionCheckerStateReadyImpl(
      connected: null == connected
          ? _value.connected
          : connected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ConnectionCheckerStateReadyImpl implements ConnectionCheckerStateReady {
  const _$ConnectionCheckerStateReadyImpl({required this.connected});

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
            other is _$ConnectionCheckerStateReadyImpl &&
            (identical(other.connected, connected) ||
                other.connected == connected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, connected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionCheckerStateReadyImplCopyWith<_$ConnectionCheckerStateReadyImpl>
      get copyWith => __$$ConnectionCheckerStateReadyImplCopyWithImpl<
          _$ConnectionCheckerStateReadyImpl>(this, _$identity);

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
      _$ConnectionCheckerStateReadyImpl;

  bool get connected;
  @JsonKey(ignore: true)
  _$$ConnectionCheckerStateReadyImplCopyWith<_$ConnectionCheckerStateReadyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectionCheckerStateErrorImplCopyWith<$Res> {
  factory _$$ConnectionCheckerStateErrorImplCopyWith(
          _$ConnectionCheckerStateErrorImpl value,
          $Res Function(_$ConnectionCheckerStateErrorImpl) then) =
      __$$ConnectionCheckerStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ConnectionCheckerStateErrorImplCopyWithImpl<$Res>
    extends _$ConnectionCheckerStateCopyWithImpl<$Res,
        _$ConnectionCheckerStateErrorImpl>
    implements _$$ConnectionCheckerStateErrorImplCopyWith<$Res> {
  __$$ConnectionCheckerStateErrorImplCopyWithImpl(
      _$ConnectionCheckerStateErrorImpl _value,
      $Res Function(_$ConnectionCheckerStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ConnectionCheckerStateErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConnectionCheckerStateErrorImpl implements ConnectionCheckerStateError {
  const _$ConnectionCheckerStateErrorImpl({required this.message});

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
            other is _$ConnectionCheckerStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionCheckerStateErrorImplCopyWith<_$ConnectionCheckerStateErrorImpl>
      get copyWith => __$$ConnectionCheckerStateErrorImplCopyWithImpl<
          _$ConnectionCheckerStateErrorImpl>(this, _$identity);

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
      _$ConnectionCheckerStateErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ConnectionCheckerStateErrorImplCopyWith<_$ConnectionCheckerStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
