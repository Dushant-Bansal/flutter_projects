// ignore_for_file: constant_identifier_names
enum SeatType { LOWER, MIDDLE, UPPER, SIDE_LOWER, SIDE_UPPER }

enum BorderType { top, bottom }

extension SeatTypeName on SeatType {
  String type() => name.replaceAll(RegExp('_'), ' ');
}

extension EasyCheck on BorderType {
  bool isTop() => this == BorderType.top;
}

class SeatModel {
  SeatModel({required this.seatNo, this.booked = false})
      : assert(seatNo > 0, "Seat Number cannot start with zero.");

  final int seatNo;

  late final SeatType seatType =
      SeatType.values[seatNo % 8 == 0 || seatNo % 8 == 7
          ? seatNo % 8 == 0
              ? SeatType.SIDE_UPPER.index
              : SeatType.SIDE_LOWER.index
          : (seatNo % 8 - 1) % 3];

  late final BorderType type = BorderType
      .values[(seatNo % 8 >= 1 && seatNo % 8 <= 3) || seatNo % 8 == 7 ? 0 : 1];

  final bool booked;

  factory SeatModel.fromJson(Map<String, dynamic> json) => SeatModel(
        seatNo: json['seatNo'],
        booked: json['booked'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'seatNo': seatNo,
        'seatType': seatType.type(),
        'type': type.name,
        'booked': booked,
      };
}
