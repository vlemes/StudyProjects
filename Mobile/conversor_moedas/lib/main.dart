import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?format=json&key=b7188dee";

void main() async {

  http.Response response = await http.get(request);
  print(json.decode(response.body));

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(),
      body: Container(
        child: RaisedButton(
          onPressed: (){
            print(json.decode(response.body));
          },
        ),
      ),
    )
  ));
}