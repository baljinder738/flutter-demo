import 'privKState.dart';
import 'package:flutter/material.dart';
import 'restApi.dart';
class PrivK extends State<PrivKState> {
 //final _employeeNameController = TextEditingController();
 final privK = TextEditingController();
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Private Key'),
     ),
     body: Center(
       child: Padding(
         padding: EdgeInsets.all(10),
         child: Column(
           children: <Widget>[
             TextField(
               controller: privK,
               decoration: InputDecoration(hintText: 'Private Key'),
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
                    //"0x8D78e52EbE72e45dA19887f62386F72602bB6656"
                    //"0x01e02a21699C2008953afEB02372Ad753fE49Cf8"
                    final body = {
                      "senderAddress": "0x8D78e52EbE72e45dA19887f62386F72602bB6656",
                      "recipientAddress": "0x549b55601cc3262b0f8177b7d1564c7c81d6b301",
                      "amount":1000
                    };
                    final submitTxJson = {
                      "otoken_to_redeem":1000,
                      "type":"FIAT"
                    };
                 RestApi.signTransaction(body,submitTxJson).then((success) {
                   if (success) {
                     showDialog(
                       builder: (context) => AlertDialog(
                         title: Text('Transaction Successful!!!'),
                        //  actions: <Widget>[
                        //    FlatButton(
                        //      onPressed: () {
                        //        Navigator.pop(context);
                        //        privK.text = '';
                        //      },
                        //      child: Text('OK'),
                        //    )
                        //  ],
                       ),
                       context: context,
                     );
                     return;
                   }else{
                     showDialog(
                       builder: (context) => AlertDialog(
                         title: Text('Error While transaction!!!'),
                        //  actions: <Widget>[
                        //    FlatButton(
                        //      onPressed: () {
                        //        Navigator.pop(context);
                        //      },
                        //      child: Text('OK'),
                        //    )
                        //  ],
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