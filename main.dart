import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PlantAppTM",
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}



class HomePageState extends State<HomePage> {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PlantAppTM"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushMenu),
        ],
      ),
      body: const Center(
        child: const Text("Show summary of plant info here maybe"),
      ),
    );
  }

  //TO-DO for menu:
  // Add icons to ListTiles "leading: icon"

  void _pushMenu() {
    Navigator.push(context,
      MaterialPageRoute<void>(
        // Add 20 lines from here...
        builder: (BuildContext context) {
          List<Widget> divided = ListTile
              .divideTiles(
              context: context,
              tiles: [
                ListTile(

                  title: Text("Manage Your Plants"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)
                        => ManagePlants())
                    );
                  },
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                    title: Text("Memories"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Memories())
                      );
                    }
                ),
                ListTile(
                  title: Text("Tutorial: Getting Started"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  title: Text("Help"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  title: Text("App Information"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ]
          )
              .toList();


          return Scaffold(
              appBar: AppBar(
                title: Text('Functions (Placeholder name)'),
              ),
              body: ListView(children: divided)
          );
        },
      ),
    );
  }



}

// Using a function did not work, due to context not being found or something...



//Can't use StatefulWidget here for some reason
class ManagePlants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Your Plants"),
      ),
      body: const Center(
        child: const Text("Show plant controls here"),
      ),
    );
  }
}

class Memories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Memories")),
      body: const Center(
        child: const Text("Functionalities here"),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState () => HomePageState();
}
