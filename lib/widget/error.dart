import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 300, 0, 0),
      child: Center(
        child: const Text("Please enter a valid city",
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 25,
                fontFamily: 'Cinzel',
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
