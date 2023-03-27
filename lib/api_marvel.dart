import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'marvel_ hero.dart';

class ApiMarvel {
  final String publicKey = "73056fb3d23d6068287b1144f93744e6";
  final String privateKey = "252ef135eb45a6d74c980d365e3c5f2f0cebbdf2";

  Future<List<int>> getHeroesId() async {
    String url = "https://gateway.marvel.com:443/v1/public/characters?";
    List<int> heroesId = [];
    var ts = 1;

    try {
      Response response = await Dio().request(url, queryParameters: {
        'ts': ts,
        'apikey': publicKey,
        'hash': md5
            .convert(utf8.encode(ts.toString() + privateKey + publicKey))
            .toString()
      });

      for (var element in response.data["data"]["results"]) {
        heroesId.add(element["id"]);
      }

      return heroesId;
    } catch (error) {
      throw Exception("Ошибка при попытке получить id героев");
    }
  }

  Future<MarvelHero> getHeroInfo(int id) async {
    String characterUrl =
        "https://gateway.marvel.com:443/v1/public/characters/$id";
    var ts = 1;

    try {
      Response response = await Dio().request(characterUrl, queryParameters: {
        'ts': ts,
        'apikey': publicKey,
        'hash': md5
            .convert(utf8.encode(ts.toString() + privateKey + publicKey))
            .toString()
      });

      return MarvelHero.fromJson(response.data["data"]["results"][0]);
    } catch (error) {
      throw Exception(
          "Ошибка при попытке получить информацию о герое c id: $id");
    }
  }
}
