import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter HTTP',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Networking'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}

Future<http.Response> getData() async {
  const url = 'https://api.coindesk.com/v1/bpi/currentprice.json';
  return await http.get(
    Uri.parse(url),
    // headers: {
    //   "Access-Control-Allow-Origin": 'true',
    // },
  );
  // ответ с типом Response в виде объекта Future
  // метод синхронный, добавляю await - асинхронный
}

void loadData() {
  getData().then((response) {
    // обрабатываю полученные данные с сервера
    // для этого проверяю response на статус кода
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }).catchError((error) {
    debugPrint(error.toString());
  }); // обрабатываю общую ошибку вызываю метод catchError(onError)
}
