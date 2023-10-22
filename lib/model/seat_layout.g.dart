// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat_layout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeatLayout _$SeatLayoutFromJson(Map<String, dynamic> json) => SeatLayout(
      rows: json['rows'] as int? ?? 0,
      columns: json['columns'] as int? ?? 0,
      seats: (json['seats'] as List<dynamic>?)
              ?.map((e) => Seat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
