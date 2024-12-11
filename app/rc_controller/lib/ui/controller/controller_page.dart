import 'package:flutter/material.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key, required this.title});

  final String title;

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  bool _isLoggedIn = false;
  String _loggedInUser = "";

  Widget _buildControlButton(String label, VoidCallback onPressed) {
    return SizedBox(
      width: 120,
      height: 120,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(16),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(color: Colors.white),
            ),
            if (_isLoggedIn)
              TextButton(
                onPressed: () {
                  setState(() {
                    _isLoggedIn = false;
                    _loggedInUser = "";
                  });
                },
                child: Text(
                  _loggedInUser,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Forward button
            _buildControlButton('Forward', () {
              print('Forward pressed');
            }),
            // Left, Stop, Right buttons row
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildControlButton('Left', () {
                  print('Left pressed');
                }),
                const SizedBox(width: 16),
                _buildControlButton('Stop', () {
                  print('Stop pressed');
                }),
                const SizedBox(width: 16),
                _buildControlButton('Right', () {
                  print('Right pressed');
                }),
              ],
            ),
            // Backward button
            const SizedBox(height: 16),
            _buildControlButton('Backward', () {
              print('Backward pressed');
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 56,
          child: Center(
            child: Text(
              'RCXD Controller',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
