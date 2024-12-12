import 'package:flutter/material.dart';
import 'package:rc_controller/classes/helper/GeneralHelper.dart';
import 'package:rc_controller/widgets/custom_appbar.dart';
import 'package:rc_controller/widgets/custom_controller_btn.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(additionalText: "Welcome ${General.username}"),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Forward button
            CustomControllerBtn(label: 'Forward'),
            // Left, Stop, Right buttons row
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomControllerBtn(label: 'Left'),
                SizedBox(width: 16),
                CustomControllerBtn(label: 'Stop'),
                SizedBox(width: 16),
                CustomControllerBtn(label: 'Right'),
              ],
            ),
            // Backward button
            SizedBox(height: 16),
            CustomControllerBtn(label: 'Backward'),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
