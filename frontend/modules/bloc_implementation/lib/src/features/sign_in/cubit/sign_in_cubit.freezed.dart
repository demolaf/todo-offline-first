// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ProcessingState processingState, String message)
        authenticating,
    required TResult Function() authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ProcessingState processingState, String message)?
        authenticating,
    TResult? Function()? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ProcessingState processingState, String message)?
        authenticating,
    TResult Function()? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(SignInStateAuthenticating value) authenticating,
    required TResult Function(SignInStateAuthenticated value) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SignInStateAuthenticating value)? authenticating,
    TResult? Function(SignInStateAuthenticated value)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SignInStateAuthenticating value)? authenticating,
    TResult Function(SignInStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res, SignInState>;
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res, $Val extends SignInState>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SignInState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ProcessingState processingState, String message)
        authenticating,
    required TResult Function() authenticated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ProcessingState processingState, String message)?
        authenticating,
    TResult? Function()? authenticated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ProcessingState processingState, String message)?
        authenticating,
    TResult Function()? authenticated,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(SignInStateAuthenticating value) authenticating,
    required TResult Function(SignInStateAuthenticated value) authenticated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SignInStateAuthenticating value)? authenticating,
    TResult? Function(SignInStateAuthenticated value)? authenticated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SignInStateAuthenticating value)? authenticating,
    TResult Function(SignInStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SignInState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SignInStateAuthenticatingImplCopyWith<$Res> {
  factory _$$SignInStateAuthenticatingImplCopyWith(
          _$SignInStateAuthenticatingImpl value,
          $Res Function(_$SignInStateAuthenticatingImpl) then) =
      __$$SignInStateAuthenticatingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProcessingState processingState, String message});
}

/// @nodoc
class __$$SignInStateAuthenticatingImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInStateAuthenticatingImpl>
    implements _$$SignInStateAuthenticatingImplCopyWith<$Res> {
  __$$SignInStateAuthenticatingImplCopyWithImpl(
      _$SignInStateAuthenticatingImpl _value,
      $Res Function(_$SignInStateAuthenticatingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processingState = null,
    Object? message = null,
  }) {
    return _then(_$SignInStateAuthenticatingImpl(
      processingState: null == processingState
          ? _value.processingState
          : processingState // ignore: cast_nullable_to_non_nullable
              as ProcessingState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInStateAuthenticatingImpl implements SignInStateAuthenticating {
  const _$SignInStateAuthenticatingImpl(
      {required this.processingState, required this.message});

  @override
  final ProcessingState processingState;
  @override
  final String message;

  @override
  String toString() {
    return 'SignInState.authenticating(processingState: $processingState, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStateAuthenticatingImpl &&
            (identical(other.processingState, processingState) ||
                other.processingState == processingState) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, processingState, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInStateAuthenticatingImplCopyWith<_$SignInStateAuthenticatingImpl>
      get copyWith => __$$SignInStateAuthenticatingImplCopyWithImpl<
          _$SignInStateAuthenticatingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ProcessingState processingState, String message)
        authenticating,
    required TResult Function() authenticated,
  }) {
    return authenticating(processingState, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ProcessingState processingState, String message)?
        authenticating,
    TResult? Function()? authenticated,
  }) {
    return authenticating?.call(processingState, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ProcessingState processingState, String message)?
        authenticating,
    TResult Function()? authenticated,
    required TResult orElse(),
  }) {
    if (authenticating != null) {
      return authenticating(processingState, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(SignInStateAuthenticating value) authenticating,
    required TResult Function(SignInStateAuthenticated value) authenticated,
  }) {
    return authenticating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SignInStateAuthenticating value)? authenticating,
    TResult? Function(SignInStateAuthenticated value)? authenticated,
  }) {
    return authenticating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SignInStateAuthenticating value)? authenticating,
    TResult Function(SignInStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticating != null) {
      return authenticating(this);
    }
    return orElse();
  }
}

abstract class SignInStateAuthenticating implements SignInState {
  const factory SignInStateAuthenticating(
      {required final ProcessingState processingState,
      required final String message}) = _$SignInStateAuthenticatingImpl;

  ProcessingState get processingState;
  String get message;
  @JsonKey(ignore: true)
  _$$SignInStateAuthenticatingImplCopyWith<_$SignInStateAuthenticatingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInStateAuthenticatedImplCopyWith<$Res> {
  factory _$$SignInStateAuthenticatedImplCopyWith(
          _$SignInStateAuthenticatedImpl value,
          $Res Function(_$SignInStateAuthenticatedImpl) then) =
      __$$SignInStateAuthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInStateAuthenticatedImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInStateAuthenticatedImpl>
    implements _$$SignInStateAuthenticatedImplCopyWith<$Res> {
  __$$SignInStateAuthenticatedImplCopyWithImpl(
      _$SignInStateAuthenticatedImpl _value,
      $Res Function(_$SignInStateAuthenticatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignInStateAuthenticatedImpl implements SignInStateAuthenticated {
  const _$SignInStateAuthenticatedImpl();

  @override
  String toString() {
    return 'SignInState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStateAuthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ProcessingState processingState, String message)
        authenticating,
    required TResult Function() authenticated,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ProcessingState processingState, String message)?
        authenticating,
    TResult? Function()? authenticated,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ProcessingState processingState, String message)?
        authenticating,
    TResult Function()? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(SignInStateAuthenticating value) authenticating,
    required TResult Function(SignInStateAuthenticated value) authenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SignInStateAuthenticating value)? authenticating,
    TResult? Function(SignInStateAuthenticated value)? authenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SignInStateAuthenticating value)? authenticating,
    TResult Function(SignInStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class SignInStateAuthenticated implements SignInState {
  const factory SignInStateAuthenticated() = _$SignInStateAuthenticatedImpl;
}
