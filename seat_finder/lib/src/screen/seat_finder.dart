import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seat_finder/src/bloc/search_bloc.dart';
import 'package:seat_finder/src/widget/widget.dart';

import '../style/palette.dart';

class SeatFinder extends StatefulWidget {
  const SeatFinder({super.key});

  @override
  State<SeatFinder> createState() => _SeatFinderState();
}

class _SeatFinderState extends State<SeatFinder> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          Text(
            'Seat Finder',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 20.0),
          _buildSearch(context),
          const SizedBox(height: 20.0),
          Column(
            children: List.generate(10, (index) => SeatSet(rQuarter: index)),
          ),
        ],
      ),
    ));
  }

  Stack _buildSearch(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 50.0,
          child: TextField(
            controller: controller,
            style: Theme.of(context).textTheme.bodyMedium,
            cursorColor: Palette.blue,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(width: 4, color: Palette.blue)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(width: 4, color: Palette.blue)),
              hintText: 'Enter Seat Number...',
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: BlocBuilder<SearchCubit, int>(builder: (context, state) {
            return ElevatedButton(
              onPressed: () => context
                  .read<SearchCubit>()
                  .find(int.tryParse(controller.text) ?? 0),
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      controller.text.isEmpty ? Palette.grey : Palette.blue,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)))),
              child: Text('Find', style: TextStyle(color: Palette.white)),
            );
          }),
        )
      ],
    );
  }
}
