import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/test_page2.dart';
import 'package:flutter_provider/test_page3.dart';
import 'package:provider/provider.dart';

import 'base_model.dart';
import 'main.dart';

///路由器列表页面
class TestPage extends StatefulWidget {
  TestPage({Key key, this.title}) : super(key: key);
  String title;

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('登录$index'),
        ),
        body: Column(
          children: <Widget>[
            Builder(
              builder: (context) {
                return Text('计数${context.watch<MyModel>().counter}');
              },
            ),
            Builder(
              builder: (context) {
                return Text('index$index');
              },
            ),
            Consumer<MyModel>(
              child: Text('Consumer'),
              builder: (context, model, child) {
                return FlatButton(
                    color: Colors.tealAccent,
                    onPressed: () {
                      index++;
                      model.incrementCounter();
                    },
                    child: Text("增加"));
              },
            ),
            FlatButton(
                color: Colors.tealAccent,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TestPage3();
                  }));
                },
                child: Text("页面跳转"))
          ],
        ),
      ),
    );
  }
}

class MyModel with ChangeNotifier {
  MyModel({this.counter = 0});

  int counter = 0;

  Future<void> incrementCounter() async {
    await Future.delayed(Duration(seconds: 1));
    counter++;
    print(counter);
    notifyListeners();
  }
}
