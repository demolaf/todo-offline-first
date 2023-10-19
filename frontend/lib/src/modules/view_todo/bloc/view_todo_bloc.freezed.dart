// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_todo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewTodoState {
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
    TResult Function(_ViewTodoState value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(SavingTodo value) savingTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ViewTodoState value)? $default, {
    TResult? Function(Loading value)? loading,
    TResult? Function(SavingTodo value)? savingTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ViewTodoState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(SavingTodo value)? savingTodo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewTodoStateCopyWith<ViewTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewTodoStateCopyWith<$Res> {
  factory $ViewTodoStateCopyWith(
          ViewTodoState value, $Res Function(ViewTodoState) then) =
      _$ViewTodoStateCopyWithImpl<$Res, ViewTodoState>;
  @useResult
  $Res call({Todo? todo});

  $TodoCopyWith<$Res>? get todo;
}

/// @nodoc
class _$ViewTodoStateCopyWithImpl<$Res, $Val extends ViewTodoState>
    implements $ViewTodoStateCopyWith<$Res> {
  _$ViewTodoStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_ViewTodoStateCopyWith<$Res>
    implements $ViewTodoStateCopyWith<$Res> {
  factory _$$_ViewTodoStateCopyWith(
          _$_ViewTodoState value, $Res Function(_$_ViewTodoState) then) =
      __$$_ViewTodoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Todo? todo});

  @override
  $TodoCopyWith<$Res>? get todo;
}

/// @nodoc
class __$$_ViewTodoStateCopyWithImpl<$Res>
    extends _$ViewTodoStateCopyWithImpl<$Res, _$_ViewTodoState>
    implements _$$_ViewTodoStateCopyWith<$Res> {
  __$$_ViewTodoStateCopyWithImpl(
      _$_ViewTodoState _value, $Res Function(_$_ViewTodoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todo = freezed,
  }) {
    return _then(_$_ViewTodoState(
      todo: freezed == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo?,
    ));
  }
}

/// @nodoc

class _$_ViewTodoState implements _ViewTodoState {
  const _$_ViewTodoState({this.todo});

  @override
  final Todo? todo;

  @override
  String toString() {
    return 'ViewTodoState(todo: $todo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewTodoState &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewTodoStateCopyWith<_$_ViewTodoState> get copyWith =>
      __$$_ViewTodoStateCopyWithImpl<_$_ViewTodoState>(this, _$identity);

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
    TResult Function(_ViewTodoState value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(SavingTodo value) savingTodo,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ViewTodoState value)? $default, {
    TResult? Function(Loading value)? loading,
    TResult? Function(SavingTodo value)? savingTodo,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ViewTodoState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(SavingTodo value)? savingTodo,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _ViewTodoState implements ViewTodoState {
  const factory _ViewTodoState({final Todo? todo}) = _$_ViewTodoState;

  @override
  Todo? get todo;
  @override
  @JsonKey(ignore: true)
  _$$_ViewTodoStateCopyWith<_$_ViewTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res>
    implements $ViewTodoStateCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Todo? todo});

  @override
  $TodoCopyWith<$Res>? get todo;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$ViewTodoStateCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todo = freezed,
  }) {
    return _then(_$Loading(
      todo: freezed == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo?,
    ));
  }
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading({this.todo});

  @override
  final Todo? todo;

  @override
  String toString() {
    return 'ViewTodoState.loading(todo: $todo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loading &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingCopyWith<_$Loading> get copyWith =>
      __$$LoadingCopyWithImpl<_$Loading>(this, _$identity);

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
    TResult Function(_ViewTodoState value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(SavingTodo value) savingTodo,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ViewTodoState value)? $default, {
    TResult? Function(Loading value)? loading,
    TResult? Function(SavingTodo value)? savingTodo,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ViewTodoState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(SavingTodo value)? savingTodo,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ViewTodoState {
  const factory Loading({final Todo? todo}) = _$Loading;

  @override
  Todo? get todo;
  @override
  @JsonKey(ignore: true)
  _$$LoadingCopyWith<_$Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SavingTodoCopyWith<$Res>
    implements $ViewTodoStateCopyWith<$Res> {
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
    extends _$ViewTodoStateCopyWithImpl<$Res, _$SavingTodo>
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
    return 'ViewTodoState.savingTodo(processingState: $processingState, todo: $todo)';
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
    TResult Function(_ViewTodoState value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(SavingTodo value) savingTodo,
  }) {
    return savingTodo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ViewTodoState value)? $default, {
    TResult? Function(Loading value)? loading,
    TResult? Function(SavingTodo value)? savingTodo,
  }) {
    return savingTodo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ViewTodoState value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(SavingTodo value)? savingTodo,
    required TResult orElse(),
  }) {
    if (savingTodo != null) {
      return savingTodo(this);
    }
    return orElse();
  }
}

abstract class SavingTodo implements ViewTodoState {
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
