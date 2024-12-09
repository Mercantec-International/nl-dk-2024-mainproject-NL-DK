import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../classes/helper/GeneralHelper.dart';
import '/widgets/custom_appbar.dart';
import 'settings_events.dart';
import 'settings_bloc.dart';
import '/colors.dart';
import 'dart:async';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}
class _SettingsPageState extends State<SettingsPage> {
  static int selectedBtn = -1;
  Completer isSelecting = Completer()..complete();

  void willPop() {
    if (!General.isLoading) {
      General().ShowLoadingDialog("Saving data");
      
      // Check if anything is missing
      if (true/*SP.checkSettings()*/) {
        // Save shared preferences
        /*SP.saveValueToSP('SelectedCarId', selectedCarId);

        if (mounted) {
          // Push to home page
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomePage()), (Route<dynamic> route) => false);
        }*/
      } else {
        // Missing input
        General.makeSnackBar("Missing car id");
        
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Settings page, the first page the user sees after first download, has required input for notification time period and recycling station id(s) also requires cotd to access
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        settings: false,
        toggleAlarm: false,
        setRecyclePoint: false,
        checkRecyclePointStatus: false,
        customBtn: const Text(''),
        additionalText: "Version: ${General.version}",
        customLeading: willPop,
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (!didPop) willPop();
        },
        child: BlocProvider(
          create: (_) => SettingsBloc(),
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) => SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    // Column with title, text for all selected ids and button to change selection
                    Column(
                      children: [
                        // Title for select id
                        Center(child: Text('Plant ID', style: TextStyle(fontSize: General.isPhone ? 30 : 50))),
                        const SizedBox(height: 10),
                        // Container with text for selected ids and btn to change them
                        Container(
                          width: General.isPhone ? 300 : 500,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(
                            children: [
                              //Text to show selected IDs
                              /*if (SP.RecyclingPointIDs != null && SP.RecyclingPointIDs!.isNotEmpty)
                                Container(
                                  height: General.isPhone ? 50 : 70,
                                  alignment: Alignment.center,
                                  child: Text(SP.RecyclingPointIDs!.join(', '), style: TextStyle(color: Colors.black, fontSize: General.isPhone ? 30 : 45)),
                                ),*/
                              //Select IDs btn
                              GestureDetector(
                                onTapCancel: () {selectedBtn = -1; context.read<SettingsBloc>().add(const UpdateSettingsPage());},
                                onTapDown: (details) {selectedBtn = 0; context.read<SettingsBloc>().add(const UpdateSettingsPage());},
                                onTapUp: (details) {selectedBtn = -1; context.read<SettingsBloc>().add(const UpdateSettingsPage());},
                                onTap: () async {
                                  if (isSelecting.isCompleted) {
                                    General().ShowLoadingDialog();
                                    isSelecting = Completer();
                                    General.connectivity = await Connectivity().checkConnectivity();
                                    
                                    if (General.connectivity != ConnectivityResult.none) {
                                      //cmRes ??= CheckMunicipalitiesResponse(await API().sendRequest({}, 'ListMunicipalities', false));
                                      
                                      //await removeInvalidRecyclingStations(cmRes!.Municipalities);
                                      General.isLoading = false;
                                      if (!General.doneLoading!.isCompleted) General.doneLoading!.complete();
                                      Navigator.pop(context);
                                    } else {
                                      General.isLoading = false;
                                      if (General.doneLoading!.isCompleted) General.doneLoading!.complete();
                                      Navigator.pop(context);
                                      General.makeSnackBar("Der opstod en fejl");
                                    }
                                  }
                                },
                                // Select Recycling point btn
                                child: Container(
                                  height: General.isPhone ? 55 : 80,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    gradient: selectedBtn == 0 ? clickedGradient : btnGradient,
                                    border: const Border(top: BorderSide()),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "selectrecyclingcenter",
                                    style: TextStyle(color: Colors.white, fontSize: General.isPhone ? 25 : 35),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(thickness: 1, color: Colors.black, height: 45),
                    // Container with time range selector for notifications
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: const BorderRadius.all(Radius.circular(3)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          // Title for time range
                          Text(
                            "getnotificationstime",
                            style: TextStyle(fontSize: General.isPhone ? 25 : 35),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 15)
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Save btn
                    GestureDetector(
                      onTapCancel: () {selectedBtn = -1; context.read<SettingsBloc>().add(const UpdateSettingsPage());},
                      onTapUp: (details) {selectedBtn = -1; context.read<SettingsBloc>().add(const UpdateSettingsPage());},
                      onTapDown: (details) {selectedBtn = 1; context.read<SettingsBloc>().add(const UpdateSettingsPage());},
                      onTap: () => {willPop()},
                      child: Container(
                        height: General.isPhone ? 55 : 80,
                        width: General.isPhone ? 300 : 500,
                        decoration: BoxDecoration(
                          gradient: selectedBtn == 1 ? clickedGradient : greenGradient,
                          border: Border.all(),
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Gem",
                          style: TextStyle(color: Colors.white, fontSize: General.isPhone ? 25 : 35),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
