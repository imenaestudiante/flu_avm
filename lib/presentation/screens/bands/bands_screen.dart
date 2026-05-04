import 'package:flu_avm/Config/config.dart';
import 'package:flutter/material.dart';

class BandsScreen extends StatelessWidget {
  const BandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bandas'),
      ),

      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) {
          return _bandTile(i);
        },
      ),
    );
  }

  ListTile _bandTile(int i) {
    final band = bands[i];

    return ListTile(
      leading: CircleAvatar(
        child: Text(
          band.nomen.substring(0, 2).toUpperCase(),
        ),
      ),
      title: Text(band.nomen),
      trailing: Text(
        '${band.numerusVotum}',
        style: TextStyle(fontSize: 20),
      ),
      onTap: () {
        debugPrint(band.nomen); // ← corrección mínima del warning
      },
    );
  }
}
