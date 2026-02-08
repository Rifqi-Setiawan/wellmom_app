// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'riwayat_kesehatan_ibu_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RiwayatKesehatanIbuModel {

@JsonKey(name: 'darah_tinggi') bool get darahTinggi; bool get diabetes; bool get anemia;@JsonKey(name: 'penyakit_jantung') bool get penyakitJantung; bool get asma;@JsonKey(name: 'penyakit_ginjal') bool get penyakitGinjal;@JsonKey(name: 'tbc_malaria') bool get tbcMalaria;
/// Create a copy of RiwayatKesehatanIbuModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RiwayatKesehatanIbuModelCopyWith<RiwayatKesehatanIbuModel> get copyWith => _$RiwayatKesehatanIbuModelCopyWithImpl<RiwayatKesehatanIbuModel>(this as RiwayatKesehatanIbuModel, _$identity);

  /// Serializes this RiwayatKesehatanIbuModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RiwayatKesehatanIbuModel&&(identical(other.darahTinggi, darahTinggi) || other.darahTinggi == darahTinggi)&&(identical(other.diabetes, diabetes) || other.diabetes == diabetes)&&(identical(other.anemia, anemia) || other.anemia == anemia)&&(identical(other.penyakitJantung, penyakitJantung) || other.penyakitJantung == penyakitJantung)&&(identical(other.asma, asma) || other.asma == asma)&&(identical(other.penyakitGinjal, penyakitGinjal) || other.penyakitGinjal == penyakitGinjal)&&(identical(other.tbcMalaria, tbcMalaria) || other.tbcMalaria == tbcMalaria));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,darahTinggi,diabetes,anemia,penyakitJantung,asma,penyakitGinjal,tbcMalaria);

@override
String toString() {
  return 'RiwayatKesehatanIbuModel(darahTinggi: $darahTinggi, diabetes: $diabetes, anemia: $anemia, penyakitJantung: $penyakitJantung, asma: $asma, penyakitGinjal: $penyakitGinjal, tbcMalaria: $tbcMalaria)';
}


}

