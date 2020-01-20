

// import 'package:flutter/material.dart';
// // main() => (MyApp());
// // import 'package:flutter_web_project/Login/login.dart';
// import 'package:http/http.dart';
// import 'package:web3dart/web3dart.dart';
// void main() {
//   runApp(new MaterialApp(
//     title: 'Flutter Widgets',
//     debugShowCheckedModeBanner: false,
//     theme: new ThemeData(
//       // This is the theme of your application.
//       primarySwatch: Colors.purple,
//     ),
//     // home: LoginPage(title :'Login')
//       home: EthApp(),
//   ));
// }

// class EthApp extends StatefulWidget {
//   @override
//   _EthAppState createState() => _EthAppState();
// }

// class _EthAppState extends State<EthApp> {
//   Web3Client _client;
//   final TextEditingController _addressController = TextEditingController();

//   bool _loading = false;
//   String _error;
//   String _balance;

//   @override
//   void initState() {
//     _client = Web3Client(
//         'https://mainnet.infura.io/v3/e8b3da9156fd4b4f8f8cdac7e085e1e0',
//         Client());
        
//     super.initState();
//   }

//   void _loadBalance() async {
//     setState(() {
//       _loading = true;
//       _error = null;
//       _balance = null;
//     });

//     try {
//       print(_addressController.text);
//       final addController = _addressController.text;
//       final address = EthereumAddress.fromHex(addController);
//       final ethAmount = await _client.getBalance(address);
//       print('${ethAmount.getValueInUnit(EtherUnit.wei)} Eth');
//       setState(() {
//         _balance = '${ethAmount.getValueInUnit(EtherUnit.ether)} Eth';
//       });
//     } catch (e, s) {
//       print(e);
//       print(s);

//       setState(() {
//         _error = e.toString();
//       });
//     } finally {
//       setState(() {
//         _loading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final content = <Widget>[
//       Text(
//         'Enter an address to show its balance',
//         style: Theme.of(context).textTheme.title,
//       ),
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: TextField(
//           controller: _addressController,
//           decoration: InputDecoration(
//             labelText: 'Address',
//             hintText: '',
//             prefix: Text('0x'),
//             border: OutlineInputBorder(),
//           ),
//           maxLength: 40,
//           maxLengthEnforced: true,
//           onSubmitted: (_) => _loadBalance(),
//           enabled: !_loading,
//         ),
//       ),
//     ];

//     if (_loading) {
//       content.add(CircularProgressIndicator());
//     }

//     if (_error != null) {
//       content.add(Text(_error, style: TextStyle(color: Colors.red)));
//     }

//     if (_balance != null) {
//       content.add(Text(_balance));
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Ethereum Balance'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Align(
//           alignment: Alignment.center,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: content,
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'Quotes/mainState.dart';
import 'EthermWallet/privKState.dart';
import 'Employee/employee.dart';
void main() => runApp(App());
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      //theme: kThemeData,
      home: PrivKState(),
    );
  }
}