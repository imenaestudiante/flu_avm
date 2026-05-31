import 'package:flu_avm/presentation/providers/musicales_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MusicalesScreen extends StatelessWidget {
  const MusicalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MusicalesVisum(),
    );
  }
}

class MusicalesVisum extends ConsumerWidget {
  const MusicalesVisum({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final musicales = ref.watch(musicalesProvider);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Musicales'),
          floating: true,
          centerTitle: true,
        ),

        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,         
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.60,     
            ),
            itemCount: musicales.length,
            itemBuilder: (context, index) {
              final musical = musicales[index];

              return GestureDetector(
                onTap: () => context.push('/musical/${musical["id"]}'),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 3 / 4,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.asset(
                            musical["img"]!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        musical["titulo"]!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
