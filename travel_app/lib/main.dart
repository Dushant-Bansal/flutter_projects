import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/model/data.dart';
import 'package:travel_app/screen/home.dart';
import 'package:travel_app/style/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Data data = Data.fromString(await rootBundle.loadString('assets/data.json'));
  runApp(ProviderScope(child: TravelApp(data: data)));
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Home(data: data),
    );
  }
}
