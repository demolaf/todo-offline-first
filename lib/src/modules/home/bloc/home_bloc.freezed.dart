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
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'HomeState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
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
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$HomeStateLoadingCopyWith<$Res> {
  factory _$$HomeStateLoadingCopyWith(
          _$HomeStateLoading value, $Res Function(_$HomeStateLoading) then) =
      __$$HomeStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeStateLoadingCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateLoading>
    implements _$$HomeStateLoadingCopyWith<$Res> {
  __$$HomeStateLoadingCopyWithImpl(
      _$HomeStateLoading _value, $Res Function(_$HomeStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HomeStateLoading
    with DiagnosticableTreeMixin
    implements HomeStateLoading {
  const _$HomeStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'HomeState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeStateLoading);
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
  const factory HomeStateLoading() = _$HomeStateLoading;
}

/// @nodoc
abstract class _$$HomeStateReadyCopyWith<$Res> {
  factory _$$HomeStateReadyCopyWith(
          _$HomeStateReady value, $Res Function(_$HomeStateReady) then) =
      __$$HomeStateReadyCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Todo> today, List<Todo> upcoming, List<Todo> completed});
}

/// @nodoc
class __$$HomeStateReadyCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateReady>
    implements _$$HomeStateReadyCopyWith<$Res> {
  __$$HomeStateReadyCopyWithImpl(
      _$HomeStateReady _value, $Res Function(_$HomeStateReady) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? today = null,
    Object? upcoming = null,
    Object? completed = null,
  }) {
    return _then(_$HomeStateReady(
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

class _$HomeStateReady with DiagnosticableTreeMixin implements HomeStateReady {
  const _$HomeStateReady(
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState.ready(today: $today, upcoming: $upcoming, completed: $completed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState.ready'))
      ..add(DiagnosticsProperty('today', today))
      ..add(DiagnosticsProperty('upcoming', upcoming))
      ..add(DiagnosticsProperty('completed', completed));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateReady &&
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
  _$$HomeStateReadyCopyWith<_$HomeStateReady> get copyWith =>
      __$$HomeStateReadyCopyWithImpl<_$HomeStateReady>(this, _$identity);

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
      required final List<Todo> completed}) = _$HomeStateReady;

  List<Todo> get today;
  List<Todo> get upcoming;
  List<Todo> get completed;
  @JsonKey(ignore: true)
  _$$HomeStateReadyCopyWith<_$HomeStateReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ViewingQueuesCopyWith<$Res> {
  factory _$$ViewingQueuesCopyWith(
          _$ViewingQueues value, $Res Function(_$ViewingQueues) then) =
      __$$ViewingQueuesCopyWithImpl<$Res>;
  @useResult
  $Res call({List<QueueObject> queues});
}

/// @nodoc
class __$$ViewingQueuesCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$ViewingQueues>
    implements _$$ViewingQueuesCopyWith<$Res> {
  __$$ViewingQueuesCopyWithImpl(
      _$ViewingQueues _value, $Res Function(_$ViewingQueues) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queues = null,
  }) {
    return _then(_$ViewingQueues(
      queues: null == queues
          ? _value._queues
          : queues // ignore: cast_nullable_to_non_nullable
              as List<QueueObject>,
    ));
  }
}

/// @nodoc

class _$ViewingQueues with DiagnosticableTreeMixin implements ViewingQueues {
  const _$ViewingQueues({required final List<QueueObject> queues})
      : _queues = queues;

  final List<QueueObject> _queues;
  @override
  List<QueueObject> get queues {
    if (_queues is EqualUnmodifiableListView) return _queues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queues);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState.viewingQueues(queues: $queues)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState.viewingQueues'))
      ..add(DiagnosticsProperty('queues', queues));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewingQueues &&
            const DeepCollectionEquality().equals(other._queues, _queues));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_queues));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewingQueuesCopyWith<_$ViewingQueues> get copyWith =>
      __$$ViewingQueuesCopyWithImpl<_$ViewingQueues>(this, _$identity);

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
      _$ViewingQueues;

  List<QueueObject> get queues;
  @JsonKey(ignore: true)
  _$$ViewingQueuesCopyWith<_$ViewingQueues> get copyWith =>
      throw _privateConstructorUsedError;
}
