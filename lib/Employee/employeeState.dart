import 'package:myapp/Employee/addNewEmployeePage.dart';
import 'addNewEmployeePage.dart';
import 'employee.dart';
import 'package:flutter/material.dart';
import 'restApi.dart';
class EmployeeState extends State<Employee> {
  Future<RestApi> employee;
  @override
  void initState(){
    super.initState();
    //employee =  addEmployee();
  }
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Flutter REST API'),
     ),
     body: FutureBuilder(
       future: RestApi.getEmployees(),
       builder: (context, snapshot) {
         final employees = snapshot.data;
         print(snapshot.data);
         if (snapshot.connectionState == ConnectionState.done) {
           return ListView.separated(
             separatorBuilder: (context, index) {
               return Divider(
                 height: 2,
                 color: Colors.black,
               );
             },
             itemBuilder: (context, index) {
               return ListTile(
                 title: Text(employees[index]['employee_name']),
                 subtitle: Text('Age: ${employees[index]['employee_age']}'),
               );
             },
             itemCount:10,
           );
         }
         return Center(
           child: CircularProgressIndicator(),
         );
       },
     ),
     floatingActionButton: FloatingActionButton(
       onPressed: () {
         Navigator.push(
           context,
           MaterialPageRoute(
             builder: (context) => AddNewEmployeePage()
           ),
         );
       },
       tooltip: 'Increment',
       child: Icon(Icons.add),
     ),
   );
 }
}
