import 'package:flutter/material.dart';
import 'package:rc_controller/ui/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

final globalNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globalNavigatorKey,
      title: 'RCXD Controller',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage()//SelectPage(cars: [CarObject("1", "1", DateTime.now(), DateTime.now(), DateTime.now())])//MyHomePage(title: 'RCXD Controller Home Page'),
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  bool _isLoggedIn = false;
  String _loggedInUser = "";

  Future<String?> _checkCredentials(String username, String password) async {
    // TODO: Replace this with your actual database check
    // This is just a mock example
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    // Mock validation logic
    // Replace with actual database check
    if (username == "test") {
      if (password == "password") {
        return null; // No error, credentials are correct
      } else {
        return "Incorrect password"; // Username exists, but password is wrong
      }
    } else {
      return "User doesn't exist"; // Username doesn't exist
    }
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _errorMessage = null;
      });

      final error = await _checkCredentials(
        _usernameController.text,
        _passwordController.text,
      );

      setState(() {
        _errorMessage = error;
        if (error == null) {
          _isLoggedIn = true;
          _loggedInUser = _usernameController.text;
        }
      });
    }
  }

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
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
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
}
*/