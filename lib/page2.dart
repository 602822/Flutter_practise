import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Title"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Go back to page 1")),
      ),
    );
  }
}
