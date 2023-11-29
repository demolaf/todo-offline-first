// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Todo> today, List<Todo> upcoming, List<Todo> completed)
        ready,
    required TResult Function(List<QueueObject> queues) viewingQueues,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<Todo> today, List<Todo> upcoming, List<Todo> completed)?
        ready,
    TResult? Function(List<QueueObject> queues)? viewingQueues,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<Todo> today, List<Todo> upcoming, List<Todo> completed)?
        ready,
    TResult Function(List<QueueObject> queues)? viewingQueues,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateReady value) ready,
    required TResult Function(ViewingQueues value) viewingQueues,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateReady value)? ready,
    TResult? Function(ViewingQueues value)? viewingQueues,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateReady value)? ready,
    TResult Function(ViewingQueues value)? viewingQueues,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

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
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'HomeState.initial()';
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
    required TResult Function() loading,
    required TResult Function(
            List<Todo> today, List<Todo> upcoming, List<Todo> completed)
        ready,
    required TResult Function(List<QueueObject> queues) viewingQueues,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<Todo> today, List<Todo> upcoming, List<Todo> completed)?
        ready,
    TResult? Function(List<QueueObject> queues)? viewingQueues,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<Todo> today, List<Todo> upcoming, List<Todo> completed)?
        ready,
    TResult Function(List<QueueObject> queues)? viewingQueues,
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
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateReady value) ready,
    required TResult Function(ViewingQueues value) viewingQueues,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateReady value)? ready,
    TResult? Function(ViewingQueues value)? viewingQueues,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateReady value)? ready,
    TResult Function(ViewingQueues value)? viewingQueues,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$HomeStateLoadingImplCopyWith<$Res> {
  factory _$$HomeStateLoadingImplCopyWith(_$HomeStateLoadingImpl value,
          $Res Function(_$HomeStateLoadingImpl) then) =
      __$$HomeStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeStateLoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateLoadingImpl>
    implements _$$HomeStateLoadingImplCopyWith<$Res> {
  __$$HomeStateLoadingImplCopyWithImpl(_$HomeStateLoadingImpl _value,
      $Res Function(_$HomeStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HomeStateLoadingImpl implements HomeStateLoading {
  const _$HomeStateLoadingImpl();

  @override
  String toString() {
    return 'HomeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Todo> today, List<Todo> upcoming, List<Todo> completed)
        ready,
    required TResult Function(List<QueueObject> queues) viewingQueues,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<Todo> today, List<Todo> upcoming, List<Todo> completed)?
        ready,
    TResult? Function(List<QueueObject> queues)? viewingQueues,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<Todo> today, List<Todo> upcoming, List<Todo> completed)?
        ready,
    TResult Function(List<QueueObject> queues)? viewingQueues,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateReady value) ready,
    required TResult Function(ViewingQueues value) viewingQueues,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateReady value)? ready,
    TResult? Function(ViewingQueues value)? viewingQueues,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateReady value)? ready,
    TResult Function(ViewingQueues value)? viewingQueues,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomeStateLoading implements HomeState {
  const factory HomeStateLoading() = _$HomeStateLoadingImpl;
}

/// @nodoc
abstract class _$$HomeStateReadyImplCopyWith<$Res> {
  factory _$$HomeStateReadyImplCopyWith(_$HomeStateReadyImpl value,
          $Res Function(_$HomeStateReadyImpl) then) =
      __$$HomeStateReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Todo> today, List<Todo> upcoming, List<Todo> completed});
}

