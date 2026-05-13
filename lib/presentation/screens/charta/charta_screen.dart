import 'package:flu_avm/presentation/widgets/complere_form.dart';
import 'package:flutter/material.dart';

class ChartaScreen extends StatefulWidget {
  const ChartaScreen({super.key});

  @override
  State<ChartaScreen> createState() => _ChartaScreenState();
}

class _ChartaScreenState extends State<ChartaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapas'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          ColoredBox(
            color: Colors.blueGrey,
            child: const Center(
              child: Text(
                'Mapa a pantalla completa',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),

          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(12),   // ← CORREGIDO
              child: const ComplereForm(),         // ← CORREGIDO (const opcional)
            ),
          ),

        ],
      ),
    );
  }
}
