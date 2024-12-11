// ignore_for_file: must_be_immutable
import 'package:connectivity_plus/connectivity_plus.dart';
import '../classes/helper/SPHelper.dart';
import '../classes/helper/GeneralHelper.dart';
import 'package:flutter/material.dart';
import '../classes/helper/api.dart';

class CustomListItem extends StatelessWidget {
  CustomListItem(
      {super.key,
      required this.id,
      required this.lastEmergency,
      required this.createdAt,
      required this.updateFunc,
      required this.index}) {}
  final String id;
  final DateTime lastEmergency, createdAt;
  final int index;
  void Function() updateFunc;

  @override
  // Custom item to show in list page showing the company, license plate and status of each entry
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            // TODO: GO TO CONTROLLER
            await Navigator.push(context,
                MaterialPageRoute(builder: (context) => ControllerPage()));
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(10),
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: General.isPhone ? null : 25,
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Title
                              const Text("Id:"),
                              //Content
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 55,
                                child: Text(
                                  id,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: General.isPhone ? 20 : 35),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Last emergency:"),
                              Text(
                                lastEmergency.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: General.isPhone ? 20 : 35),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              const Text('Created at:'),
                              Text(
                                createdAt.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: General.isPhone ? 20 : 35),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ControllerPage(title: id),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      child: const Text(
                        'Control Car',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
