import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rc_controller/classes/helper/GeneralHelper.dart';
import 'package:rc_controller/ui/selectcar/select_car_events.dart';
import 'package:rc_controller/widgets/custom_appbar.dart';

import '../../widgets/custom_list_item.dart';
import 'select_car_bloc.dart';

class SelectPage extends StatefulWidget {
  SelectPage({super.key, required this.cars});
  dynamic cars;

  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  @override
  // Select page with all given licensplates, used for both recentRegs and checkId
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: CustomAppBar(additionalText: "Welcome ${General.username}"),
    body: BlocProvider(
      create: (_) => SelectBloc(),
      child: BlocBuilder<SelectBloc, SelectState>(
        builder: (context, state) => Stack(
          children: [
            // Custom List widget
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 0.5))),
              child: ListView.builder(
                itemCount: widget.cars.length,
                // Add all items that doesnt contain null
                itemBuilder: (context, position) =>
                  widget.cars[position] != null ? DecoratedBox(
                    decoration: BoxDecoration(border: Border.all(width: 0.5)),
                    child: CustomListItem(
                      updateFunc: () => context.read<SelectBloc>().add(const UpdateSelectPage()),
                      id: widget.cars[position].id,
                      lastEmergency: widget.cars[position].lastEmergency,
                      createdAt: widget.cars[position].createdAt,
                      index: position,
                    ),
                  ) : null,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
