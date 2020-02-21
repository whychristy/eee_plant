import 'package:flutter/material.dart';


class HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('HOME PAGE'),
      ),
      body:
      new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              child:
              new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      child:
                      new Text(
                        "Time alive:",
                        style: new TextStyle(fontSize: 41.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                      ),

                      padding: const EdgeInsets.all(0.0),
                      alignment: Alignment.topCenter,
                      width: 1.7976931348623157e+308,
                      height: 50.0,
                    ),

                    new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            child:
                            new Text(
                              "x days",
                              style: new TextStyle(fontSize: 62.0,
                                  color: const Color(0xFF000000),
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Roboto"),
                            ),

                            padding: const EdgeInsets.all(0.0),
                            alignment: Alignment.topLeft,
                            width: 220.0,
                            height: 100.0,
                          ),

                          new Container(
                            child:
                            new Icon(
                                Icons.access_time,
                                color: const Color(0xFF000000),
                                size: 100.0),

                            padding: const EdgeInsets.all(0.0),
                            alignment: Alignment.topRight,
                            width: 100.0,
                            height: 100.0,
                          )
                        ]

                    )
                  ]

              ),

              color: const Color(0xFFf2dc98),
              padding: const EdgeInsets.all(0.0),
              alignment: Alignment.topCenter,
              width: 1.7976931348623157e+308,
              height: 150.0,
            ),

            new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.topLeft,
                    width: 160.0,
                    height: 150.0,
                  ),

                  new Container(
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.topRight,
                    width: 160.0,
                    height: 150.0,
                  )
                ]

            ),

            new Container(
              padding: const EdgeInsets.all(0.0),
              alignment: Alignment.topCenter,
              width: 1.7976931348623157e+308,
              height: 160.0,
            )
          ]

      ),

    );
  }
}
class HomePage2 extends StatefulWidget {
  @override
  HomePage2State createState () => HomePage2State();
}