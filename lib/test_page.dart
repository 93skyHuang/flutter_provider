

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_model.dart';


///路由器列表页面
class TestPage extends StatefulWidget {
  TestPage({Key key, this.title}) : super(key: key);
  String title;

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  @override
  Widget build(BuildContext context) {
    return NotifierProviderWidget<LoginViewModel>(
      model: LoginViewModel(loginServive: LoginServive()),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('provider'),
        ),
        body: Column(
          children: <Widget>[
            model.state == ViewState.Loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Text(model.info),
            FlatButton(
                color: Colors.tealAccent,
                onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProviderTestPage();
                      }))
                    },
                child: Text("登录")),
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
    await Future.delayed(Duration(seconds: 2));
    counter++;
    print(counter);
    notifyListeners();
  }
}

/// viewModel
class LoginViewModel extends BaseModel {
  LoginServive _loginServive;
  String info = '请登录';

  LoginViewModel({@required LoginServive loginServive})
      : _loginServive = loginServive;

  Future<String> login(String pwd) async {
    setState(ViewState.Loading);
    info = await _loginServive.login(pwd);
    setState(ViewState.Success);
  }
}

/// api
class LoginServive {
  static const String Login_path = 'xxxxxx';

  Future<String> login(String pwd) async {
    return new Future.delayed(const Duration(seconds: 1), () => "登录成功");
  }
}