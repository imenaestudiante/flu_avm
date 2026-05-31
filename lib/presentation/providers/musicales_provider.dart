import 'package:flutter_riverpod/flutter_riverpod.dart';

final musicalesProvider = Provider<List<Map<String, String>>>((ref) {
  return [
    {
      "id": "hadestown",
      "titulo": "Hadestown",
      "img": "assets/images/musicales/hadestown.png",
      "anio": "2016",
      "direccion": "Rachel Chavkin",
      "composicion": "Anaïs Mitchell",
      "genero": "Folk Opera"
    },
    {
      "id": "heathers",
      "titulo": "Heathers",
      "img": "assets/images/musicales/heathers.jpg",
      "anio": "2010",
      "direccion": "Andy Fickman",
      "composicion": "Laurence O'Keefe, Kevin Murphy",
      "genero": "Rock Musical"
    },
    {
      "id": "showman",
      "titulo": "El Gran Showman",
      "img": "assets/images/musicales/greatestshowman.jpg",
      "anio": "2017",
      "direccion": "Michael Gracey",
      "composicion": "Pasek & Paul",
      "genero": "Musical Drama"
    },
    {
      "id": "jesucristo",
      "titulo": "Jesucristo Superstar",
      "img": "assets/images/musicales/jesucristo.webp",
      "anio": "1970",
      "direccion": "Tom O'Horgan",
      "composicion": "Andrew Lloyd Webber",
      "genero": "Rock Opera"
    },
    {
      "id": "woods",
      "titulo": "Into the Woods",
      "img": "assets/images/musicales/intothewoods.jpg",
      "anio": "1987",
      "direccion": "James Lapine",
      "composicion": "Stephen Sondheim",
      "genero": "Fantasy Musical"
    },
    {
      "id": "mamma",
      "titulo": "Mamma Mia",
      "img": "assets/images/musicales/mammamia.jpg",
      "anio": "1999",
      "direccion": "Phyllida Lloyd",
      "composicion": "ABBA",
      "genero": "Jukebox Musical"
    },
    {
      "id": "chicago",
      "titulo": "Chicago",
      "img": "assets/images/musicales/chicago.jpg",
      "anio": "1975",
      "direccion": "Bob Fosse",
      "composicion": "Kander & Ebb",
      "genero": "Jazz Musical"
    },
    {
      "id": "rey",
      "titulo": "El Rey León",
      "img": "assets/images/musicales/reyleon.jpg",
      "anio": "1997",
      "direccion": "Julie Taymor",
      "composicion": "Elton John, Hans Zimmer",
      "genero": "Musical Familiar"
    },
    {
      "id": "anastasia",
      "titulo": "Anastasia",
      "img": "assets/images/musicales/anastasia.jpg",
      "anio": "2016",
      "direccion": "Darko Tresnjak",
      "composicion": "Ahrens & Flaherty",
      "genero": "Romantic Musical"
    },
    {
      "id": "rubia",
      "titulo": "Una Rubia Muy Legal",
      "img": "assets/images/musicales/legallyblonde.jpg",
      "anio": "2007",
      "direccion": "Jerry Mitchell",
      "composicion": "Nell Benjamin, Laurence O'Keefe",
      "genero": "Comedy Musical"
    },
  ];
});
