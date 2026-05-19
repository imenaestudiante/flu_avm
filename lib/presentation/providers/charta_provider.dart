import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

final formNomenProvider = StateProvider((ref) => '');
//final formColorProvider = StateProvider((ref) => const Color.fromARGB(255, 32, 172, 137));

final formColorProvider = StateProvider<Color>((ref)=> Colors.red);
final markerPositumProvider = StateProvider<bool>((ref)=> false);