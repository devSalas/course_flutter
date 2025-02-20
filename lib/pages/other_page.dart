import "package:flutter/material.dart";
import "package:weincoders_app/models/User.dart";
import "package:weincoders_app/pages/new_page.dart";

class OtherPage extends StatelessWidget {
  final User userdata;
  const OtherPage({super.key, required this.userdata});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Other Page")),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("My name is ${userdata.name} and I am ${userdata.age} years old"),
        ),
      ),
    );
  }
}
