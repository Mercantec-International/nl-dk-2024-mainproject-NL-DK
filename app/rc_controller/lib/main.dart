import 'package:flutter/material.dart';
import 'package:rc_controller/ui/settings/settings_page.dart';

void main() {
  runApp(const MyApp());
}

final globalNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    navigatorKey: globalNavigatorKey,
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const SettingsPage(),
  );
}