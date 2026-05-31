import 'dart:math';
import 'package:flutter/material.dart';

class MinijuegoScreen extends StatefulWidget {
  const MinijuegoScreen({super.key});

  @override
  State<MinijuegoScreen> createState() => _MinijuegoScreenState();
}

class _MinijuegoScreenState extends State<MinijuegoScreen> {
  final Random _random = Random();

  final List<_ObjetoBosque> _objetos = [
    _ObjetoBosque(
      id: 'capa',
      nombre: 'la capa roja',
      asset: 'assets/images/minijuego/capa.png',
    ),
    _ObjetoBosque(
      id: 'habas',
      nombre: 'la habichuela mágica',
      asset: 'assets/images/minijuego/habas.png',
    ),
    _ObjetoBosque(
      id: 'zapato',
      nombre: 'el zapato de cristal',
      asset: 'assets/images/minijuego/zapato.png',
    ),
  ];

  late _ObjetoBosque _objetivo;
  String? _mensaje;
  bool _acertado = false;
  late List<Offset> _posiciones;

  @override
  void initState() {
    super.initState();
    _reiniciarJuego();
  }

  void _generarPosiciones(double width, double height, double size) {
    final double minY = height * 0.40;
    final double maxY = height * 0.75;

    final List<Offset> posiciones = [];

    while (posiciones.length < 3) {
      final x = width * (0.10 + _random.nextDouble() * 0.70);
      final y = minY + _random.nextDouble() * (maxY - minY);

      final nueva = Offset(x, y);

      bool solapa = false;

      for (final p in posiciones) {
        if ((p - nueva).distance < size * 1.3) {
          solapa = true;
          break;
        }
      }

      if (!solapa) posiciones.add(nueva);
    }

    _posiciones = posiciones;
  }

  void _reiniciarJuego() {
    _objetivo = _objetos[_random.nextInt(_objetos.length)];
    _mensaje = null;
    _acertado = false;
    setState(() {});
  }

  void _onObjetoPulsado(_ObjetoBosque objeto) {
    if (_acertado) return;

    if (objeto.id == _objetivo.id) {
      setState(() {
        _acertado = true;
        _mensaje = '¡Has encontrado ${_objetivo.nombre}!';
      });
    } else {
      setState(() {
        _mensaje = 'Ese no era... prueba otra vez.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Into the Woods'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          final double objectSize = width * 0.12;

          _generarPosiciones(width, height, objectSize);

          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/minijuego/bosque_fondo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Stack(
                  children: [
                    _posicionarObjeto(_objetos[0], _posiciones[0], objectSize),
                    _posicionarObjeto(_objetos[1], _posiciones[1], objectSize),
                    _posicionarObjeto(_objetos[2], _posiciones[2], objectSize),
                  ],
                ),
              ),
              Positioned.fill(
                child: IgnorePointer(
                  child: Image.asset(
                    'assets/images/minijuego/bosque_capa.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        'Encuentra ${_objetivo.nombre}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 6,
                            )
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      if (_mensaje != null)
                        Text(
                          _mensaje!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: _acertado ? FontWeight.bold : FontWeight.normal,
                            color: _acertado ? Colors.greenAccent : Colors.amberAccent,
                            shadows: const [
                              Shadow(color: Colors.black, blurRadius: 6),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      const Spacer(),
                      if (_acertado)
                        ElevatedButton(
                          onPressed: _reiniciarJuego,
                          child: const Text('Jugar de nuevo'),
                        ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _posicionarObjeto(_ObjetoBosque objeto, Offset pos, double size) {
    return Positioned(
      left: pos.dx,
      top: pos.dy,
      child: GestureDetector(
        onTap: () => _onObjetoPulsado(objeto),
        child: Image.asset(
          objeto.asset,
          width: size,
          height: size,
        ),
      ),
    );
  }
}

class _ObjetoBosque {
  final String id;
  final String nombre;
  final String asset;

  const _ObjetoBosque({
    required this.id,
    required this.nombre,
    required this.asset,
  });
}
