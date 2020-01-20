import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'model.dart';
@JsonSerializable(explicitToJson: true)
class RestApi {
  //privK from user text field
  static Future<bool> signTransaction(body, submitTxJson) async {
    print(json.encode(body));
    print(submitTxJson);
    final baseUrl = "https://wallet-olegacy.sofodev.co/api";
    print(baseUrl);
    var headers= {
        "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE1NzkxNzAyOTUsImV4cCI6MTU3OTIxMzQ5NX0.5ifEI27t1cibHmA50g7VG7GbwC0r-Sei6Z2SZ33EFMQ",
        'Content-Type': 'application/json'
      };
    final response = await http.post('https://wallet-olegacy.sofodev.co/api/rawtx-for-cointransfer',
        body: json.encode(body),headers:headers);
       //ItemModel itemModel = ItemModel.fromJson(json.decode(response.body));
      print(response.body);
    //return itemModel;
    // String baseString =
    //     "https://wallet-olegacy.sofodev.co/api/rawtx-for-cointransfer";
    // var httpClient = new http.Client();
    // var ethClient = new Web3Client(baseString, httpClient);
    // var credentials = ethClient.credentialsFromPrivateKey(
    //     "0x8D78e52EbE72e45dA19887f62386F72602bB6656"); //Private key of user textfield.
    // if (body.senderAddress != credentials) {
    //   print("Private Key entered doesn't belongs to you");
    // }
    // else if (body.senderAddress == credentials) {
    //   await ethClient.signTransaction(
    //     credentials,
    //     Transaction(
    //       to: EthereumAddress.fromHex('0xC91...3706'),
    //       gasPrice: EtherAmount.inWei(BigInt.one),
    //       maxGas: 100000,
    //       value: EtherAmount.fromUnitAndValue(EtherUnit.ether, 1),
    //     ),
    //   );
    //}

    // final res = await http.post("", body: body);
    // var privK = "0x8D78e52EbE72e45dA19887f62386F72602bB6656";

    // if (res.statusCode == 200) {
    //   var modPrivKey = "";
    //   if (!privK.startsWith("0x")) {
    //     modPrivKey = "0x" + privK;
    //   }
    //   // generate a new key randomly
    //   var rng = new Random.secure();
    //   Credentials random = EthPrivateKey.createRandom(random)(rng);

    //   // In either way, the library can derive the public key and the address
    //   // from a private key:
    //   var address = await credentials.extractAddress();
    //   print(address.hex);
    // }
  }
}
