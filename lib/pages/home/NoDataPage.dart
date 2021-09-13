import 'package:flutter/material.dart';

class NoDataPage extends StatelessWidget {
  const NoDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Can not find Server, Please try later!",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
