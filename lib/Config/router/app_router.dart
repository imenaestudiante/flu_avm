import 'package:flu_avm/presentation/screens/bands/bands_screen.dart';
import 'package:flu_avm/presentation/screens/charta/charta_screen.dart';
import 'package:flu_avm/presentation/screens/home/domus_screen.dart';
import 'package:flu_avm/presentation/screens/numerator/numerator_screen.dart';
import 'package:flu_avm/presentation/screens/pokemons/pokemons_screen.dart';
import 'package:flu_avm/presentation/screens/pokemons/pokemon_screen.dart';
import 'package:flu_avm/presentation/screens/welcome/welcome_screen.dart';
import 'package:flu_avm/presentation/screens/musicales/musicales_screen.dart';
import 'package:flu_avm/presentation/screens/musicales/musical_screen.dart';
import 'package:flu_avm/presentation/screens/minijuego/minijuego_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeScreen(),
    ),

    GoRoute(
      path: '/home',
      builder: (context, state) => const DomusScreen(),
    ),

    GoRoute(
      path: '/numerator-river',
      builder: (context, state) => const NumeratorScreen(),
    ),

    GoRoute(
      path: '/bands',
      builder: (context, state) => const BandsScreen(),
    ),

    GoRoute(
      path: '/charta',
      builder: (context, state) => const ChartaScreen(),
    ),

    GoRoute(
      path: '/request',
      builder: (context, state) => const PokemonsScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '1';
            return PokemonScreen(pokemonId: id);
          },
        ),
      ],
    ),

    GoRoute(
      path: '/musicales',
      builder: (context, state) => const MusicalesScreen(),
    ),

    GoRoute(
      path: '/musical/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return MusicalScreen(id: id);
      },
    ),

    // ⭐ NUEVA RUTA DEL MINIJUEGO
    GoRoute(
      path: '/minijuego',
      builder: (context, state) => const MinijuegoScreen(),
    ),
  ],
);
