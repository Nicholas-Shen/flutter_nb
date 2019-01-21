import 'package:flutter/material.dart';
import 'package:flutter_nb/constants/constants.dart';
import 'package:flutter_nb/ui/page/login_page.dart';
import 'package:flutter_nb/utils/sp_util.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.blue[300],
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'FlutterDemo'),
        routes: {
          '/LoginPage': (ctx) => LoginPage(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _MyCounter() {
    setState(() {
      _counter = _counter * 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '点击的次数：',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            SizedBox(height: 30.0),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue[300],
              shape: new StadiumBorder(
                  side: new BorderSide(
                style: BorderStyle.solid,
                color: Colors.blue,
              )),
              child: Text('退出登录'),
              onPressed: () {
                SPUtil.putBool(Constants.KEY_LOGIN, false);
                Navigator.of(context).pushReplacementNamed('/LoginPage');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '看什么看',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
