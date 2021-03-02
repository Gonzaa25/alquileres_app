import 'package:alquileres_app/providers/favsprovider.dart';
import 'package:alquileres_app/resources/data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeCard extends StatefulWidget {
  final Casa datos;
  HomeCard({this.datos});
  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    //TODO implementar pagina de detalle
    final myfavs = context.watch<FavsProvider>().myfavs;
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
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: widget.datos.imagen,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              icon: myfavs.contains(widget.datos)
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                    ),
                              onPressed: () {
                                if (myfavs.contains(widget.datos)) {
                                  context
                                      .read<FavsProvider>()
                                      .removeFav(widget.datos);
                                } else {
                                  context
                                      .read<FavsProvider>()
                                      .addFav(widget.datos);
                                }
                              }),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                      trailing: Text('Disponible',
                          style: GoogleFonts.oswald(
                              color: Colors.green,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                      title: Text(widget.datos.propietario,
                          style: GoogleFonts.oswald(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      subtitle: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: '\$${widget.datos.precio}\n',
                            style: GoogleFonts.notoSerif(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: widget.datos.direccion,
                            style: GoogleFonts.oswald(
                                color: Colors.black, fontSize: 18)),
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
                          Text('${widget.datos.ambientes}')
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
                          Text('${widget.datos.banos}')
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
                          Text('${widget.datos.pisos}')
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
