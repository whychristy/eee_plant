
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';



class TestHardware extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Test Your Hardware"),
      ),
      body: Center(
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Press this button to test your hardware."  +  '\n' + 'The plant will be watered.' + '\n' + 'The LEDs will flash.' + '\n'),
            RaisedButton(
              child: Text("Test"),
              onPressed: _updateTestDatabase,
              color: Colors.grey,
              textColor: Colors.black,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  _updateTestDatabase() {
    FirebaseDatabase.instance.reference().child("HardwareTest").update(
        {"All": "True"}
    );
  }
}