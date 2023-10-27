import 'package:flutter/material.dart';

class MassConverter extends StatefulWidget {
  const MassConverter({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MassConverterState createState() => _MassConverterState();
}

class _MassConverterState extends State<MassConverter> {
  double inputValue = 0;
  double result = 0;
  String fromUnit = 'Grams';
  String toUnit = 'Kilograms';

  final massUnits = ['Grams', 'Kilograms', 'Pounds', 'Ounces'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mass Converter'),
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,

              onChanged: (text) {
                setState(() {
                  inputValue = double.tryParse(text) ?? 0;
                  convertMass();
                });
              },

              decoration: InputDecoration(
                labelText: 'Enter Mass',                
                suffixText: fromUnit,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                  decoration: BoxDecoration(
                    color: Colors.grey[150],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButton<String>(
                    value: fromUnit,
                    items: massUnits.map((unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                    onChanged: (unit) {
                      setState(() {
                        fromUnit = unit!;
                        convertMass();
                      });
                    },
                  ),
                ),

                const SizedBox(width: 20),
                const Text('to'),
                const SizedBox(width: 20),

                Container(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                  decoration: BoxDecoration(
                    color: Colors.grey[150],
                    borderRadius: BorderRadius.circular(12),
                    
                  ),
                  child: DropdownButton<String>(
                    value: toUnit,
                    items: massUnits.map((unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                    onChanged: (unit) {
                      setState(() {
                        toUnit = unit!;
                        convertMass();
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Result: $result $toUnit'),
          ],
        ),
      ),
    );
  }

  void convertMass() {
    double convertedValue = inputValue;

    // Convert from the selected 'fromUnit' to grams
    switch (fromUnit) {
      case 'Kilograms':
        convertedValue = inputValue * 1000;
        break;
      case 'Pounds':
        convertedValue = inputValue * 453.592;
        break;
      case 'Ounces':
        convertedValue = inputValue * 28.3495;  
    }

    // Convert from grams to the selected 'toUnit'
    switch (toUnit) {
      case 'Kilograms':
        result = convertedValue / 1000;
        break;
      case 'Pounds':
        result = convertedValue / 453.592;
        break;
      case 'Ounces':
        result = convertedValue / 28.3495;
        break;
      default:
        result = convertedValue;
        break;
    }
  }
}