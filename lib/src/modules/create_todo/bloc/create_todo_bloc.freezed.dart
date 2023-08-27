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
  Todo? get newTodo => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Todo? newTodo) $default, {
    required TResult Function(Todo? newTodo) loading,
    required TResult Function(Todo? newTodo, ProcessingState processingState)
        creatingTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Todo? newTodo)? $default, {
    TResult? Function(Todo? newTodo)? loading,
    TResult? Function(Todo? newTodo, ProcessingState processingState)?
        creatingTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Todo? newTodo)? $default, {
    TResult Function(Todo? newTodo)? loading,
    TResult Function(Todo? newTodo, ProcessingState processingState)?
        creatingTodo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CreateTodoState value) $default, {
    required TResult Function(CreatingTodoLoading value) loading,
    required TResult Function(CreatingTodo value) creatingTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CreateTodoState value)? $default, {
    TResult? Function(CreatingTodoLoading value)? loading,
    TResult? Function(CreatingTodo value)? creatingTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CreateTodoState value)? $default, {
    TResult Function(CreatingTodoLoading value)? loading,
    TResult Function(CreatingTodo value)? creatingTodo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateTodoStateCopyWith<CreateTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTodoStateCopyWith<$Res> {
  factory $CreateTodoStateCopyWith(
          CreateTodoState value, $Res Function(CreateTodoState) then) =
      _$CreateTodoStateCopyWithImpl<$Res, CreateTodoState>;
  @useResult
  $Res call({Todo? newTodo});

  $TodoCopyWith<$Res>? get newTodo;
}

/// @nodoc
class _$CreateTodoStateCopyWithImpl<$Res, $Val extends CreateTodoState>
    implements $CreateTodoStateCopyWith<$Res> {
  _$CreateTodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newTodo = freezed,
  }) {
    return _then(_value.copyWith(
      newTodo: freezed == newTodo
          ? _value.newTodo
          : newTodo // ignore: cast_nullable_to_non_nullable
              as Todo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TodoCopyWith<$Res>? get newTodo {
    if (_value.newTodo == null) {
      return null;
    }

    return $TodoCopyWith<$Res>(_value.newTodo!, (value) {
      return _then(_value.copyWith(newTodo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreateTodoStateCopyWith<$Res>
    implements $CreateTodoStateCopyWith<$Res> {
  factory _$$_CreateTodoStateCopyWith(
          _$_CreateTodoState value, $Res Function(_$_CreateTodoState) then) =
      __$$_CreateTodoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Todo? newTodo});

  @override
  $TodoCopyWith<$Res>? get newTodo;
}

/// @nodoc
class __$$_CreateTodoStateCopyWithImpl<$Res>
    extends _$CreateTodoStateCopyWithImpl<$Res, _$_CreateTodoState>
    implements _$$_CreateTodoStateCopyWith<$Res> {
  __$$_CreateTodoStateCopyWithImpl(
      _$_CreateTodoState _value, $Res Function(_$_CreateTodoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newTodo = freezed,
  }) {
    return _then(_$_CreateTodoState(
      newTodo: freezed == newTodo
          ? _value.newTodo
          : newTodo // ignore: cast_nullable_to_non_nullable
              as Todo?,
    ));
  }
}

/// @nodoc

class _$_CreateTodoState implements _CreateTodoState {
  const _$_CreateTodoState({this.newTodo});

  @override
  final Todo? newTodo;

  @override
  String toString() {
    return 'CreateTodoState(newTodo: $newTodo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateTodoState &&
            (identical(other.newTodo, newTodo) || other.newTodo == newTodo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newTodo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateTodoStateCopyWith<_$_CreateTodoState> get copyWith =>
      __$$_CreateTodoStateCopyWithImpl<_$_CreateTodoState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Todo? newTodo) $default, {
    required TResult Function(Todo? newTodo) loading,
    required TResult Function(Todo? newTodo, ProcessingState processingState)
        creatingTodo,
  }) {
    return $default(newTodo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Todo? newTodo)? $default, {
    TResult? Function(Todo? newTodo)? loading,
    TResult? Function(Todo? newTodo, ProcessingState processingState)?
        creatingTodo,
  }) {
    return $default?.call(newTodo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Todo? newTodo)? $default, {
    TResult Function(Todo? newTodo)? loading,
    TResult Function(Todo? newTodo, ProcessingState processingState)?
        creatingTodo,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(newTodo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CreateTodoState value) $default, {
    required TResult Function(CreatingTodoLoading value) loading,
    required TResult Function(CreatingTodo value) creatingTodo,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CreateTodoState value)? $default, {
    TResult? Function(CreatingTodoLoading value)? loading,
    TResult? Function(CreatingTodo value)? creatingTodo,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CreateTodoState value)? $default, {
    TResult Function(CreatingTodoLoading value)? loading,
    TResult Function(CreatingTodo value)? creatingTodo,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _CreateTodoState implements CreateTodoState {
  const factory _CreateTodoState({final Todo? newTodo}) = _$_CreateTodoState;

  @override
  Todo? get newTodo;
  @override
  @JsonKey(ignore: true)
  _$$_CreateTodoStateCopyWith<_$_CreateTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreatingTodoLoadingCopyWith<$Res>
    implements $CreateTodoStateCopyWith<$Res> {
  factory _$$CreatingTodoLoadingCopyWith(_$CreatingTodoLoading value,
          $Res Function(_$CreatingTodoLoading) then) =
      __$$CreatingTodoLoadingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Todo? newTodo});

  @override
  $TodoCopyWith<$Res>? get newTodo;
}

/// @nodoc
class __$$CreatingTodoLoadingCopyWithImpl<$Res>
    extends _$CreateTodoStateCopyWithImpl<$Res, _$CreatingTodoLoading>
    implements _$$CreatingTodoLoadingCopyWith<$Res> {
  __$$CreatingTodoLoadingCopyWithImpl(
      _$CreatingTodoLoading _value, $Res Function(_$CreatingTodoLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newTodo = freezed,
  }) {
    return _then(_$CreatingTodoLoading(
      newTodo: freezed == newTodo
          ? _value.newTodo
          : newTodo // ignore: cast_nullable_to_non_nullable
              as Todo?,
    ));
  }
}

/// @nodoc

class _$CreatingTodoLoading implements CreatingTodoLoading {
  const _$CreatingTodoLoading({this.newTodo});

  @override
  final Todo? newTodo;

  @override
  String toString() {
    return 'CreateTodoState.loading(newTodo: $newTodo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatingTodoLoading &&
            (identical(other.newTodo, newTodo) || other.newTodo == newTodo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newTodo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatingTodoLoadingCopyWith<_$CreatingTodoLoading> get copyWith =>
      __$$CreatingTodoLoadingCopyWithImpl<_$CreatingTodoLoading>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Todo? newTodo) $default, {
    required TResult Function(Todo? newTodo) loading,
    required TResult Function(Todo? newTodo, ProcessingState processingState)
        creatingTodo,
  }) {
    return loading(newTodo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Todo? newTodo)? $default, {
    TResult? Function(Todo? newTodo)? loading,
    TResult? Function(Todo? newTodo, ProcessingState processingState)?
        creatingTodo,
  }) {
    return loading?.call(newTodo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Todo? newTodo)? $default, {
    TResult Function(Todo? newTodo)? loading,
    TResult Function(Todo? newTodo, ProcessingState processingState)?
        creatingTodo,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(newTodo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CreateTodoState value) $default, {
    required TResult Function(CreatingTodoLoading value) loading,
    required TResult Function(CreatingTodo value) creatingTodo,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CreateTodoState value)? $default, {
    TResult? Function(CreatingTodoLoading value)? loading,
    TResult? Function(CreatingTodo value)? creatingTodo,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CreateTodoState value)? $default, {
    TResult Function(CreatingTodoLoading value)? loading,
    TResult Function(CreatingTodo value)? creatingTodo,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CreatingTodoLoading implements CreateTodoState {
  const factory CreatingTodoLoading({final Todo? newTodo}) =
      _$CreatingTodoLoading;

  @override
  Todo? get newTodo;
  @override
  @JsonKey(ignore: true)
  _$$CreatingTodoLoadingCopyWith<_$CreatingTodoLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreatingTodoCopyWith<$Res>
    implements $CreateTodoStateCopyWith<$Res> {
  factory _$$CreatingTodoCopyWith(
          _$CreatingTodo value, $Res Function(_$CreatingTodo) then) =
      __$$CreatingTodoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Todo? newTodo, ProcessingState processingState});

  @override
  $TodoCopyWith<$Res>? get newTodo;
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
    Object? newTodo = freezed,
    Object? processingState = null,
  }) {
    return _then(_$CreatingTodo(
      newTodo: freezed == newTodo
          ? _value.newTodo
          : newTodo // ignore: cast_nullable_to_non_nullable
              as Todo?,
      processingState: null == processingState
          ? _value.processingState
          : processingState // ignore: cast_nullable_to_non_nullable
              as ProcessingState,
    ));
  }
}

/// @nodoc

class _$CreatingTodo implements CreatingTodo {
  const _$CreatingTodo({this.newTodo, required this.processingState});

  @override
  final Todo? newTodo;
  @override
  final ProcessingState processingState;

  @override
  String toString() {
    return 'CreateTodoState.creatingTodo(newTodo: $newTodo, processingState: $processingState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatingTodo &&
            (identical(other.newTodo, newTodo) || other.newTodo == newTodo) &&
            (identical(other.processingState, processingState) ||
                other.processingState == processingState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newTodo, processingState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatingTodoCopyWith<_$CreatingTodo> get copyWith =>
      __$$CreatingTodoCopyWithImpl<_$CreatingTodo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Todo? newTodo) $default, {
    required TResult Function(Todo? newTodo) loading,
    required TResult Function(Todo? newTodo, ProcessingState processingState)
        creatingTodo,
  }) {
    return creatingTodo(newTodo, processingState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Todo? newTodo)? $default, {
    TResult? Function(Todo? newTodo)? loading,
    TResult? Function(Todo? newTodo, ProcessingState processingState)?
        creatingTodo,
  }) {
    return creatingTodo?.call(newTodo, processingState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Todo? newTodo)? $default, {
    TResult Function(Todo? newTodo)? loading,
    TResult Function(Todo? newTodo, ProcessingState processingState)?
        creatingTodo,
    required TResult orElse(),
  }) {
    if (creatingTodo != null) {
      return creatingTodo(newTodo, processingState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CreateTodoState value) $default, {
    required TResult Function(CreatingTodoLoading value) loading,
    required TResult Function(CreatingTodo value) creatingTodo,
  }) {
    return creatingTodo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CreateTodoState value)? $default, {
    TResult? Function(CreatingTodoLoading value)? loading,
    TResult? Function(CreatingTodo value)? creatingTodo,
  }) {
    return creatingTodo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CreateTodoState value)? $default, {
    TResult Function(CreatingTodoLoading value)? loading,
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
  const factory CreatingTodo(
      {final Todo? newTodo,
      required final ProcessingState processingState}) = _$CreatingTodo;

  @override
  Todo? get newTodo;
  ProcessingState get processingState;
  @override
  @JsonKey(ignore: true)
  _$$CreatingTodoCopyWith<_$CreatingTodo> get copyWith =>
      throw _privateConstructorUsedError;
}
