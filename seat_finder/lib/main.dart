import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seat_finder/src/bloc/search_bloc.dart';
import 'package:seat_finder/src/screen/seat_finder.dart';
import 'package:seat_finder/src/style/style.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: BlocProvider(
        create: (_) => SearchCubit(),
        child: const SeatFinder(),
      ),
    );
  }
}
