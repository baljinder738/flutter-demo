import 'package:flutter/material.dart';
import 'restApi.dart';
import 'mainState.dart';
import 'model.dart';
class MainStatePage extends State<MainState>{
  Future<Quote> quote;
  @override
  void initState(){
    super.initState();
    quote = getQuote();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Quotes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quote of the Day'),
        ),
        body: Center(
          child: FutureBuilder<Quote>(
            future: quote, //sets the getQuote method as the expected Future
            builder: (context, snapshot) {
              if (snapshot.hasData) { //checks if the response returns valid data              
                return Center(
                  child: Column(
                    children: <Widget>[
                      Text(snapshot.data.quote), //displays the quote
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(" - ${snapshot.data.author}"), //displays the quote's author
                    ],
                  ),
                );
              } else if (snapshot.hasError) { //checks if the response throws an error
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}