/// @nodoc
abstract mixin class $RiwayatKesehatanIbuModelCopyWith<$Res>  {
  factory $RiwayatKesehatanIbuModelCopyWith(RiwayatKesehatanIbuModel value, $Res Function(RiwayatKesehatanIbuModel) _then) = _$RiwayatKesehatanIbuModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'darah_tinggi') bool darahTinggi, bool diabetes, bool anemia,@JsonKey(name: 'penyakit_jantung') bool penyakitJantung, bool asma,@JsonKey(name: 'penyakit_ginjal') bool penyakitGinjal,@JsonKey(name: 'tbc_malaria') bool tbcMalaria
});




}
/// @nodoc
class _$RiwayatKesehatanIbuModelCopyWithImpl<$Res>
    implements $RiwayatKesehatanIbuModelCopyWith<$Res> {
  _$RiwayatKesehatanIbuModelCopyWithImpl(this._self, this._then);

  final RiwayatKesehatanIbuModel _self;
  final $Res Function(RiwayatKesehatanIbuModel) _then;

/// Create a copy of RiwayatKesehatanIbuModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? darahTinggi = null,Object? diabetes = null,Object? anemia = null,Object? penyakitJantung = null,Object? asma = null,Object? penyakitGinjal = null,Object? tbcMalaria = null,}) {
  return _then(_self.copyWith(
darahTinggi: null == darahTinggi ? _self.darahTinggi : darahTinggi // ignore: cast_nullable_to_non_nullable
as bool,diabetes: null == diabetes ? _self.diabetes : diabetes // ignore: cast_nullable_to_non_nullable
as bool,anemia: null == anemia ? _self.anemia : anemia // ignore: cast_nullable_to_non_nullable
as bool,penyakitJantung: null == penyakitJantung ? _self.penyakitJantung : penyakitJantung // ignore: cast_nullable_to_non_nullable
as bool,asma: null == asma ? _self.asma : asma // ignore: cast_nullable_to_non_nullable
as bool,penyakitGinjal: null == penyakitGinjal ? _self.penyakitGinjal : penyakitGinjal // ignore: cast_nullable_to_non_nullable
as bool,tbcMalaria: null == tbcMalaria ? _self.tbcMalaria : tbcMalaria // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RiwayatKesehatanIbuModel].
extension RiwayatKesehatanIbuModelPatterns on RiwayatKesehatanIbuModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RiwayatKesehatanIbuModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RiwayatKesehatanIbuModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RiwayatKesehatanIbuModel value)  $default,){
final _that = this;
switch (_that) {
case _RiwayatKesehatanIbuModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RiwayatKesehatanIbuModel value)?  $default,){
final _that = this;
switch (_that) {
case _RiwayatKesehatanIbuModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'darah_tinggi')  bool darahTinggi,  bool diabetes,  bool anemia, @JsonKey(name: 'penyakit_jantung')  bool penyakitJantung,  bool asma, @JsonKey(name: 'penyakit_ginjal')  bool penyakitGinjal, @JsonKey(name: 'tbc_malaria')  bool tbcMalaria)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RiwayatKesehatanIbuModel() when $default != null:
return $default(_that.darahTinggi,_that.diabetes,_that.anemia,_that.penyakitJantung,_that.asma,_that.penyakitGinjal,_that.tbcMalaria);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'darah_tinggi')  bool darahTinggi,  bool diabetes,  bool anemia, @JsonKey(name: 'penyakit_jantung')  bool penyakitJantung,  bool asma, @JsonKey(name: 'penyakit_ginjal')  bool penyakitGinjal, @JsonKey(name: 'tbc_malaria')  bool tbcMalaria)  $default,) {final _that = this;
switch (_that) {
case _RiwayatKesehatanIbuModel():
return $default(_that.darahTinggi,_that.diabetes,_that.anemia,_that.penyakitJantung,_that.asma,_that.penyakitGinjal,_that.tbcMalaria);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'darah_tinggi')  bool darahTinggi,  bool diabetes,  bool anemia, @JsonKey(name: 'penyakit_jantung')  bool penyakitJantung,  bool asma, @JsonKey(name: 'penyakit_ginjal')  bool penyakitGinjal, @JsonKey(name: 'tbc_malaria')  bool tbcMalaria)?  $default,) {final _that = this;
switch (_that) {
case _RiwayatKesehatanIbuModel() when $default != null:
return $default(_that.darahTinggi,_that.diabetes,_that.anemia,_that.penyakitJantung,_that.asma,_that.penyakitGinjal,_that.tbcMalaria);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RiwayatKesehatanIbuModel implements RiwayatKesehatanIbuModel {
  const _RiwayatKesehatanIbuModel({@JsonKey(name: 'darah_tinggi') this.darahTinggi = false, this.diabetes = false, this.anemia = false, @JsonKey(name: 'penyakit_jantung') this.penyakitJantung = false, this.asma = false, @JsonKey(name: 'penyakit_ginjal') this.penyakitGinjal = false, @JsonKey(name: 'tbc_malaria') this.tbcMalaria = false});
  factory _RiwayatKesehatanIbuModel.fromJson(Map<String, dynamic> json) => _$RiwayatKesehatanIbuModelFromJson(json);

@override@JsonKey(name: 'darah_tinggi') final  bool darahTinggi;
@override@JsonKey() final  bool diabetes;
@override@JsonKey() final  bool anemia;
@override@JsonKey(name: 'penyakit_jantung') final  bool penyakitJantung;
@override@JsonKey() final  bool asma;
@override@JsonKey(name: 'penyakit_ginjal') final  bool penyakitGinjal;
@override@JsonKey(name: 'tbc_malaria') final  bool tbcMalaria;

/// Create a copy of RiwayatKesehatanIbuModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RiwayatKesehatanIbuModelCopyWith<_RiwayatKesehatanIbuModel> get copyWith => __$RiwayatKesehatanIbuModelCopyWithImpl<_RiwayatKesehatanIbuModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RiwayatKesehatanIbuModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RiwayatKesehatanIbuModel&&(identical(other.darahTinggi, darahTinggi) || other.darahTinggi == darahTinggi)&&(identical(other.diabetes, diabetes) || other.diabetes == diabetes)&&(identical(other.anemia, anemia) || other.anemia == anemia)&&(identical(other.penyakitJantung, penyakitJantung) || other.penyakitJantung == penyakitJantung)&&(identical(other.asma, asma) || other.asma == asma)&&(identical(other.penyakitGinjal, penyakitGinjal) || other.penyakitGinjal == penyakitGinjal)&&(identical(other.tbcMalaria, tbcMalaria) || other.tbcMalaria == tbcMalaria));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,darahTinggi,diabetes,anemia,penyakitJantung,asma,penyakitGinjal,tbcMalaria);

@override
String toString() {
  return 'RiwayatKesehatanIbuModel(darahTinggi: $darahTinggi, diabetes: $diabetes, anemia: $anemia, penyakitJantung: $penyakitJantung, asma: $asma, penyakitGinjal: $penyakitGinjal, tbcMalaria: $tbcMalaria)';
}


}

/// @nodoc
abstract mixin class _$RiwayatKesehatanIbuModelCopyWith<$Res> implements $RiwayatKesehatanIbuModelCopyWith<$Res> {
  factory _$RiwayatKesehatanIbuModelCopyWith(_RiwayatKesehatanIbuModel value, $Res Function(_RiwayatKesehatanIbuModel) _then) = __$RiwayatKesehatanIbuModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'darah_tinggi') bool darahTinggi, bool diabetes, bool anemia,@JsonKey(name: 'penyakit_jantung') bool penyakitJantung, bool asma,@JsonKey(name: 'penyakit_ginjal') bool penyakitGinjal,@JsonKey(name: 'tbc_malaria') bool tbcMalaria
});




}
/// @nodoc
class __$RiwayatKesehatanIbuModelCopyWithImpl<$Res>
    implements _$RiwayatKesehatanIbuModelCopyWith<$Res> {
  __$RiwayatKesehatanIbuModelCopyWithImpl(this._self, this._then);

  final _RiwayatKesehatanIbuModel _self;
  final $Res Function(_RiwayatKesehatanIbuModel) _then;

/// Create a copy of RiwayatKesehatanIbuModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? darahTinggi = null,Object? diabetes = null,Object? anemia = null,Object? penyakitJantung = null,Object? asma = null,Object? penyakitGinjal = null,Object? tbcMalaria = null,}) {
  return _then(_RiwayatKesehatanIbuModel(
darahTinggi: null == darahTinggi ? _self.darahTinggi : darahTinggi // ignore: cast_nullable_to_non_nullable
as bool,diabetes: null == diabetes ? _self.diabetes : diabetes // ignore: cast_nullable_to_non_nullable
as bool,anemia: null == anemia ? _self.anemia : anemia // ignore: cast_nullable_to_non_nullable
as bool,penyakitJantung: null == penyakitJantung ? _self.penyakitJantung : penyakitJantung // ignore: cast_nullable_to_non_nullable
as bool,asma: null == asma ? _self.asma : asma // ignore: cast_nullable_to_non_nullable
as bool,penyakitGinjal: null == penyakitGinjal ? _self.penyakitGinjal : penyakitGinjal // ignore: cast_nullable_to_non_nullable
as bool,tbcMalaria: null == tbcMalaria ? _self.tbcMalaria : tbcMalaria // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
