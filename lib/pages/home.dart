import 'package:alquileres_app/pages/favourites.dart';
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
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://electronicssoftware.net/wp-content/uploads/user.png'),
                ),
                accountName: Text('Gonzalo'),
                accountEmail: Text('gonzalo.gauto@gmail.com')),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Favoritos'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FavouritePage()));
                })
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            //LIST VIEW
            return ListView(
              itemExtent: 330,
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
                padding: EdgeInsets.all(5),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: constraints.maxWidth > 900 ? 3 : 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
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
        tooltip: 'Buscar',
        child: Icon(Icons.search),
      ),
    );
  }
}
