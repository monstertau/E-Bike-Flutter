import 'package:eco_bike_rental/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListDockScreen extends StatefulWidget {
  @override
  _ListDockScreenState createState() => _ListDockScreenState();
}

var hearts = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.favorite, color: Colors.red[200]),
    Icon(Icons.favorite, color: Colors.red[200]),
    Icon(Icons.favorite, color: Colors.red[200]),
    Icon(Icons.favorite, color: Colors.red[200]),
    Icon(Icons.favorite, color: Colors.red[200]),
  ],
);
final additionalInfo = Container(
  padding: EdgeInsets.all(0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      hearts,
      Text(
        'Info',
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: 20,
        ),
      ),
    ],
  ),
);

final dockImage = Image.asset('../web/icons/Icon-192.png',
    width: 300, height: 150, fit: BoxFit.fill);

final descTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w800,
  fontFamily: 'Roboto',
  letterSpacing: 0.5,
  fontSize: 18,
  height: 2,
);

// var table = DataTable(
//   columns: const <DataColumn>[
//     DataColumn(
//       label: Text(
//         'Name',
//         style: TextStyle(fontStyle: FontStyle.italic),
//       ),
//     ),
//     DataColumn(
//       label: Text(
//         'Total',
//         style: TextStyle(fontStyle: FontStyle.italic),
//       ),
//     ),
//     DataColumn(
//       label: Text(
//         'Area(m2)',
//         style: TextStyle(fontStyle: FontStyle.italic),
//       ),
//     ),
//     DataColumn(
//       label: Text(
//         'Time',
//         style: TextStyle(fontStyle: FontStyle.italic),
//       ),
//     ),
//     DataColumn(
//       label: Text(
//         'Distance',
//         style: TextStyle(fontStyle: FontStyle.italic),
//       ),
//     ),
//   ],
//   rows: const <DataRow>[
//     DataRow(
//       cells: <DataCell>[
//         DataCell(Text('Sarah')),
//         DataCell(Text('19')),
//         DataCell(Text('Student')),
//       ],
//     ),
//     DataRow(
//       cells: <DataCell>[
//         DataCell(Text('Janine')),
//         DataCell(Text('43')),
//         DataCell(Text('Professor')),
//       ],
//     ),
//     DataRow(
//       cells: <DataCell>[
//         DataCell(Text('William')),
//         DataCell(Text('27')),
//         DataCell(Text('Associate Professor')),
//       ],
//     ),
//   ],
// );

class DTS extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text("#cel1$index")),
      DataCell(Text("#cel2$index")),
      DataCell(Text("#cel3$index")),
      DataCell(Text("#cel4$index")),
    ]);
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 20;

  @override
  int get selectedRowCount => 0;
}
class IPageinatedTable extends StatefulWidget {
  @override
  _IPaginatedTableState createState() => _IPaginatedTableState();
}

class _IPaginatedTableState extends State<IPageinatedTable> {
  var dts = DTS();
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
          header: Text("List Docks"),
          columns: [
            DataColumn(label: Text("col#1")),
            DataColumn(label: Text("col#1")),
            DataColumn(label: Text("col#1")),
            DataColumn(label: Text("col#1")),
          ],
          source: dts,
          rowsPerPage: _rowPerPage,
        );
  }
}

var paginatedDataTable = new IPageinatedTable();

final leftColumn = Container(
  padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
  child: Column(
    children: [
      additionalInfo,
      paginatedDataTable
    ],
  ),
);

class _ListDockScreenState extends State<ListDockScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: complete design screen
    return Scaffold(
        appBar: AppBar(
          title: Text("List Dock Screen"),
        ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),

          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 400,
                  child: leftColumn,
                ),

              ],
            ),
          ),
        ),
      ),
        // body: Center(
        //
        //   child: RaisedButton(
        //     onPressed: () {
        //       // push navigator to navigate to page
        //       // argument = id of dock
        //       Navigator.pushNamed(context, detailedDockRoute, arguments: 1);
        //     },
        //
        //     child: Text("Detail dock screen"),
        //   ),
        // body: Column(
        //   children: <Widget>[
        //     Text('Deliver features faster'),
        //     Text('Craft beautiful UIs'),
        //     Expanded(
        //       child: FittedBox(
        //          // otherwise the logo will be tiny
        //         child: const FlutterLogo(),
        //       ),
        //     ),
        //   ],
        // )
    );
  }
}
