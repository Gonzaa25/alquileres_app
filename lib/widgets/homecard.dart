import 'package:alquileres_app/resources/data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final Casa datos;
  HomeCard({this.datos});

  @override
  Widget build(BuildContext context) {
    //TODO implementar pagina de detalle
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 2,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  child: CachedNetworkImage(
                    imageUrl: datos.imagen,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                )),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                      trailing: Text('Disponible',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                      title: Text(datos.propietario,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      subtitle: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: '\$${datos.precio}\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: datos.direccion,
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                      ])),
                      isThreeLine: true)
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.king_bed_outlined),
                          Text('${datos.ambientes}')
                        ],
                      ),
                      Text('Ambientes')
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.bathtub_outlined),
                          Text('${datos.banos}')
                        ],
                      ),
                      Text('Baños')
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.stairs_outlined),
                          Text('${datos.pisos}')
                        ],
                      ),
                      Text('Pisos')
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
