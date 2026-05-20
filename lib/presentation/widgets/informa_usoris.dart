import 'package:flu_avm/config/entities/position.dart';
import 'package:flutter/material.dart';
// import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart'; // TEMPORAL: desactivado para web
import 'package:flu_avm/config/entities/position.dart' hide Position;

class InformaUsoris extends StatelessWidget {
  final String nomen;
  final Position positio;
  final Color color;

  const InformaUsoris({
    super.key,
    required this.nomen,
    required this.positio,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      constraints: BoxConstraints(maxWidth: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nomen.isEmpty ? '_' : nomen,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: color,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: 6),

          Text(
            'Lat: ${positio.lat.toStringAsFixed(5)}',
            style: const TextStyle(color: Colors.black54),
          ),
          Text(
            'Lng: ${positio.lng.toStringAsFixed(5)}',
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  } 
}