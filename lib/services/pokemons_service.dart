import 'package:dio/dio.dart';
import 'package:flu_avm/config/entities/pokemon.dart';
import 'package:flu_avm/mappers/pokemon_mapper.dart';

class PokemonService {

  static Future<(Pokemon?, String)> getPokemon(String pokemonId) async {

    final dio = Dio();

    try {

      // IMPORTANTE: quitar el espacio antes de la URL
      final responsio = await dio.get(
        'https://pokeapi.co/api/v2/pokemon/$pokemonId'
      );

      final pokemon = PokemonMapper.pokeApiPokemonToEntity(responsio.data);

      return (pokemon, 'Data obtenida correctamente');

    } catch (e) {
      return (null, 'No se pudo obtener el Pokemon');
    }
  }
}
