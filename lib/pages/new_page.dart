import "package:flutter/material.dart";
import "package:weincoders_app/config/app_routes.dart";
import "package:weincoders_app/models/User.dart";
import "package:weincoders_app/pages/other_page.dart";

class NewPage extends StatelessWidget {
  const NewPage({super.key});
  @override
  Widget build(BuildContext context) {
    final userdata = User(name: "John Doe", age: 30);
    return Scaffold(
      appBar: AppBar(title: Text("New Page")),
      body: Center(
        child: TextButton(
          child: Text("This is a new page"),
          onPressed:
              () => Navigator.of(
                context,
              ).pushReplacementNamed(AppRouters.otherPage, arguments: userdata),
        ),
      ),
    );
  }
}
