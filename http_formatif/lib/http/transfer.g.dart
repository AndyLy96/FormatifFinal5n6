// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Truc _$TrucFromJson(Map<String, dynamic> json) => Truc()
  ..nombre = json['nombre'] as int
  ..description = json['description'] as String
  ..representation = json['representation'] as String;

Map<String, dynamic> _$TrucToJson(Truc instance) => <String, dynamic>{
      'nombre': instance.nombre,
      'description': instance.description,
      'representation': instance.representation,
    };
