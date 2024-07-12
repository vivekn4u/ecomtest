import 'package:flutter/material.dart';

///Display Generic error message in app with separate page
class ErrorPage extends StatelessWidget {
  final String? message;
  const ErrorPage({super.key, this.message});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
            color: Colors.redAccent,
            child: Center(
              child: Text(
                message!,
                style: const TextStyle(color: Colors.white),
              ),
            )),
      );
}
