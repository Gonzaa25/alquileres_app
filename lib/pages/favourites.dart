import 'package:alquileres_app/providers/favsprovider.dart';
import 'package:alquileres_app/widgets/homecard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final casas = context.watch<FavsProvider>().myfavs;
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
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
                    mainAxisExtent: 400,
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
    );
  }
}
