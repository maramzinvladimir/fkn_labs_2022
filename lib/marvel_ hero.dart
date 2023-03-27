class MarvelHero {
  final String name;
  final String imgPath;
  final String description;

  MarvelHero(this.name, this.imgPath, this.description);

  factory MarvelHero.fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    String imgPath =
        json['thumbnail']['path'] + '.' + json['thumbnail']['extension'];
    String description = json['description'];

    return MarvelHero(name, imgPath, description);
  }
}
