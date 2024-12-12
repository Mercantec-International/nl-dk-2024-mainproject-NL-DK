import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/widgets/custom_appbar.dart';
import 'settings_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}
class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(settings: false),
      body: BlocProvider(
        create: (_) => SettingsBloc(),
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) => const SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  // TOO: ADD ABILITY TO CHANGE CAR AFTER IT WAS SAVED TO SHARED PREFERENCES
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
