class Casa {
  String propietario;
  int precio;
  String direccion;
  String imagen;

  Casa({this.propietario, this.precio, this.direccion, this.imagen});
}

final casas = _casas.map((e) => Casa(
    propietario: e['dueño'],
    precio: e['precio'],
    direccion: e['direccion'],
    imagen: e['imagen']));

final List<Map<String, Object>> _casas = [
  {
    'dueño': 'Alberto',
    'precio': 28000,
    'direccion': 'Batallan 3057 3ºC , Saenz Peña',
    'imagen':
        'https://st3.idealista.com/news/archivos/styles/news_detail/public/2018-11/casa_prefabricada.jpg?sv=pX_Hqy9d&itok=kCOtbqgQ'
  },
  {
    'dueño': 'Lucia',
    'precio': 25000,
    'direccion': 'Batallan 321 4ºC , Saenz Peña',
    'imagen':
        'https://i.blogs.es/8e8f64/lo-de-que-comprar-una-casa-es-la-mejor-inversion-hay-generaciones-que-ya-no-lo-ven-ni-de-lejos---1/450_1000.jpg'
  },
  {
    'dueño': 'Juan',
    'precio': 19000,
    'direccion': 'Batallan 5800 , Saenz Peña',
    'imagen': 'https://i.blogs.es/c68014/casa-3d/450_1000.jpeg'
  }
];
