import 'package:flutter/material.dart';
import '../model/seat_model.dart';
import 'seat.dart';

class SeatSet extends StatelessWidget {
  const SeatSet({super.key, required this.rQuarter});

  final int rQuarter;

  @override
  Widget build(BuildContext context) {
    int quarter = rQuarter * 8;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TriSeat(modelList: [
              SeatModel(seatNo: quarter + 1),
              SeatModel(seatNo: quarter + 2),
              SeatModel(seatNo: quarter + 3),
            ]),
            Seat(model: SeatModel(seatNo: quarter + 7)),
          ],
        ),
        const SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TriSeat(modelList: [
              SeatModel(seatNo: quarter + 4),
              SeatModel(seatNo: quarter + 5),
              SeatModel(seatNo: quarter + 6),
            ]),
            Seat(model: SeatModel(seatNo: quarter + 8)),
          ],
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