/// @nodoc
class __$$HomeStateReadyImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateReadyImpl>
    implements _$$HomeStateReadyImplCopyWith<$Res> {
  __$$HomeStateReadyImplCopyWithImpl(
      _$HomeStateReadyImpl _value, $Res Function(_$HomeStateReadyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? today = null,
    Object? upcoming = null,
    Object? completed = null,
  }) {
    return _then(_$HomeStateReadyImpl(
      today: null == today
          ? _value._today
          : today // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      upcoming: null == upcoming
          ? _value._upcoming
          : upcoming // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      completed: null == completed
          ? _value._completed
          : completed // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc

class _$HomeStateReadyImpl implements HomeStateReady {
  const _$HomeStateReadyImpl(
      {required final List<Todo> today,
      required final List<Todo> upcoming,
      required final List<Todo> completed})
      : _today = today,
        _upcoming = upcoming,
        _completed = completed;

  final List<Todo> _today;
  @override
  List<Todo> get today {
    if (_today is EqualUnmodifiableListView) return _today;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_today);
  }

  final List<Todo> _upcoming;
  @override
  List<Todo> get upcoming {
    if (_upcoming is EqualUnmodifiableListView) return _upcoming;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upcoming);
  }

  final List<Todo> _completed;
  @override
  List<Todo> get completed {
    if (_completed is EqualUnmodifiableListView) return _completed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completed);
  }

  @override
  String toString() {
    return 'HomeState.ready(today: $today, upcoming: $upcoming, completed: $completed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateReadyImpl &&
            const DeepCollectionEquality().equals(other._today, _today) &&
            const DeepCollectionEquality().equals(other._upcoming, _upcoming) &&
            const DeepCollectionEquality()
                .equals(other._completed, _completed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_today),
      const DeepCollectionEquality().hash(_upcoming),
      const DeepCollectionEquality().hash(_completed));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateReadyImplCopyWith<_$HomeStateReadyImpl> get copyWith =>
      __$$HomeStateReadyImplCopyWithImpl<_$HomeStateReadyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Todo> today, List<Todo> upcoming, List<Todo> completed)
        ready,
    required TResult Function(List<QueueObject> queues) viewingQueues,
  }) {
    return ready(today, upcoming, completed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<Todo> today, List<Todo> upcoming, List<Todo> completed)?
        ready,
    TResult? Function(List<QueueObject> queues)? viewingQueues,
  }) {
    return ready?.call(today, upcoming, completed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<Todo> today, List<Todo> upcoming, List<Todo> completed)?
        ready,
    TResult Function(List<QueueObject> queues)? viewingQueues,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(today, upcoming, completed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateReady value) ready,
    required TResult Function(ViewingQueues value) viewingQueues,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateReady value)? ready,
    TResult? Function(ViewingQueues value)? viewingQueues,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateReady value)? ready,
    TResult Function(ViewingQueues value)? viewingQueues,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class HomeStateReady implements HomeState {
  const factory HomeStateReady(
      {required final List<Todo> today,
      required final List<Todo> upcoming,
      required final List<Todo> completed}) = _$HomeStateReadyImpl;

  List<Todo> get today;
  List<Todo> get upcoming;
  List<Todo> get completed;
  @JsonKey(ignore: true)
  _$$HomeStateReadyImplCopyWith<_$HomeStateReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ViewingQueuesImplCopyWith<$Res> {
  factory _$$ViewingQueuesImplCopyWith(
          _$ViewingQueuesImpl value, $Res Function(_$ViewingQueuesImpl) then) =
      __$$ViewingQueuesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<QueueObject> queues});
}

/// @nodoc
class __$$ViewingQueuesImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$ViewingQueuesImpl>
    implements _$$ViewingQueuesImplCopyWith<$Res> {
  __$$ViewingQueuesImplCopyWithImpl(
      _$ViewingQueuesImpl _value, $Res Function(_$ViewingQueuesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queues = null,
  }) {
    return _then(_$ViewingQueuesImpl(
      queues: null == queues
          ? _value._queues
          : queues // ignore: cast_nullable_to_non_nullable
              as List<QueueObject>,
    ));
  }
}

/// @nodoc

class _$ViewingQueuesImpl implements ViewingQueues {
  const _$ViewingQueuesImpl({required final List<QueueObject> queues})
      : _queues = queues;

  final List<QueueObject> _queues;
  @override
  List<QueueObject> get queues {
    if (_queues is EqualUnmodifiableListView) return _queues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queues);
  }

  @override
  String toString() {
    return 'HomeState.viewingQueues(queues: $queues)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewingQueuesImpl &&
            const DeepCollectionEquality().equals(other._queues, _queues));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_queues));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewingQueuesImplCopyWith<_$ViewingQueuesImpl> get copyWith =>
      __$$ViewingQueuesImplCopyWithImpl<_$ViewingQueuesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Todo> today, List<Todo> upcoming, List<Todo> completed)
        ready,
    required TResult Function(List<QueueObject> queues) viewingQueues,
  }) {
    return viewingQueues(queues);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<Todo> today, List<Todo> upcoming, List<Todo> completed)?
        ready,
    TResult? Function(List<QueueObject> queues)? viewingQueues,
  }) {
    return viewingQueues?.call(queues);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<Todo> today, List<Todo> upcoming, List<Todo> completed)?
        ready,
    TResult Function(List<QueueObject> queues)? viewingQueues,
    required TResult orElse(),
  }) {
    if (viewingQueues != null) {
      return viewingQueues(queues);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(HomeStateLoading value) loading,
    required TResult Function(HomeStateReady value) ready,
    required TResult Function(ViewingQueues value) viewingQueues,
  }) {
    return viewingQueues(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(HomeStateLoading value)? loading,
    TResult? Function(HomeStateReady value)? ready,
    TResult? Function(ViewingQueues value)? viewingQueues,
  }) {
    return viewingQueues?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(HomeStateLoading value)? loading,
    TResult Function(HomeStateReady value)? ready,
    TResult Function(ViewingQueues value)? viewingQueues,
    required TResult orElse(),
  }) {
    if (viewingQueues != null) {
      return viewingQueues(this);
    }
    return orElse();
  }
}

abstract class ViewingQueues implements HomeState {
  const factory ViewingQueues({required final List<QueueObject> queues}) =
      _$ViewingQueuesImpl;

  List<QueueObject> get queues;
  @JsonKey(ignore: true)
  _$$ViewingQueuesImplCopyWith<_$ViewingQueuesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
