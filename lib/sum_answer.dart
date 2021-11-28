import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  final int firstNumber;
  final int secondNumber;

  const MyCustomForm(this.firstNumber, this.secondNumber, {Key? key})
      : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final _myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    super.dispose();
    _myController.dispose();
  }

  void _printLatestValue() {
    if ((_myController.text).isNotEmpty) {
      if (int.parse(_myController.text) ==
          widget.firstNumber + widget.secondNumber) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Success!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return TextFormField(
      controller: _myController,
      textAlign: TextAlign.right,
      style: const TextStyle(fontSize: 45, fontFamily: 'Georgia'),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
      // decoration: const InputDecoration(labelText: "Your answer"),
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     TextFormField(
      //       style: const TextStyle(fontSize: 45, fontFamily: "Georgia"),
      //       textAlign: TextAlign.right,
      //       // The validator receives the text that the user has entered.
      //       validator: (value) {
      //         if (value == null || value.isEmpty) {
      //           return 'Please enter some text';
      //         }
      //         return null;
      //       },
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 16.0),
      //     child: ElevatedButton(
      //       onPressed: () {
      //         // Validate returns true if the form is valid, or false otherwise.
      //         if (_formKey.currentState!.validate()) {
      //           // If the form is valid, display a snackbar. In the real world,
      //           // you'd often call a server or save the information in a database.
      //           ScaffoldMessenger.of(context).showSnackBar(
      //             const SnackBar(content: Text('Processing Data')),
      //           );
      //         }
      //       },
      //       child: const Text('Submit'),
      //     ),
      //   ),
      // ],
      // ),
    );
  }
}
