import 'package:flutter/material.dart';
import 'dart:math';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int rondaActual = 0;
  int puntuacionRonda = 0;
  int puntuacionTotal = 0;

  late List<List<Pregunta>> rondas;

  @override
  void initState() {
    super.initState();
    rondas = _crearRondas();
  }

  List<List<Pregunta>> _crearRondas() {
    final random = Random();

    List<List<Pregunta>> data = [
      [
        Pregunta(
          texto: '¿Qué desean conseguir los panaderos en Into the Woods?',
          opciones: [
            Opcion('Romper una maldición', true),
            Opcion('Encontrar a su hijo perdido', false),
            Opcion('Convertirse en reyes', false),
          ],
        ),
        Pregunta(
          texto: '¿Qué necesita Dorothy para volver a casa?',
          opciones: [
            Opcion('Los zapatos rubí', true),
            Opcion('El libro de hechizos', false),
            Opcion('La llave dorada', false),
          ],
        ),
        Pregunta(
          texto: '¿Por qué persigue Javert a Valjean?',
          opciones: [
            Opcion('Por robar pan', true),
            Opcion('Por desertar del ejército', false),
            Opcion('Por falsificar documentos', false),
          ],
        ),
      ],
      [
        Pregunta(
          texto: '¿Qué exige el Fantasma al teatro?',
          opciones: [
            Opcion('Que Christine sea protagonista', true),
            Opcion('Que cierren la ópera', false),
            Opcion('Que cambien al director', false),
          ],
        ),
        Pregunta(
          texto: '¿Por qué rechazan a Elphaba en Wicked?',
          opciones: [
            Opcion('Por su piel verde', true),
            Opcion('Por su magia inestable', false),
            Opcion('Por ser pobre', false),
          ],
        ),
        Pregunta(
          texto: '¿Qué busca Annie durante la historia?',
          opciones: [
            Opcion('Encontrar a sus padres', true),
            Opcion('Convertirse en actriz', false),
            Opcion('Recuperar su perro', false),
          ],
        ),
      ],
      [
        Pregunta(
          texto: '¿Qué impulsa a Hamilton durante toda la obra?',
          opciones: [
            Opcion('Dejar un legado', true),
            Opcion('Ser presidente', false),
            Opcion('Vengarse de Burr', false),
          ],
        ),
        Pregunta(
          texto: '¿Qué habilidad especial tiene Matilda?',
          opciones: [
            Opcion('Telequinesis', true),
            Opcion('Hablar con animales', false),
            Opcion('Viajar en el tiempo', false),
          ],
        ),
        Pregunta(
          texto: '¿Qué descubre Billy Elliot que quiere hacer?',
          opciones: [
            Opcion('Bailar ballet', true),
            Opcion('Ser boxeador', false),
            Opcion('Ser actor', false),
          ],
        ),
      ],
    ];

    for (var ronda in data) {
      for (var pregunta in ronda) {
        pregunta.opciones.shuffle(random);
      }
    }

    return data;
  }

  void seleccionarOpcion(Pregunta pregunta, Opcion opcion) {
    if (pregunta.respondida) return;

    setState(() {
      pregunta.respondida = true;
      opcion.seleccionada = true;

      if (opcion.esCorrecta) puntuacionRonda++;
    });
  }

  bool rondaCompletada() {
    return rondas[rondaActual].every((p) => p.respondida);
  }

  void siguienteRonda() {
    puntuacionTotal += puntuacionRonda;

    if (rondaActual < 2) {
      setState(() {
        rondaActual++;
        puntuacionRonda = 0;
      });
    } else {
      _mostrarPantallaFinal();
    }
  }

  void _mostrarPantallaFinal() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple.shade300, Colors.deepPurple.shade700],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.emoji_events, size: 70, color: Colors.amber),
              const SizedBox(height: 20),
              const Text(
                '¡Quiz completado!',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                'Tu puntuación total es:',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                '$puntuacionTotal / 9',
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.amber),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text('Volver al menú'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ronda = rondas[rondaActual];

    return Scaffold(
      appBar: AppBar(
        title: Text('Ronda ${rondaActual + 1}'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...ronda.map((pregunta) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.85,
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      pregunta.texto,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),

                    ...pregunta.opciones.map((opcion) {
                      Color color = Colors.grey.shade200;

                      if (pregunta.respondida) {
                        if (opcion.esCorrecta) {
                          color = Colors.green.shade300;
                        } else {
                          color = Colors.red.shade300;
                        }
                      }

                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: color,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () => seleccionarOpcion(pregunta, opcion),
                            child: Text(opcion.texto, textAlign: TextAlign.center),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              );
            }),

            if (rondaCompletada())
              ElevatedButton(
                onPressed: siguienteRonda,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  rondaActual == 2 ? 'Ver puntuación final' : 'Siguiente ronda',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Pregunta {
  final String texto;
  final List<Opcion> opciones;
  bool respondida = false;

  Pregunta({
    required this.texto,
    required this.opciones,
  });
}

class Opcion {
  final String texto;
  final bool esCorrecta;
  bool seleccionada = false;

  Opcion(this.texto, this.esCorrecta);
}
