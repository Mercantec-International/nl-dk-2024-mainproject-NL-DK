// ignore_for_file: use_build_context_synchronously

//import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sitsmart_app/classes/api/checkResponse/check_login_response_response.dart';
import 'package:sitsmart_app/classes/helper/api.dart';
import 'package:sitsmart_app/colors.dart';
import 'package:sitsmart_app/ui/listpage/listpage.dart';
import '/classes/helper/GeneralHelper.dart';
import '/widgets/custom_image_btn.dart';
import 'package:flutter/material.dart';
import '/widgets/custom_appbar.dart';
import 'loginpage_bloc.dart';
import 'loginpage_events.dart';

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
        appBar: CustomAppBar(),
        body: BlocProvider(
          create: (_) => HomepageBloc(),
          child: BlocBuilder<HomepageBloc, HomepageState>(
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
                              .read<HomepageBloc>()
                              .add(const UpdateHomepage());
                        },
                        onChanged: (value) async {
                          context
                              .read<HomepageBloc>()
                              .add(const UpdateHomepage());
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
                              .read<HomepageBloc>()
                              .add(const UpdateHomepage());
                        },
                        onChanged: (value) async {
                          context
                              .read<HomepageBloc>()
                              .add(const UpdateHomepage());
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
                            dynamic response;
                            String body =
                                "{ \"email\": \"${emailController.text}\", \"password\": \"${passwordController.text}\" }";

                            // Create item to be sent in request
                            response = CheckLoginResponse(
                                await API().postRequest(body, '/Users/login'));

                            if (response.Result == 'OK') {
                              try {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ListPage(cards: response.Cards)));

                                // No catch
                              } catch (_) {}
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
