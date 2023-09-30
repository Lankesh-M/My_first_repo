import 'package:flutter/material.dart';
import 'test.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Self care'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, Mark!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Test()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                minimumSize: Size(200, 50),
              ),
              child: Text('Take a Test'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: Size(200, 50),
              ),
              child: Text('Book an Appoinment'),
            ),
          ],
        ),
      ),
    );
  }
}
