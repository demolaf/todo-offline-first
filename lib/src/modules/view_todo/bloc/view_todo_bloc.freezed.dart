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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Todo todo) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Todo todo)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Todo todo)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewTodoStateLoading value) loading,
    required TResult Function(ViewTodoStateReady value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ViewTodoStateLoading value)? loading,
    TResult? Function(ViewTodoStateReady value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewTodoStateLoading value)? loading,
    TResult Function(ViewTodoStateReady value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewTodoStateCopyWith<$Res> {
  factory $ViewTodoStateCopyWith(
          ViewTodoState value, $Res Function(ViewTodoState) then) =
      _$ViewTodoStateCopyWithImpl<$Res, ViewTodoState>;
}

/// @nodoc
class _$ViewTodoStateCopyWithImpl<$Res, $Val extends ViewTodoState>
    implements $ViewTodoStateCopyWith<$Res> {
  _$ViewTodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ViewTodoStateLoadingCopyWith<$Res> {
  factory _$$ViewTodoStateLoadingCopyWith(_$ViewTodoStateLoading value,
          $Res Function(_$ViewTodoStateLoading) then) =
      __$$ViewTodoStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ViewTodoStateLoadingCopyWithImpl<$Res>
    extends _$ViewTodoStateCopyWithImpl<$Res, _$ViewTodoStateLoading>
    implements _$$ViewTodoStateLoadingCopyWith<$Res> {
  __$$ViewTodoStateLoadingCopyWithImpl(_$ViewTodoStateLoading _value,
      $Res Function(_$ViewTodoStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ViewTodoStateLoading implements ViewTodoStateLoading {
  const _$ViewTodoStateLoading();

  @override
  String toString() {
    return 'ViewTodoState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ViewTodoStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Todo todo) ready,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Todo todo)? ready,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Todo todo)? ready,
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
    required TResult Function(ViewTodoStateLoading value) loading,
    required TResult Function(ViewTodoStateReady value) ready,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ViewTodoStateLoading value)? loading,
    TResult? Function(ViewTodoStateReady value)? ready,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewTodoStateLoading value)? loading,
    TResult Function(ViewTodoStateReady value)? ready,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ViewTodoStateLoading implements ViewTodoState {
  const factory ViewTodoStateLoading() = _$ViewTodoStateLoading;
}

/// @nodoc
abstract class _$$ViewTodoStateReadyCopyWith<$Res> {
  factory _$$ViewTodoStateReadyCopyWith(_$ViewTodoStateReady value,
          $Res Function(_$ViewTodoStateReady) then) =
      __$$ViewTodoStateReadyCopyWithImpl<$Res>;
  @useResult
  $Res call({Todo todo});
}

/// @nodoc
class __$$ViewTodoStateReadyCopyWithImpl<$Res>
    extends _$ViewTodoStateCopyWithImpl<$Res, _$ViewTodoStateReady>
    implements _$$ViewTodoStateReadyCopyWith<$Res> {
  __$$ViewTodoStateReadyCopyWithImpl(
      _$ViewTodoStateReady _value, $Res Function(_$ViewTodoStateReady) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todo = null,
  }) {
    return _then(_$ViewTodoStateReady(
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo,
    ));
  }
}

/// @nodoc

class _$ViewTodoStateReady implements ViewTodoStateReady {
  const _$ViewTodoStateReady({required this.todo});

  @override
  final Todo todo;

  @override
  String toString() {
    return 'ViewTodoState.ready(todo: $todo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewTodoStateReady &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewTodoStateReadyCopyWith<_$ViewTodoStateReady> get copyWith =>
      __$$ViewTodoStateReadyCopyWithImpl<_$ViewTodoStateReady>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Todo todo) ready,
  }) {
    return ready(todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Todo todo)? ready,
  }) {
    return ready?.call(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Todo todo)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewTodoStateLoading value) loading,
    required TResult Function(ViewTodoStateReady value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ViewTodoStateLoading value)? loading,
    TResult? Function(ViewTodoStateReady value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewTodoStateLoading value)? loading,
    TResult Function(ViewTodoStateReady value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class ViewTodoStateReady implements ViewTodoState {
  const factory ViewTodoStateReady({required final Todo todo}) =
      _$ViewTodoStateReady;

  Todo get todo;
  @JsonKey(ignore: true)
  _$$ViewTodoStateReadyCopyWith<_$ViewTodoStateReady> get copyWith =>
      throw _privateConstructorUsedError;
}
