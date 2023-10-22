// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seat _$SeatFromJson(Map<String, dynamic> json) => Seat(
      seatNumber: json['seatNumber'] as String,
      status: $enumDecodeNullable(_$SeatStatusEnumMap, json['status'],
              unknownValue: SeatStatus.unavailable) ??
          SeatStatus.unavailable,
    );

const _$SeatStatusEnumMap = {
  SeatStatus.available: 'available',
  SeatStatus.book: 'book',
  SeatStatus.unavailable: 'unavailable',
};
