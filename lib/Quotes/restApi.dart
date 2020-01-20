import 'dart:async';
import 'model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
Future<Quote> getQuote() async {
  String url = 'https://quotes.rest/qod.json';
  final response = await http.get(url, headers: {"Accept": "application/json"});
  if(response.statusCode == 200) {
    return Quote.fromJSON(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}
