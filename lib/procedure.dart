import 'package:flutter/material.dart';
import 'package:flutter_idop/utils.dart';

class Procedure extends StatefulWidget {
  @override
  _ProcedureState createState() => _ProcedureState();
}

class _ProcedureState extends State<Procedure> {
  Widget appBarTitle = Container(
      margin: const EdgeInsets.only(left: 8.0),
      child: Text('Procedure'));

  Widget buildCustomListTile(String assets, String details) {
    return Container(
        padding: const EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      details,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.body1.copyWith(color: Colors.black54),
                    ))),
            new Image.asset(
              assets,
              width: 140.0,
              height: 130.0,
              fit: BoxFit.cover,
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
      ),
      body: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Utils.buildDescription(context,
              '''
The ordination ceremony (with some small variations from place to place) follows the following stages. You will have the chance to familiarize yourself with the stages in rehearsal during the week before your ordination. '''),
          Utils.buildTitle('The Circumanbulation'),
          Utils.buildDescription(context,
              '''
The circumambulation is a ceremony to pay respect to the Triple Gem. By circumanbulating the chapel, clock wise, in procession is to contemplate the great virtue of the Lord of Buddha, the Dhamma and the Sangha.'''),
          Utils.buildDescription(context,
              '''
After the ordinands have shaved their head, their beard and their eyebrows, cut their finger nails and toe nails and dress smartly, they will receive a bouquet of three lotus, candle and incenses and clasp it between their hands in a gesture of prayer.
              
They will form a line following the instruction to walk to the north side of the chapel according to ordinal number. The line will start on the right with the ordinand with the highest seniority'''),
          buildCustomListTile('images/circumambulation2.jpg',
              'Ordinand(s) who received His Majesty King Bhumibol Adulyadej’s Triple Robes will stand in the first row, 2 meters away from the second row. Then between the second and the other rows, the distance should be 1 meter apart.'),
          buildCustomListTile('images/circumambulation3.jpg',
              'While circumanbulating the ordination hall, the ordinands should meditate upon the virtues of the Triple Gem by chanting “Iitioiso”, walk calmly with their eyes looking down, keeping a pure and virtuous mind and visualize a clear bright crystal ball floating in the centre of their body.'),
          new Divider(),
        ],
      ),
    );
  }
}
