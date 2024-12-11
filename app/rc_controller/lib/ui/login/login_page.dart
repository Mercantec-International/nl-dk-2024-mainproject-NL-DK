// ignore_for_file: use_build_context_synchronously

//import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:convert';

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
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(additionalText: "Version: ${General.version}"),
        body: BlocProvider(
          create: (_) => LoginBloc(),
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) => SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    // TODO: SEPERATE INTO OWN WIDGETS
                    // Email input
                    SizedBox(
                      width: General.isPhone ? 320 : 500,
                      child: TextField(
                        textCapitalization: TextCapitalization.characters,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                        style: TextStyle(fontSize: General.isPhone ? 25 : 40),
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
                      width: General.isPhone ? 320 : 500,
                      child: TextField(
                        autofillHints: [""],
                        obscureText: true,
                        textCapitalization: TextCapitalization.characters,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        style: TextStyle(fontSize: General.isPhone ? 25 : 40),
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
                    const SizedBox(height: 20),

                    // Login BTN
                    CustomImageBtn(
                      text: "Login",
                      icon: Icons.login,
                      updateFunc: () {
                        selectedBtnId = selectedBtnId == 1 ? -1 : 1;
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
                              var a = await API().getRequest('/Cars/from-user?userId=${loginResponse.id}');
                              CheckCarResponse carResponse = CheckCarResponse(a);
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
                            }
                          } else {
                            General.makeSnackBar(emailController.text.isEmpty
                                ? "Ingen email"
                                : "Intet password");
                          }
                        } else {
                          // No connection
                          General.makeSnackBar("Ingen forbindelse");
                        }
                      },
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
