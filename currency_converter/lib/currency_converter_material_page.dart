import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  final List<Icon> _currencyConversionAvailable = [
    Icon(Icons.attach_money),
    Icon(Icons.euro),
    Icon(Icons.currency_rupee),
  ];
  Icon? _selectedOption = Icon(Icons.attach_money);
  final TextEditingController textEditingController =
      TextEditingController(); //(??)//it is used for storing the data given by the user as variable
  double result = 0; //defining intitial value as 0 for calculating the value
  @override
  void initState() {
    //(??)
    //init state function is used for the function whose value will come late to the question but we want to use it
    super.initState();
    print('rebuild');
  }

  @override
  Widget build(BuildContext context) {
    print('build fn');
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(60), //for circular borders
      ),
    );
    return Scaffold(
      //Makes the background white without it we can't write
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'currency Converter',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),

              child: Text(
                result.toString(),
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(235, 245, 243, 243),
                ),
              ),
            ),
            Padding(
              //we can use container instead of padding
              padding: const EdgeInsets.all(8.0), //gives space around the child
              child: TextField(
                //used to make a input writing line in app
                controller: textEditingController,
                style: TextStyle(
                  color: Colors.black,
                ), //color of the text in the text field
                decoration: InputDecoration(
                  hintText:
                      'Please enter the amount in USD', //for writinsag a sentence which will disappear as we start writitng
                  hintStyle: TextStyle(color: Colors.black),
                  prefix: DropdownButton(
                    value:
                        _selectedOption ?? _currencyConversionAvailable.first,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedOption = newValue;
                      });
                    },
                    items:
                        _currencyConversionAvailable.map((currency) {
                          return DropdownMenuItem(
                            value: currency,
                            child: currency,
                          );
                        }).toList(),
                  ), //Adding icon in the beginning
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    //(??) it rebuilds the widget from build in function
                    result = double.parse(textEditingController.text) * 87.15;
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  fixedSize: Size(400, 50),
                ),
                child: Text('Convert'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
