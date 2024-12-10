import 'package:flutter/material.dart';
import 'dart:async';

import 'package:rc_controller/ui/settings/settings_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, 
    this.settings, //true
    this.customLeading, 
    this.updateFunc, 
    this.additionalText,
  });
  final bool? settings;
  final String? additionalText;
  final void Function()? updateFunc, customLeading;

  @override
  Widget build(BuildContext context) {
    // Appbar used on each page with toggleable buttons and ability for custom text, button and function when back button is pressed
    Future<void> selected(String value) async {
      switch (value) {
        //SETTINGS BTN
        // Go to settings
        case '0':
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
          break;
      }
    }

    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.black,
      automaticallyImplyLeading: customLeading == null,
      leading: customLeading != null ? Padding(
        padding: const EdgeInsets.only(left: 9),
        child: IconButton(
          icon: Image.asset('assets/icons/back.png'),
          onPressed: () => customLeading!(),
        ),
      ) : null,
      leadingWidth: customLeading != null ? 46 : null,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('HYPERDRIVE LABS', style: TextStyle(color: Colors.white)),
          Text(
            additionalText ?? "Welcome user",
            style: TextStyle(fontSize: 14, color: Colors.grey[400]),
          ),
        ],
      ),
      actions: [
        PopupMenuButton<String>(
          color: Colors.grey[900],
          icon: Image.asset('assets/icon.png'),
          onSelected: selected,
          itemBuilder: (BuildContext context) => [
            if (settings ?? true)
              PopupMenuItem(
                value: '0',
                child: Row(
                  children: [
                    SizedBox(width: 30, child: Image.asset('assets/icons/icon_settings.png')),
                    const SizedBox(width: 7),
                    SizedBox(
                      width: 135,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Settings",
                            style: TextStyle(fontSize: 17, color: Colors.blue[300]),
                          ),
                          Text(
                            "Select Settings",
                            style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                            maxLines: 2,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
