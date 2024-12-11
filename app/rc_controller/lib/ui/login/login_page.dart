// ignore_for_file: use_build_context_synchronously

//import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rc_controller/classes/api/checkresponse/check_car_response%20copy.dart';
import 'package:rc_controller/classes/api/checkresponse/check_car_response.dart';
import 'package:rc_controller/classes/api/objects/car.dart';
import 'package:rc_controller/classes/helper/api.dart';
import 'package:rc_controller/colors.dart';
import 'package:rc_controller/ui/login/login_bloc.dart';
import 'package:rc_controller/ui/login/login_events.dart';
import 'package:rc_controller/ui/selectcar/select_car_page.dart';
import 'package:rc_controller/widgets/custom_controller_btn.dart';
import '/classes/helper/GeneralHelper.dart';
import '/widgets/custom_image_btn.dart';
import 'package:flutter/material.dart';
import '/widgets/custom_appbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();
  int selectedBtnId = -1;

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(additionalText: "Version: ${General.version}"),
      body: BlocProvider(
        create: (_) => LoginBloc(),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) => Center(
            child: SingleChildScrollView(
              child: Container(
                width: General.isPhone ? 320 : 480,
                margin: const EdgeInsets.only(top: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Email input
                    SizedBox(
                      width: General.isPhone ? 280 : 440,
                      child: TextField(
                        textCapitalization: TextCapitalization.characters,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(
                          fontSize: General.isPhone ? 20 : 32,
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.white54,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white70),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        controller: emailController,
                        onSubmitted: (value) {
                          context
                              .read<LoginBloc>()
                              .add(const UpdateLoginPage());
                        },
                        onChanged: (value) async {
                          context
                              .read<LoginBloc>()
                              .add(const UpdateLoginPage());
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password input
                    SizedBox(
                      width: General.isPhone ? 280 : 440,
                      child: TextField(
                        autofillHints: [""],
                        obscureText: true,
                        textCapitalization: TextCapitalization.characters,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(
                          fontSize: General.isPhone ? 20 : 32,
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.white54,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white70),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        onSubmitted: (value) {
                          context
                              .read<LoginBloc>()
                              .add(const UpdateLoginPage());
                        },
                        onChanged: (value) async {
                          context
                              .read<LoginBloc>()
                              .add(const UpdateLoginPage());
                        },
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Login BTN
                    MouseRegion(
                      child: CustomImageBtn(
                        text: "Login",
                        icon: Icons.login,
                        updateFunc: () {
                          setState(() {
                            selectedBtnId = selectedBtnId == 1 ? -1 : 1;
                          });
                        },
                        gradient:
                            selectedBtnId == 1 ? clickedGradient : btnGradient,
                        onTap: () async {
                          // Check connection
                          General.connectivity =
                              await Connectivity().checkConnectivity();
                          if (General.connectivity != ConnectivityResult.none) {
                            if (emailController.text.trim().isNotEmpty &&
                                passwordController.text.trim().isNotEmpty) {
                              String body =
                                  "{ \"email\": \"${emailController.text}\", \"password\": \"${passwordController.text}\" }";
                            // Create item to be sent in request
                            CheckLoginResponse loginResponse = CheckLoginResponse(await API().postRequest(body, '/Users/login'));
                            
                            if (loginResponse.token != null) {
                              CheckCarResponse carResponse = CheckCarResponse(await API().getRequest('/Cars/from-user?userId=${loginResponse.id}'));
                              if (carResponse.Cars.isNotEmpty) {
                                try {
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SelectPage(cars: carResponse.Cars)));
                                  // No catch
                                } catch (_) {}
                              } else {
                                General.makeSnackBar("You don't have any cars :(");
                              }
                            } else {
                              General.makeSnackBar("Could not log in");
                            }
                          } else {
                            General.makeSnackBar(emailController.text.isEmpty
                                ? "No email"
                                : "No password");
                          }
                        } else {
                          // No connection
                          General.makeSnackBar("No connection");
                        }
                      },
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
