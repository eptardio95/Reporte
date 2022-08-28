class NoticiaModelo {
  String? people;
  String? planets;
  String? films;

  NoticiaModelo({this.people, this.planets, this.films});

  factory NoticiaModelo.fromJson(Map<String, String> json){
    return NoticiaModelo(
      people: json['people'],
      planets: json['planets'],
      films: json['films'],
    );
  }
}