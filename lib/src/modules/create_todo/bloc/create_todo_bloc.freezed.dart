// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_todo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateTodoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() ready,
    required TResult Function(ProcessingState processingState) creatingTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? ready,
    TResult? Function(ProcessingState processingState)? creatingTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? ready,
    TResult Function(ProcessingState processingState)? creatingTodo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Ready value) ready,
    required TResult Function(CreatingTodo value) creatingTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Ready value)? ready,
    TResult? Function(CreatingTodo value)? creatingTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Ready value)? ready,
    TResult Function(CreatingTodo value)? creatingTodo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTodoStateCopyWith<$Res> {
  factory $CreateTodoStateCopyWith(
          CreateTodoState value, $Res Function(CreateTodoState) then) =
      _$CreateTodoStateCopyWithImpl<$Res, CreateTodoState>;
}

/// @nodoc
class _$CreateTodoStateCopyWithImpl<$Res, $Val extends CreateTodoState>
    implements $CreateTodoStateCopyWith<$Res> {
  _$CreateTodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$CreateTodoStateCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'CreateTodoState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() ready,
    required TResult Function(ProcessingState processingState) creatingTodo,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? ready,
    TResult? Function(ProcessingState processingState)? creatingTodo,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? ready,
    TResult Function(ProcessingState processingState)? creatingTodo,
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
    required TResult Function(Loading value) loading,
    required TResult Function(Ready value) ready,
    required TResult Function(CreatingTodo value) creatingTodo,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Ready value)? ready,
    TResult? Function(CreatingTodo value)? creatingTodo,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Ready value)? ready,
    TResult Function(CreatingTodo value)? creatingTodo,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements CreateTodoState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$ReadyCopyWith<$Res> {
  factory _$$ReadyCopyWith(_$Ready value, $Res Function(_$Ready) then) =
      __$$ReadyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReadyCopyWithImpl<$Res>
    extends _$CreateTodoStateCopyWithImpl<$Res, _$Ready>
    implements _$$ReadyCopyWith<$Res> {
  __$$ReadyCopyWithImpl(_$Ready _value, $Res Function(_$Ready) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Ready implements Ready {
  const _$Ready();

  @override
  String toString() {
    return 'CreateTodoState.ready()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Ready);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() ready,
    required TResult Function(ProcessingState processingState) creatingTodo,
  }) {
    return ready();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? ready,
    TResult? Function(ProcessingState processingState)? creatingTodo,
  }) {
    return ready?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? ready,
    TResult Function(ProcessingState processingState)? creatingTodo,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Ready value) ready,
    required TResult Function(CreatingTodo value) creatingTodo,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Ready value)? ready,
    TResult? Function(CreatingTodo value)? creatingTodo,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Ready value)? ready,
    TResult Function(CreatingTodo value)? creatingTodo,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class Ready implements CreateTodoState {
  const factory Ready() = _$Ready;
}

/// @nodoc
abstract class _$$CreatingTodoCopyWith<$Res> {
  factory _$$CreatingTodoCopyWith(
          _$CreatingTodo value, $Res Function(_$CreatingTodo) then) =
      __$$CreatingTodoCopyWithImpl<$Res>;
  @useResult
  $Res call({ProcessingState processingState});
}

/// @nodoc
class __$$CreatingTodoCopyWithImpl<$Res>
    extends _$CreateTodoStateCopyWithImpl<$Res, _$CreatingTodo>
    implements _$$CreatingTodoCopyWith<$Res> {
  __$$CreatingTodoCopyWithImpl(
      _$CreatingTodo _value, $Res Function(_$CreatingTodo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processingState = null,
  }) {
    return _then(_$CreatingTodo(
      processingState: null == processingState
          ? _value.processingState
          : processingState // ignore: cast_nullable_to_non_nullable
              as ProcessingState,
    ));
  }
}

/// @nodoc

class _$CreatingTodo implements CreatingTodo {
  const _$CreatingTodo({required this.processingState});

  @override
  final ProcessingState processingState;

  @override
  String toString() {
    return 'CreateTodoState.creatingTodo(processingState: $processingState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatingTodo &&
            (identical(other.processingState, processingState) ||
                other.processingState == processingState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, processingState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatingTodoCopyWith<_$CreatingTodo> get copyWith =>
      __$$CreatingTodoCopyWithImpl<_$CreatingTodo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() ready,
    required TResult Function(ProcessingState processingState) creatingTodo,
  }) {
    return creatingTodo(processingState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? ready,
    TResult? Function(ProcessingState processingState)? creatingTodo,
  }) {
    return creatingTodo?.call(processingState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? ready,
    TResult Function(ProcessingState processingState)? creatingTodo,
    required TResult orElse(),
  }) {
    if (creatingTodo != null) {
      return creatingTodo(processingState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Ready value) ready,
    required TResult Function(CreatingTodo value) creatingTodo,
  }) {
    return creatingTodo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Ready value)? ready,
    TResult? Function(CreatingTodo value)? creatingTodo,
  }) {
    return creatingTodo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Ready value)? ready,
    TResult Function(CreatingTodo value)? creatingTodo,
    required TResult orElse(),
  }) {
    if (creatingTodo != null) {
      return creatingTodo(this);
    }
    return orElse();
  }
}

abstract class CreatingTodo implements CreateTodoState {
  const factory CreatingTodo({required final ProcessingState processingState}) =
      _$CreatingTodo;

  ProcessingState get processingState;
  @JsonKey(ignore: true)
  _$$CreatingTodoCopyWith<_$CreatingTodo> get copyWith =>
      throw _privateConstructorUsedError;
}
