class Products{
  final String name;
  Products( {
    required this.name,

  });
  static List<Products>fruits=[
    Products(name:'Berry'),
    Products(name:'Citrus'),
    Products(name:'False Fruit'),
    Products(name:'Nut'),
    Products(name:'Prome Fruit'),
    Products(name:'Vine Fruit'),
    Products(name:'Stone Fruit'),

  ];
  static List<Products>vegetables=[
    Products(name:'Allium'),
    Products(name:'Cruciferous'),
    Products(name:'Curcubit'),
    Products(name:'Leaf'),
    Products(name:'Legume'),
    Products(name:'NightShade'),
    Products(name:'Root'),
    Products(name:'Stalk'),
  ];
  static List<Products>flowers=[
    Products(name:'Flower'),
    Products(name:'Seed'),

  ];
  static List<Products>herbs=[
    Products(name:'Soft Herb'),
    Products(name:'Hard Herb'),

  ];
}
