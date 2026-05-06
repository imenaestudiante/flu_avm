import 'package:flu_avm/Config/config.dart';
import 'package:flutter/cupertino.dart';
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
        itemBuilder: (context, i) => _bandTile(bands[i]),
      ),

      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: () => addereNovumBand(context),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.endToStart,

      // ← ÚNICO background permitido
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Delete Band',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),

      onDismissed: (DismissDirection direction) {
        print('Direction: $direction');
        print('id: ${band.id}');
      },

      child: ListTile(
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
          print(band.nomen);
        },
      ),
    );
  }

  void addereNovumBand(BuildContext context) {}
}

void addereBandAdCollectione(BuildContext context, String nomen) {
  print(nomen);
  Navigator.pop(context);
}
