import 'package:flutter/material.dart';
import 'package:flutter2_widgets_demo/basic_snackbar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selected;

  List<String> selectedOptions = [
    'Ghana',
    'Togo',
    'Nigeria',
    'Cameroon',
    'India',
    'Brazil',
    'Senegal',
    'Congo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autocomplete Basic example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Autocomplete example'),
              SizedBox(height: 30),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return selectedOptions.where((e) {
                    return e.contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  setState(() {
                    selected = selection;
                    print(selected);
                  });
                },
                fieldViewBuilder: (
                  BuildContext context,
                  TextEditingController textEditingController,
                  FocusNode focusNode,
                  Function onFieldSubmitted,
                ) {
                  return TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Check out Autocomplete!',
                    ),
                    focusNode: focusNode,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SnackBarScreen();
              },
            ),
          );
        },
        child: Icon(
          Icons.arrow_forward,
        ),
      ),
    );
  }
}
