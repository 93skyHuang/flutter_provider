import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/main.dart';
import 'package:flutter_provider/test_page.dart';
import 'package:provider/provider.dart';

///路由器列表页面
class TestPage3 extends StatefulWidget {
  TestPage3({Key key, this.title}) : super(key: key);
  String title;

  @override
  _TestPage3State createState() => _TestPage3State();
}

class _TestPage3State extends State<TestPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('页面3'),
      ),
      body: Column(
        children: <Widget>[
          Consumer<Counter>(
            child: Text('Consumer'),
            builder: (context, model, child) {
              return FlatButton(
                  color: Colors.tealAccent,
                  onPressed: () {
                    model.increment();
                  },
                  child: Text("增加${model.count}"));
            },
          ),
        ],
      ),
    );
  }
}
