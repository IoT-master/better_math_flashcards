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
  late TextEditingController _myController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // _myController.addListener(_printLatestValue);
    _myController = TextEditingController();
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
          const SnackBar(
            content: Text('Success!'),
            duration: Duration(seconds: 5),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _myController,
            // autofillHints: [AutofillHints.name],
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 45, fontFamily: 'Georgia'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return "Where's the number?";
              }
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            // decoration: const InputDecoration(labelText: "Your answer"),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  _printLatestValue();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
