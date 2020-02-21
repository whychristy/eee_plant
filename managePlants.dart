import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class PlantList extends StatefulWidget {
  const PlantList();
  @override
  _PlantListState createState() => new _PlantListState();
}

class _PlantListState extends State<PlantList> {

  _updateDatabaseEntry(String name, String light, String temperature,
      String water) {
    FirebaseDatabase.instance.reference().child("Information").child(
        "CurrentPlant").update(
        {
          "Name": name,
          "Light": light,
          "Temperature": temperature,
          "Water": water
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    var plants = FirebaseDatabase.instance.reference().child('Plants');

    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Your Plant"),
      ),
      body:
      new Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                decoration: ShapeDecoration(
                    shape: Border(bottom: BorderSide(color: Theme
                        .of(context)
                        .dividerColor))
                ),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 55.0,
                child:
                new StreamBuilder(
                  stream: FirebaseDatabase.instance
                      .reference()
                      .child("Information")
                      .onValue,

                  //plants.onValue,
                  builder: (context, snap) {
                    if (snap.hasData && !snap.hasError &&
                        snap.data.snapshot.value != null) {
                      Map data = snap.data.snapshot.value;
                      List item = [];

                      data.forEach((index, data) =>
                          item.add({"key": index, ...data}));

                      return ListView.builder(
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("Current Plant: " + item[index]["Name"],
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontFamily: 'Raleway'),
                            ),
                          );
                        },
                      );
                    }
                    else
                      return Text(" ");
                  },
                ),
              ),
              Expanded(
                child: new StreamBuilder(
                  stream: plants.onValue,
                  builder: (context, snap) {
                    if (snap.hasData && !snap.hasError &&
                        snap.data.snapshot.value != null) {
                      Map data = snap.data.snapshot.value;
                      List item = [];

                      data.forEach((index, data) =>
                          item.add({"key": index, ...data}));

                      return ListView.builder(
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(item[index]["Name"]),
                            onTap: () =>
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _buildAboutDialog(
                                          context, item[index]["Name"],
                                          item[index]["Temperature"],
                                          item[index]["Light"],
                                          item[index]["Water"],
                                          item[index]['key']),
                                  barrierDismissible: false,
                                ),
                          );
                        },
                      );
                    }
                    else
                      return Text(" ");
                  },
                ),
              ),
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildAddPlant(context),
              barrierDismissible: false,
            ),
      ),
    );
  }

  Widget _buildAboutDialog(BuildContext context, String name,
      String temperature, String light, String water, key) {
    return new AlertDialog(
      title: new Text(name),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAboutText(temperature, light, water),
          //_buildLogoAttribution(),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          padding: EdgeInsets.only(right: 10.0),
          onPressed: () {
            _updateDatabaseEntry(name, light, temperature, water);
            Navigator.of(context).pop();
          },
          //textColor: Theme.of(context).primaryColor,
          child: const Text('Choose this plant'),
        ),
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          //textColor: Theme.of(context).primaryColor,
          child: const Text('Go back'),
        ),
        new IconButton(icon: Icon(Icons.delete),
            onPressed: () {
              FirebaseDatabase.instance.reference().child('Plants')
                  .child(key)
                  .remove();
              Navigator.of(context).pop();
            }),
      ],
    );
  }


  Widget _buildAboutText(String temperature, String light, String water) {
    return new RichText(
      text: new TextSpan(
        text: 'Optimal Temperature: ' + temperature + '\u2103' + '\n\n' +
            'Light need: ' + light + '\n\n' + 'Watering need: ' + water +
            '\n\n',
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }

  final inputName = TextEditingController();
  final inputTemperature = TextEditingController();
  final inputLight = TextEditingController();
  final inputWater = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    inputName.dispose();
    inputTemperature.dispose();
    inputLight.dispose();
    inputWater.dispose();
    super.dispose();
  }


  Widget _buildAddPlant(BuildContext context) {
    return new AlertDialog(
      title: new Text("Add a new plant"),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Name of the plant: "),
          _buildAddPlantTextName(),
          Text("\n \n" + "Optimal temperature of plant: "),
          _buildAddPlantTextTemperature(),
          Text("\n \n" + "Light need of plant: "),
          _buildAddPlantTextLight(),
          Text("\n \n" + "Water need of plant: "),
          _buildAddPlantTextWater(),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          padding: EdgeInsets.only(right: 111.0),
          onPressed: () {
            FirebaseDatabase.instance.reference().child('Plants').push().set({
              "Name": inputName.text,
              "Temperature": inputTemperature.text,
              "Light": inputLight.text,
              "Water": inputWater.text
            });
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          //textColor: Theme.of(context).primaryColor,
          child: const Text('Add plant'),
        ),
        new FlatButton(
          onPressed: () {
            inputName.text = " ";
            inputTemperature.text = " ";
            inputLight.text = " ";
            inputWater.text = " ";
            Navigator.of(context).pop();
          },
          //textColor: Theme.of(context).primaryColor,
          child: const Text('Go back'),
        ),
      ],
    );
  }


  Widget _buildAddPlantTextName() {
    return new Container(
      height: 25.0,
      //padding: const EdgeInsets.all(16.0),
      child: TextField(
        autofocus: false,
        controller: inputName,
        decoration: InputDecoration(
          //border: OutlineInputBorder(),
          //prefixText: 'Name of plant: ',
          //labelText: 'Name of plant: ',
        ),
      ),
    );
  }

  Widget _buildAddPlantTextTemperature() {
    return new Container(
      height: 25.0,
      //padding: const EdgeInsets.all(16.0),
      child: TextField(
        autofocus: false,
        controller: inputTemperature,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          //border: OutlineInputBorder(),
          //prefixText: 'Temperature need of plant: ',
          //labelText: 'Temperature need of plant: ',
        ),
      ),
    );
  }

  Widget _buildAddPlantTextLight() {
    return new Container(
      height: 25.0,
      //padding: const EdgeInsets.all(16.0),
      child: TextField(
        autofocus: false,
        controller: inputLight,
        decoration: InputDecoration(
          //border: OutlineInputBorder(),
          //prefixText: 'Light need of plant: ',
          //labelText: 'Light need of plant: ',
        ),
      ),
    );
  }

  Widget _buildAddPlantTextWater() {
    return new Container(
      height: 25.0,
      //padding: const EdgeInsets.all(16.0),
      child: TextField(
        autofocus: false,
        controller: inputWater,
        decoration: InputDecoration(
          //border: OutlineInputBorder(),
          //prefixText: 'Watering need of plant: ',
          //labelText: 'Watering need of plant: ',
        ),
      ),
    );
  }
}