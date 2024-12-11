import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CustomControllerBtn extends StatelessWidget {
  const CustomControllerBtn({super.key, required this.label});
  final String label;


  @override
  // Custom button with image and text
  Widget build(BuildContext context) {
    final channel = WebSocketChannel.connect(
      Uri.parse('wss://car.mercantec.tech/ws'),
    );
    return Column(
      children: [
        StreamBuilder(
          stream: channel.stream,
          builder: (context, snapshot) {
            return Text(snapshot.hasData ? '${snapshot.data}' : '');
          },
        ),
        SizedBox(
          width: 120,
          height: 120,
          child: ElevatedButton(
            onPressed: () {
              channel.sink.add(label.toLowerCase());
            },
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
        ),
      ],
    );
  }
}
