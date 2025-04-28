// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// class DashboardTableWidget extends StatefulWidget {
//   const DashboardTableWidget({Key? key}) : super(key: key);

//   @override
//   _DashboardTableWidgetState createState() => _DashboardTableWidgetState();
// }

// class _DashboardTableWidgetState extends State<DashboardTableWidget> {
//   List<Employee> employees = <Employee>[];
//   late EmployeeDataSource employeeDataSource;

//   @override
//   void initState() {
//     super.initState();
//     employees = getEmployeeData();
//     employeeDataSource = EmployeeDataSource(employeeData: employees);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: SfDataGrid(
//         source: employeeDataSource,
//         columnWidthMode: ColumnWidthMode.fill,
//         columns: <GridColumn>[
//           GridColumn(
//               columnName: 'id',
//               label: Container(
//                   padding: EdgeInsets.all(16.0),
//                   alignment: Alignment.center,
//                   child: Text(
//                     'ID',
//                   ))),
//           GridColumn(
//               columnName: 'name',
//               label: Container(
//                   padding: EdgeInsets.all(8.0),
//                   alignment: Alignment.center,
//                   child: Text('Name'))),
//           GridColumn(
//               columnName: 'designation',
//               label: Container(
//                   padding: EdgeInsets.all(8.0),
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Designation',
//                     overflow: TextOverflow.ellipsis,
//                   ))),
//           GridColumn(
//               columnName: 'salary',
//               label: Container(
//                   padding: EdgeInsets.all(8.0),
//                   alignment: Alignment.center,
//                   child: Text('Salary'))),
//         ],
//       ),
//     );
//   }

//   List<Employee> getEmployeeData() {
//     return [
//       Employee(10001, 'James', 'Project Lead', 20000),
//       Employee(10002, 'Kathryn', 'Manager', 30000),
//       Employee(10003, 'Lara', 'Developer', 15000),
//       Employee(10004, 'Michael', 'Designer', 15000),
//       Employee(10005, 'Martin', 'Developer', 15000),
//       Employee(10006, 'Newberry', 'Developer', 15000),
//       Employee(10007, 'Balnc', 'Developer', 15000),
//       Employee(10008, 'Perry', 'Developer', 15000),
//       Employee(10009, 'Gable', 'Developer', 15000),
//       Employee(10010, 'Grimes', 'Developer', 15000)
//     ];
//   }
// }

// /// Custom business object class which contains properties to hold the detailed
// /// information about the employee which will be rendered in datagrid.
// class Employee {
//   /// Creates the employee class with required details.
//   Employee(this.id, this.name, this.designation, this.salary);

//   /// Id of an employee.
//   final int id;

//   /// Name of an employee.
//   final String name;

//   /// Designation of an employee.
//   final String designation;

//   /// Salary of an employee.
//   final int salary;
// }

// /// An object to set the employee collection data source to the datagrid. This
// /// is used to map the employee data to the datagrid widget.
// class EmployeeDataSource extends DataGridSource {
//   /// Creates the employee data source class with required details.
//   EmployeeDataSource({required List<Employee> employeeData}) {
//     _employeeData = employeeData
//         .map<DataGridRow>((e) => DataGridRow(cells: [
//               DataGridCell<int>(columnName: 'Work Title', value: e.id),
//               DataGridCell<String>(columnName: 'Project Name', value: e.name),
//               DataGridCell<String>(
//                   columnName: 'Time Spent', value: e.designation),
//               DataGridCell<int>(columnName: 'salary', value: e.salary),
//             ]))
//         .toList();
//   }

//   List<DataGridRow> _employeeData = [];

//   @override
//   List<DataGridRow> get rows => _employeeData;

//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((e) {
//       return Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(8.0),
//         child: Text(e.value.toString()),
//       );
//     }).toList());
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/widgets/error_screens/error_screen.dart';
import 'package:gitpulse/core/widgets/loading_widget/shimmer_helper.dart';
import 'package:gitpulse/features/dashboard/model/log_model.dart';
import 'package:gitpulse/features/dashboard/provider/logs_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardTableWidget extends StatefulHookConsumerWidget {
  const DashboardTableWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardTableWidgetState();
}

class _DashboardTableWidgetState extends ConsumerState<DashboardTableWidget> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startApiPolling();
    });
  }

  void startApiPolling() {
    // Immediately call once
    hitApi();

    // Then repeat every 5 seconds
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      hitApi();
    });
  }

  Future<void> hitApi() async {
    ref.read(logsProvider.notifier).getLogs();
  }

  @override
  void dispose() {
    _timer?.cancel(); // VERY IMPORTANT: Cancel timer when view is closed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logs = ref.watch(logsProvider);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Palette.defaultStroke,
          )),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 13),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Palette.defaultStroke,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "Description",
                  style: AppTextStyle.bodyb2Bold,
                )),
                // Expanded(child: Text("Users")),
                Expanded(
                    child: Text(
                  "Project Name",
                  style: AppTextStyle.bodyb2Bold,
                )),
                Expanded(
                    child: Text(
                  "Time Spent",
                  style: AppTextStyle.bodyb2Bold,
                )),
              ],
            ),
          ),
          Expanded(
            child: logs.when(initial: () {
              return ShimmerHelper().buildListShimmer(
                isScrollable: true,
              );
            }, progress: () {
              return ShimmerHelper().buildListShimmer(
                isScrollable: true,
              );
            }, error: (e) {
              return ErrorScreen(
                function: () {
                  ref.read(logsProvider.notifier).getLogs();
                },
              );
            }, success: (data) {
              return ListView.builder(
                itemBuilder: (context, index) =>
                    DashboardProjectLogItemWidget(log: data![index]),
                itemCount: data?.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              );
            }),
          )
        ],
      ),
    );
  }
}

class DashboardProjectLogItemWidget extends HookConsumerWidget {
  const DashboardProjectLogItemWidget({
    super.key,
    required this.log,
  });
  final LogModel log;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 13),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Palette.defaultStroke,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
              child: Text(
            log.description ?? "",
            style: AppTextStyle.bodyb2Bold,
          )),
          Expanded(child: Text("Test-repo")),
          // Expanded(
          //   child: FacePile(
          //     images: [
          //       CircleAvatar(),
          //       CircleAvatar(
          //         backgroundColor: Colors.red,
          //       ),
          //       CircleAvatar(),
          //     ],
          //     radius: 32,
          //     space: 32,
          //   ),
          // ),

          Expanded(
            child: Row(
              children: [
                Expanded(child: Text("${log.hoursLogged} hours")),
                IconButton(
                    onPressed: () {
                      ref
                          .read(logsProvider.notifier)
                          .deleteLog(uuid: log.id ?? "");
                    },
                    icon: Icon(Icons.delete)),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
