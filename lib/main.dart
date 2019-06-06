import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    home:FirstScreen(),
  ));
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends  State<FirstScreen> {
  TextEditingController textFieldController = TextEditingController();
  List<String> _locations = ['18', '19', '20', '21'];
  String _selectedLocation = '18';
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('Coverfox'),
        actions: <Widget>[

        ],
      ),
      // body is the majority of the screen.
      body: Center(

        child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                'Secure your family’s future',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),

              new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                        'Gender',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                    ),
                    new Radio(
                      value: 1,
                      groupValue: 'male',
                    ),
                    new Text('Male'),

                    new Radio(
                      value: 2,
                      groupValue: 'female',
                    ),
                    new Text('Female'),
                  ]
              ),

              DropdownButton(
                hint: Text('Your Age'), // Not necessary for Option 1
                value: _selectedLocation,
                onChanged: (newValue) {
                  setState(() {
                    _selectedLocation = newValue;
                  });
                },
                items: _locations.map((location) {
                  return DropdownMenuItem(
                    child: new Text(location),
                    value: location,
                  );
                }).toList(),
              ),

              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextField(
                  controller: textFieldController,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),

              RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  _sendDataToSecondScreen(context);
                },
              )

            ]
        )
      ),

    );
  }
  // get the text in the TextField and start the Second Screen
  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(text: textToSend,),
        ));
  }
}

class SecondScreen extends StatelessWidget {
  final String text;

  // receive data from the FirstScreen as a parameter
  SecondScreen({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second screen')),
      body: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

