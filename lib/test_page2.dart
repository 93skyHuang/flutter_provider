import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/test_page.dart';
import 'package:provider/provider.dart';

import 'main.dart';

///路由器列表页面
class TestPage2 extends StatefulWidget {
  TestPage2({Key key, this.title}) : super(key: key);
  String title;

  @override
  _TestPage2State createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一个页面$index'),
      ),
      body: Column(
        children: <Widget>[
          Text('---${context.watch<Counter>().count}'),
          FlatButton(
              color: Colors.tealAccent,
              onPressed: () {
                index = index++;
                context.read<Counter>().increment();
              },
              child: Text("增加$index")),
          Text('=====${context.watch<MyApplicationModel>().counter}'),
          FlatButton(
              color: Colors.tealAccent,
              onPressed: () {
                context.read<MyApplicationModel>().incrementCounter();
              },
              child: Text("增加2")),
          FlatButton(
              color: Colors.tealAccent,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TestPage();
                }));
              },
              child: Text("测试页面1")),
        ],
      ),
    );
  }
}

class MyApplicationModel with ChangeNotifier {
  MyApplicationModel({this.counter = 0});

  int counter = 0;

  Future<void> incrementCounter() async {
    await Future.delayed(Duration(seconds: 1));
    counter++;
    print(counter);
    notifyListeners();
  }
}
