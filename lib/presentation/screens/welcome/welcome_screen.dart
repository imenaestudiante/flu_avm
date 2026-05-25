import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flu_avm/presentation/providers/modus_provider.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bool estTenebrisModus = ref.watch(estTenebrisModusProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

             
              Row(
                children: [

                  // Icono izquierdo
                  const Icon(
                    Icons.data_object_rounded,
                    size: 32,
                  ),

                  const SizedBox(width: 12),

                  // Texto Flu Avm
                  const Text(
                    'Flu Avm',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Spacer(),

                  // Botón modo día/noche
                  IconButton(
                    onPressed: () {
                      ref
                        .read(estTenebrisModusProvider.notifier)
                        .update((state) => !estTenebrisModus);
                    },
                    icon: Icon(
                      estTenebrisModus
                        ? Icons.dark_mode_outlined   
                        : Icons.light_mode_outlined, 
                      size: 30,
                    ),
                  ),
                ],
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}
