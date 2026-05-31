import 'package:flu_avm/presentation/providers/musicales_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicalScreen extends ConsumerWidget {
  final String id;

  const MusicalScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final musicales = ref.watch(musicalesProvider);
    final musical = musicales.firstWhere((m) => m["id"] == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(musical["titulo"]!),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600), // responsive
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  musical["titulo"]!,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                // 🔥 TODAS LAS IMÁGENES MISMO TAMAÑO
                SizedBox(
                  height: 300,          // ← tamaño fijo para todas
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      musical["img"]!,
                      fit: BoxFit.contain,   // ← imagen completa sin recortes
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                _info("Año de estreno", musical["anio"]!),
                _info("Dirección", musical["direccion"]!),
                _info("Composición", musical["composicion"]!),
                _info("Género", musical["genero"]!),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _info(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold, // categorías en negrita
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
