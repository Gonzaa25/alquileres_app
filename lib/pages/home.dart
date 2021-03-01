import 'package:alquileres_app/resources/data.dart';
import 'package:alquileres_app/widgets/homecard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            //LIST VIEW
            return ListView(
              itemExtent: 320,
              padding: EdgeInsets.all(10),
              children: [
                for (var casa in casas)
                  HomeCard(
                    datos: casa,
                  )
              ],
            );
          } else {
            //GRID VIEW
            return GridView(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                children: [
                  for (var casa in casas)
                    HomeCard(
                      datos: casa,
                    )
                ]);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          //TODO implementar buscador
        },
        tooltip: 'Increment',
        child: Icon(Icons.search),
      ),
    );
  }
}
