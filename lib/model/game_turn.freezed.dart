// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'game_turn.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GameTurnTearOff {
  const _$GameTurnTearOff();

// ignore: unused_element
  _GameTurn call(List<int> turnValues, int cows, int bulls) {
    return _GameTurn(
      turnValues,
      cows,
      bulls,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GameTurn = _$GameTurnTearOff();

/// @nodoc
mixin _$GameTurn {
  List<int> get turnValues;
  int get cows;
  int get bulls;

  @JsonKey(ignore: true)
  $GameTurnCopyWith<GameTurn> get copyWith;
}

/// @nodoc
abstract class $GameTurnCopyWith<$Res> {
  factory $GameTurnCopyWith(GameTurn value, $Res Function(GameTurn) then) =
      _$GameTurnCopyWithImpl<$Res>;
  $Res call({List<int> turnValues, int cows, int bulls});
}

/// @nodoc
class _$GameTurnCopyWithImpl<$Res> implements $GameTurnCopyWith<$Res> {
  _$GameTurnCopyWithImpl(this._value, this._then);

  final GameTurn _value;
  // ignore: unused_field
  final $Res Function(GameTurn) _then;

  @override
  $Res call({
    Object turnValues = freezed,
    Object cows = freezed,
    Object bulls = freezed,
  }) {
    return _then(_value.copyWith(
      turnValues:
          turnValues == freezed ? _value.turnValues : turnValues as List<int>,
      cows: cows == freezed ? _value.cows : cows as int,
      bulls: bulls == freezed ? _value.bulls : bulls as int,
    ));
  }
}

/// @nodoc
abstract class _$GameTurnCopyWith<$Res> implements $GameTurnCopyWith<$Res> {
  factory _$GameTurnCopyWith(_GameTurn value, $Res Function(_GameTurn) then) =
      __$GameTurnCopyWithImpl<$Res>;
  @override
  $Res call({List<int> turnValues, int cows, int bulls});
}

/// @nodoc
class __$GameTurnCopyWithImpl<$Res> extends _$GameTurnCopyWithImpl<$Res>
    implements _$GameTurnCopyWith<$Res> {
  __$GameTurnCopyWithImpl(_GameTurn _value, $Res Function(_GameTurn) _then)
      : super(_value, (v) => _then(v as _GameTurn));

  @override
  _GameTurn get _value => super._value as _GameTurn;

  @override
  $Res call({
    Object turnValues = freezed,
    Object cows = freezed,
    Object bulls = freezed,
  }) {
    return _then(_GameTurn(
      turnValues == freezed ? _value.turnValues : turnValues as List<int>,
      cows == freezed ? _value.cows : cows as int,
      bulls == freezed ? _value.bulls : bulls as int,
    ));
  }
}

/// @nodoc
class _$_GameTurn implements _GameTurn {
  const _$_GameTurn(this.turnValues, this.cows, this.bulls)
      : assert(turnValues != null),
        assert(cows != null),
        assert(bulls != null);

  @override
  final List<int> turnValues;
  @override
  final int cows;
  @override
  final int bulls;

  @override
  String toString() {
    return 'GameTurn(turnValues: $turnValues, cows: $cows, bulls: $bulls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameTurn &&
            (identical(other.turnValues, turnValues) ||
                const DeepCollectionEquality()
                    .equals(other.turnValues, turnValues)) &&
            (identical(other.cows, cows) ||
                const DeepCollectionEquality().equals(other.cows, cows)) &&
            (identical(other.bulls, bulls) ||
                const DeepCollectionEquality().equals(other.bulls, bulls)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(turnValues) ^
      const DeepCollectionEquality().hash(cows) ^
      const DeepCollectionEquality().hash(bulls);

  @JsonKey(ignore: true)
  @override
  _$GameTurnCopyWith<_GameTurn> get copyWith =>
      __$GameTurnCopyWithImpl<_GameTurn>(this, _$identity);
}

abstract class _GameTurn implements GameTurn {
  const factory _GameTurn(List<int> turnValues, int cows, int bulls) =
      _$_GameTurn;

  @override
  List<int> get turnValues;
  @override
  int get cows;
  @override
  int get bulls;
  @override
  @JsonKey(ignore: true)
  _$GameTurnCopyWith<_GameTurn> get copyWith;
}
