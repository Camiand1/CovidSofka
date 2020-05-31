import 'dart:convert';

import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:proyectocovid/models/SummaryResponse.dart';
import 'package:http/http.dart' as http;

class LocalInfoPage extends StatefulWidget {
  @override
  _LocalInfoPageState createState() => _LocalInfoPageState();
}

class _LocalInfoPageState extends State<LocalInfoPage> {
  Future<SummaryResponse> summaryResponse;

  @override
  void initState() {
    super.initState();
    summaryResponse = getSummaryData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 8.0).copyWith(top: 8.0),
          child: Card(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0)
                      .copyWith(top: 8.0),
                  child: Image.asset('assets/logo_sofka.png'),
                ),
                RichText(
                  text: TextSpan(
                    text: '"',
                    style: TextStyle(
                      color: Colors.orange[800],
                      fontSize: 30.0,
                    ),
                    children: [
                      TextSpan(
                        text: 'MeQuedoEnCasa',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 8.0).copyWith(top: 8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: <Widget>[
                  Text('Covid-19 en Colombia'),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CircleAvatar(
                      radius: 50.0,
                      child: ClipOval(
                        child: Flag(
                          'CO',
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: _InfoWidgets(
                          title: 'Confirmados totales',
                          data: '4356',
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                        child: _InfoWidgets(
                          title: 'Bajas totales',
                          data: '4356',
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: _InfoWidgets(
                          title: 'Recuperados totales',
                          data: '4356',
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<SummaryResponse> getSummaryData() async {
    final response = await http.get('https://api.covid19api.com/summary');
    if (response.statusCode == 200) {
      var summaryResponse =
          SummaryResponse.fromJson(json.decode(response.body));
      print(summaryResponse.global.totalDeaths);
      return summaryResponse;
    } else {
      throw Exception('Falló al cargar la data');
    }
  }
}

class _InfoWidgets extends StatelessWidget {
  final String title;
  final String data;
  final Color color;

  _InfoWidgets({this.title, this.data, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.center,
        ),
        Text(
          data,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
