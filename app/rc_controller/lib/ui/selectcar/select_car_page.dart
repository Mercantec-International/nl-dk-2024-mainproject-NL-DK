import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rc_controller/ui/selectcar/select_car_events.dart';
import 'package:rc_controller/widgets/custom_appbar.dart';

import '../../widgets/custom_appbar copy.dart';
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
  Widget build(BuildContext context) => PopScope(
    onPopInvoked: (didPop) async {
      // Pre-load images before leaving
      final icons = [
        'assets/icons/icon_scanner.png',
        'assets/icons/icon_wifi.png',
        'assets/icons/checked.png',
        'assets/icons/gbizz_app_ikon.png',
        'assets/icons/icon_car.png',
      ];
      for(var icon in icons) {
        await precacheImage(AssetImage(icon), context);
      }
    },
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(updateFunc: () => setState(() {}), customLeading: () => Navigator.pop(context)),
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
                    widget.cars[position].Company != null ? DecoratedBox(
                      decoration: BoxDecoration(border: Border.all(width: 0.5)),
                      // TODO: UPDATE OR REMOVE
                      child: const CustomListItem(
                        /*updateFunc: () => context.read<SelectBloc>().add(const UpdateSelectPage()),
                        company: widget.cars[position].Company!,
                        plate: widget.cars[position].LicensePlate!,
                        status: widget.cars[position].CustomerStatus,
                        id: widget.cars[position].Id!,
                        index: position,*/
                      ),
                    ) : null,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
