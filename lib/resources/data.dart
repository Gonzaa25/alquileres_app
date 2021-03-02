class Casa {
  String id;
  String propietario;
  int precio;
  String direccion;
  String imagen;
  int ambientes;
  int banos;
  int pisos;

  Casa(
      {this.id,
      this.propietario,
      this.precio,
      this.direccion,
      this.imagen,
      this.ambientes,
      this.banos,
      this.pisos});
}

final casas = _casas.map((e) => Casa(
    id: e['id'],
    propietario: e['dueño'],
    precio: e['precio'],
    direccion: e['direccion'],
    imagen: e['imagen'],
    ambientes: e['ambientes'],
    banos: e['baños'],
    pisos: e['pisos']));

final List<Map<String, Object>> _casas = [
  {
    'id': '18fe813',
    'dueño': 'Alberto',
    'precio': 28000,
    'direccion': 'Batallan 3057 3ºC , Saenz Peña',
    'imagen':
        'https://st3.idealista.com/news/archivos/styles/news_detail/public/2018-11/casa_prefabricada.jpg?sv=pX_Hqy9d&itok=kCOtbqgQ',
    'ambientes': 3,
    'baños': 1,
    'pisos': 2
  },
  {
    'id': 'f8yvfy3',
    'dueño': 'Lucia',
    'precio': 25000,
    'direccion': 'Batallan 321 4ºC , Saenz Peña',
    'imagen':
        'https://i.blogs.es/8e8f64/lo-de-que-comprar-una-casa-es-la-mejor-inversion-hay-generaciones-que-ya-no-lo-ven-ni-de-lejos---1/450_1000.jpg',
    'ambientes': 4,
    'baños': 3,
    'pisos': 2
  },
  {
    'id': '7vjfg7a',
    'dueño': 'Juan',
    'precio': 19000,
    'direccion': 'Batallan 5800 , Saenz Peña',
    'imagen': 'https://i.blogs.es/c68014/casa-3d/450_1000.jpeg',
    'ambientes': 2,
    'baños': 1,
    'pisos': 1
  }
];
