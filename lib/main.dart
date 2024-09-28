import 'dart:convert';
// 303236
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(TableApp());
}

/// The application that contains datagrid on it.
class TableApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syncfusion DataGrid Demo',
      theme: ThemeData(useMaterial3: false),
      home: Tables(),
    );
  }
}


GridColumn Sus(Function onPressed) {
  return GridColumn(
      columnName: 'title_kor',
      label: TextButton.icon(
        label: const Text("한글상표"),
        icon: const Icon(Icons.arrow_downward, size: 16.0),
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          // backgroundColor: MaterialStall(const Color(0xFF202022)),
          foregroundColor: WidgetStateProperty.all(Colors.white),
        ),
        onPressed: () {
          onPressed();
        },
      ));
}

/// The home page of the application which hosts the datagrid.
class Tables extends StatefulWidget {
  /// Creates the home page.
  Tables({Key? key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Tables> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = [
      Employee(
          '한글상표1', '영문상표1', 'public_number1', '2022-01-01', 'agent1', '상태1'),
      Employee(
          '한글상표2', '영문상표2', 'public_number2', '2022-01-02', 'agent2', '상태2'),
    ];
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    getEmployeeData("apple");
    return Scaffold(
      backgroundColor: Color(0x0E0F11),
      body: SfDataGridTheme(
        data: SfDataGridThemeData(
            gridLineColor: Color(0xFF43464C), gridLineStrokeWidth: 1.5),
        child: SfDataGrid(
          columnWidthMode: ColumnWidthMode.fill,
          source: employeeDataSource,
          gridLinesVisibility: GridLinesVisibility.both,
          headerGridLinesVisibility: GridLinesVisibility.both,
          columns: [
            GridColumn(
                columnName: 'title_kor',
                label: TextButton.icon(
                  label: Text("한글상표"),
                  icon: Icon(Icons.arrow_downward, size: 16.0),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF202022)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      var before = employees[0].titleKor;
                      employees
                          .sort((a, b) => a.titleKor.compareTo(b.titleKor));
                      var after = employees[0].titleKor;
                      if (before == after) {
                        employees = employees.reversed.toList();
                      }
                      employeeDataSource =
                          EmployeeDataSource(employeeData: employees);
                    });
                  },
                )),
            GridColumn(
                columnName: 'title_eng',
                label: TextButton.icon(
                  label: Text("영문상표"),
                  icon: Icon(Icons.arrow_downward, size: 16.0),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF202022)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      var before = employees[0].titleEng;
                      employees
                          .sort((a, b) => a.titleEng.compareTo(b.titleEng));
                      var after = employees[0].titleEng;
                      if (before == after) {
                        employees = employees.reversed.toList();
                      }
                      employeeDataSource =
                          EmployeeDataSource(employeeData: employees);
                    });
                  },
                )),
            GridColumn(
                columnName: 'public_number',
                label: TextButton.icon(
                  label: Text("출원번호"),
                  icon: Icon(Icons.arrow_downward, size: 16.0),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF202022)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      var before = employees[0].publicNumber;
                      employees.sort(
                          (a, b) => a.publicNumber.compareTo(b.publicNumber));
                      var after = employees[0].publicNumber;
                      if (before == after) {
                        employees = employees.reversed.toList();
                      }
                      employeeDataSource =
                          EmployeeDataSource(employeeData: employees);
                    });
                  },
                )),
            GridColumn(
                columnName: 'registration_public_date',
                label: TextButton.icon(
                  label: Text("출원일자"),
                  icon: Icon(Icons.arrow_downward, size: 16.0),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF202022)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      var before = employees[0].registrationPublicDate;
                      employees.sort((a, b) => a.registrationPublicDate
                          .compareTo(b.registrationPublicDate));
                      var after = employees[0].registrationPublicDate;
                      if (before == after) {
                        employees = employees.reversed.toList();
                      }
                      employeeDataSource =
                          EmployeeDataSource(employeeData: employees);
                    });
                  },
                )),
            GridColumn(
                columnName: 'agent_name',
                label: TextButton.icon(
                  label: Text("출원인"),
                  icon: Icon(Icons.arrow_downward, size: 16.0),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF202022)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      var before = employees[0].agentName;
                      employees
                          .sort((a, b) => a.agentName.compareTo(b.agentName));
                      var after = employees[0].agentName;
                      if (before == after) {
                        employees = employees.reversed.toList();
                      }
                      employeeDataSource =
                          EmployeeDataSource(employeeData: employees);
                    });
                  },
                )),
            GridColumn(
                columnName: 'application_status',
                label: TextButton.icon(
                  label: Text("상태"),
                  icon: Icon(Icons.arrow_downward, size: 16.0),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF202022)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      var before = employees[0].applicationStatus;
                      employees.sort((a, b) =>
                          a.applicationStatus.compareTo(b.applicationStatus));
                      var after = employees[0].applicationStatus;
                      if (before == after) {
                        employees = employees.reversed.toList();
                      }
                      employeeDataSource =
                          EmployeeDataSource(employeeData: employees);
                    });
                  },
                )),
          ],
        ),
      ),
    );
  }

  void getEmployeeData(String q) async {
    http.get(Uri.parse('https://mezmezmez.5-23.dev?q=apple')).then((response) {
      setState(() {
        List<dynamic> data = json.decode(response.body);
        employees = data
            .map((item) => Employee(
                  item['title'][1],
                  item['title'][0],
                  item['public_number'],
                  item['registration_public_date'],
                  item['agent_name'],
                  item['application_status'],
                ))
            .toList();
      });
    });
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.titleKor, this.titleEng, this.publicNumber,
      this.registrationPublicDate, this.agentName, this.applicationStatus);

  final String titleKor;
  final String titleEng;
  final String publicNumber;
  final String registrationPublicDate;
  final String agentName;
  final String applicationStatus;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'title_kor', value: e.titleKor),
              DataGridCell<String>(columnName: 'title_eng', value: e.titleEng),
              DataGridCell<String>(
                  columnName: 'public_number', value: e.publicNumber),
              DataGridCell<String>(
                  columnName: 'registration_public_date',
                  value: e.registrationPublicDate),
              DataGridCell<String>(
                  columnName: 'agent_name', value: e.agentName),
              DataGridCell<String>(
                  columnName: 'application_status', value: e.applicationStatus),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          e.value.toString(),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }).toList());
  }
}
