import 'addNewEmployeePage.dart';
import 'package:flutter/material.dart';
import 'restApi.dart';
class AddNewEmployeePageState extends State<AddNewEmployeePage> {
 final _employeeNameController = TextEditingController();
 final _employeeAge = TextEditingController();
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('New Employee'),
     ),
     body: Center(
       child: Padding(
         padding: EdgeInsets.all(10),
         child: Column(
           children: <Widget>[
             TextField(
               controller: _employeeNameController,
               decoration: InputDecoration(hintText: 'Employee Name'),
             ),
             TextField(
               controller: _employeeAge,
               decoration: InputDecoration(hintText: 'Employee Age'),
               keyboardType: TextInputType.number,
             ),
             RaisedButton(
               child: Text(
                 'SAVE',
                 style: TextStyle(
                   color: Colors.white,
                 ),
               ),
               color: Colors.purple,
               onPressed: () {
                 final body = {
                   "name": _employeeNameController.text,
                   "age": _employeeAge.text,
                 };
                 RestApi.addEmployee(body).then((success) {
                   if (success) {
                     showDialog(
                       builder: (context) => AlertDialog(
                         title: Text('Employee has been added!!!'),
                         actions: <Widget>[
                           FlatButton(
                             onPressed: () {
                               Navigator.pop(context);
                               _employeeNameController.text = '';
                               _employeeAge.text = '';
                             },
                             child: Text('OK'),
                           )
                         ],
                       ),
                       context: context,
                     );
                     return;
                   }else{
                     showDialog(
                       builder: (context) => AlertDialog(
                         title: Text('Error Adding Employee!!!'),
                         actions: <Widget>[
                           FlatButton(
                             onPressed: () {
                               Navigator.pop(context);
                             },
                             child: Text('OK'),
                           )
                         ],
                       ),
                       context: context,
                     );
                     return;
                   }
                 });
               },
             )
           ],
         ),
       ),
     ),
   );
 }
}