import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seat_finder/src/bloc/search_bloc.dart';
import '../model/seat_model.dart';
import '../style/style.dart';

class Seat extends StatelessWidget {
  const Seat({super.key, required this.model});

  final SeatModel model;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: SeatBorder(radius: 7.0, type: model.type),
      child: _BaseSeat(model: model),
    );
  }
}

class TriSeat extends StatelessWidget {
  const TriSeat({super.key, required this.modelList})
      : assert(modelList.length == 3, "TriSeat only allows three seats.");

  final List<SeatModel> modelList;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: SeatBorder(radius: 7.0, type: modelList[0].type),
      child: Row(
        children: [
          _BaseSeat(model: modelList[0]),
          const SizedBox(width: 2.0),
          _BaseSeat(model: modelList[1]),
          const SizedBox(width: 2.0),
          _BaseSeat(model: modelList[2]),
        ],
      ),
    );
  }
}

class _BaseSeat extends StatelessWidget {
  const _BaseSeat({required this.model});

  final SeatModel model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, int>(builder: (context, state) {
      return Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: state == model.seatNo ? Palette.selected : Palette.lBlue,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            model.type.isTop() ? Container() : const SizedBox(height: 8.0),
            model.type.isTop()
                ? const SizedBox(height: 8.0)
                : Expanded(
                    child: Text(
                      model.seatType.type(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: state == model.seatNo
                              ? Palette.white
                              : Palette.blue),
                    ),
                  ),
            Expanded(
              flex: 2,
              child: Text(
                model.seatNo.toString(),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: state == model.seatNo
                        ? Palette.white
                        : Palette.selected),
              ),
            ),
            model.type.isTop()
                ? Expanded(
                    child: Text(
                      model.seatType.type(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: state == model.seatNo
                              ? Palette.white
                              : Palette.selected),
                    ),
                  )
                : const SizedBox(height: 8.0)
          ],
        ),
      );
    });
  }
}
