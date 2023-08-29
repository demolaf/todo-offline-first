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
  Todo? get todo => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Todo? todo) $default, {
    required TResult Function(Todo? todo) loading,
    required TResult Function(ProcessingState processingState, Todo? todo)
        savingTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Todo? todo)? $default, {
    TResult? Function(Todo? todo)? loading,
    TResult? Function(ProcessingState processingState, Todo? todo)? savingTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Todo? todo)? $default, {
    TResult Function(Todo? todo)? loading,
    TResult Function(ProcessingState processingState, Todo? todo)? savingTodo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CreateTodoState value) $default, {
    required TResult Function(CreatingTodoLoading value) loading,
    required TResult Function(SavingTodo value) savingTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CreateTodoState value)? $default, {
    TResult? Function(CreatingTodoLoading value)? loading,
    TResult? Function(SavingTodo value)? savingTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CreateTodoState value)? $default, {
    TResult Function(CreatingTodoLoading value)? loading,
    TResult Function(SavingTodo value)? savingTodo,
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
  $Res call({Todo? todo});

  $TodoCopyWith<$Res>? get todo;
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
    Object? todo = freezed,
  }) {
    return _then(_value.copyWith(
      todo: freezed == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TodoCopyWith<$Res>? get todo {
    if (_value.todo == null) {
      return null;
    }

    return $TodoCopyWith<$Res>(_value.todo!, (value) {
      return _then(_value.copyWith(todo: value) as $Val);
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
  $Res call({Todo? todo});

  @override
  $TodoCopyWith<$Res>? get todo;
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
    Object? todo = freezed,
  }) {
    return _then(_$_CreateTodoState(
      todo: freezed == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo?,
    ));
  }
}

/// @nodoc

class _$_CreateTodoState implements _CreateTodoState {
  const _$_CreateTodoState({this.todo});

  @override
  final Todo? todo;

  @override
  String toString() {
    return 'CreateTodoState(todo: $todo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateTodoState &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateTodoStateCopyWith<_$_CreateTodoState> get copyWith =>
      __$$_CreateTodoStateCopyWithImpl<_$_CreateTodoState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Todo? todo) $default, {
    required TResult Function(Todo? todo) loading,
    required TResult Function(ProcessingState processingState, Todo? todo)
        savingTodo,
  }) {
    return $default(todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Todo? todo)? $default, {
    TResult? Function(Todo? todo)? loading,
    TResult? Function(ProcessingState processingState, Todo? todo)? savingTodo,
  }) {
    return $default?.call(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Todo? todo)? $default, {
    TResult Function(Todo? todo)? loading,
    TResult Function(ProcessingState processingState, Todo? todo)? savingTodo,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CreateTodoState value) $default, {
    required TResult Function(CreatingTodoLoading value) loading,
    required TResult Function(SavingTodo value) savingTodo,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CreateTodoState value)? $default, {
    TResult? Function(CreatingTodoLoading value)? loading,
    TResult? Function(SavingTodo value)? savingTodo,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CreateTodoState value)? $default, {
    TResult Function(CreatingTodoLoading value)? loading,
    TResult Function(SavingTodo value)? savingTodo,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _CreateTodoState implements CreateTodoState {
  const factory _CreateTodoState({final Todo? todo}) = _$_CreateTodoState;

  @override
  Todo? get todo;
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
  $Res call({Todo? todo});

  @override
  $TodoCopyWith<$Res>? get todo;
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
    Object? todo = freezed,
  }) {
    return _then(_$CreatingTodoLoading(
      todo: freezed == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo?,
    ));
  }
}

/// @nodoc

class _$CreatingTodoLoading implements CreatingTodoLoading {
  const _$CreatingTodoLoading({this.todo});

  @override
  final Todo? todo;

  @override
  String toString() {
    return 'CreateTodoState.loading(todo: $todo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatingTodoLoading &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatingTodoLoadingCopyWith<_$CreatingTodoLoading> get copyWith =>
      __$$CreatingTodoLoadingCopyWithImpl<_$CreatingTodoLoading>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Todo? todo) $default, {
    required TResult Function(Todo? todo) loading,
    required TResult Function(ProcessingState processingState, Todo? todo)
        savingTodo,
  }) {
    return loading(todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Todo? todo)? $default, {
    TResult? Function(Todo? todo)? loading,
    TResult? Function(ProcessingState processingState, Todo? todo)? savingTodo,
  }) {
    return loading?.call(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Todo? todo)? $default, {
    TResult Function(Todo? todo)? loading,
    TResult Function(ProcessingState processingState, Todo? todo)? savingTodo,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CreateTodoState value) $default, {
    required TResult Function(CreatingTodoLoading value) loading,
    required TResult Function(SavingTodo value) savingTodo,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CreateTodoState value)? $default, {
    TResult? Function(CreatingTodoLoading value)? loading,
    TResult? Function(SavingTodo value)? savingTodo,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CreateTodoState value)? $default, {
    TResult Function(CreatingTodoLoading value)? loading,
    TResult Function(SavingTodo value)? savingTodo,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CreatingTodoLoading implements CreateTodoState {
  const factory CreatingTodoLoading({final Todo? todo}) = _$CreatingTodoLoading;

  @override
  Todo? get todo;
  @override
  @JsonKey(ignore: true)
  _$$CreatingTodoLoadingCopyWith<_$CreatingTodoLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SavingTodoCopyWith<$Res>
    implements $CreateTodoStateCopyWith<$Res> {
  factory _$$SavingTodoCopyWith(
          _$SavingTodo value, $Res Function(_$SavingTodo) then) =
      __$$SavingTodoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProcessingState processingState, Todo? todo});

  @override
  $TodoCopyWith<$Res>? get todo;
}

/// @nodoc
class __$$SavingTodoCopyWithImpl<$Res>
    extends _$CreateTodoStateCopyWithImpl<$Res, _$SavingTodo>
    implements _$$SavingTodoCopyWith<$Res> {
  __$$SavingTodoCopyWithImpl(
      _$SavingTodo _value, $Res Function(_$SavingTodo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processingState = null,
    Object? todo = freezed,
  }) {
    return _then(_$SavingTodo(
      processingState: null == processingState
          ? _value.processingState
          : processingState // ignore: cast_nullable_to_non_nullable
              as ProcessingState,
      todo: freezed == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo?,
    ));
  }
}

/// @nodoc

class _$SavingTodo implements SavingTodo {
  const _$SavingTodo({required this.processingState, this.todo});

  @override
  final ProcessingState processingState;
  @override
  final Todo? todo;

  @override
  String toString() {
    return 'CreateTodoState.savingTodo(processingState: $processingState, todo: $todo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavingTodo &&
            (identical(other.processingState, processingState) ||
                other.processingState == processingState) &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, processingState, todo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavingTodoCopyWith<_$SavingTodo> get copyWith =>
      __$$SavingTodoCopyWithImpl<_$SavingTodo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Todo? todo) $default, {
    required TResult Function(Todo? todo) loading,
    required TResult Function(ProcessingState processingState, Todo? todo)
        savingTodo,
  }) {
    return savingTodo(processingState, todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Todo? todo)? $default, {
    TResult? Function(Todo? todo)? loading,
    TResult? Function(ProcessingState processingState, Todo? todo)? savingTodo,
  }) {
    return savingTodo?.call(processingState, todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Todo? todo)? $default, {
    TResult Function(Todo? todo)? loading,
    TResult Function(ProcessingState processingState, Todo? todo)? savingTodo,
    required TResult orElse(),
  }) {
    if (savingTodo != null) {
      return savingTodo(processingState, todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CreateTodoState value) $default, {
    required TResult Function(CreatingTodoLoading value) loading,
    required TResult Function(SavingTodo value) savingTodo,
  }) {
    return savingTodo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CreateTodoState value)? $default, {
    TResult? Function(CreatingTodoLoading value)? loading,
    TResult? Function(SavingTodo value)? savingTodo,
  }) {
    return savingTodo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CreateTodoState value)? $default, {
    TResult Function(CreatingTodoLoading value)? loading,
    TResult Function(SavingTodo value)? savingTodo,
    required TResult orElse(),
  }) {
    if (savingTodo != null) {
      return savingTodo(this);
    }
    return orElse();
  }
}

abstract class SavingTodo implements CreateTodoState {
  const factory SavingTodo(
      {required final ProcessingState processingState,
      final Todo? todo}) = _$SavingTodo;

  ProcessingState get processingState;
  @override
  Todo? get todo;
  @override
  @JsonKey(ignore: true)
  _$$SavingTodoCopyWith<_$SavingTodo> get copyWith =>
      throw _privateConstructorUsedError;
}
