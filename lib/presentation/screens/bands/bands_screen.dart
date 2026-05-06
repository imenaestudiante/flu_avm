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



  ListTile _bandTile(Band band) {
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
        print(band.nomen);
      },
    );
  }
}



addereNovumBand(BuildContext context) {
  final TextEditingController textumController = TextEditingController();

  /// Si quieres estilo iOS → CupertinoAlertDialog
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('New band name'),
      content: CupertinoTextField(
        controller: textumController,
        style: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Add'),
          onPressed: () {
            addereBandAdCollectione(context, textumController.text);
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: const Text('Close'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );

  /*  
  /// Si quieres estilo Android → AlertDialog
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('New Band Name'),
        content: TextField(controller: textumController),
        actions: [
          MaterialButton(
            onPressed: () {
              addereBandAdCollectione(context, textumController.text);
              Navigator.pop(context);
            },
            textColor: Colors.blue,
            child: Text('Add'),
          )
        ],
      );
    },
  );
  */
}

void addereBandAdCollectione(BuildContext context, String nomen) {
  print(nomen);
  Navigator.pop(context);
}
