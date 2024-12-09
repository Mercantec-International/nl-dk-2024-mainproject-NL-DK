import 'package:flutter/material.dart';
import 'package:rc_controller/classes/api/objects/car.dart';
import 'package:rc_controller/ui/selectcar/select_car_page.dart';

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
      home: SelectPage(cars: [CarObject("1", "1", DateTime.now(), DateTime.now(), DateTime.now())])//MyHomePage(title: 'RCXD Controller Home Page'),
    );
  }
}

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
      body: Center(
        child: _isLoggedIn
            ? Column(
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
              )
            : Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                width: 300,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        style: const TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        style: const TextStyle(color: Colors.white),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: _handleLogin,
                        child: const Text('Login'),
                      ),
                      if (_errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            _errorMessage!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
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
