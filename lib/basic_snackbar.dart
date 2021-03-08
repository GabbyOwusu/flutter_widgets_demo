import 'package:flutter/material.dart';

class SnackBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbars'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Snackbar'),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Hello Flutter Ghana'),
              ),
            );
          },
        ),
      ),
    );
  }
}
