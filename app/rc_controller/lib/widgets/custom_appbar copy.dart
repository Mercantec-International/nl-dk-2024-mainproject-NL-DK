import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget implements PreferredSizeWidget {
  const CustomListItem({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue);
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
