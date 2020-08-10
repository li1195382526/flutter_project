import 'package:flutter/material.dart';
import 'compent_widget/BottomNavigationWidget.dart';
import 'package:english_words/english_words.dart';
import 'compent_widget/Browser.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter'),
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:  WebView(
            initialUrl: "https://f.epanel.cn",
            //JS执行模式 是否允许JS执行
            javascriptMode: JavascriptMode.unrestricted,
      ),
      ),
      drawer:Drawer(
        child:ListView(
          padding:EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                  accountName:Text('qqq',style:TextStyle(fontWeight:FontWeight.bold)),
                  accountEmail: Text('1195382526@qq.com'),
              )
            ]
        )
      ),
//      bottomNavigationBar:BottomNavigationWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.of(context)
                .push(new MaterialPageRoute(builder: (_) {
              return new Browser(
                url: "https://f.epanel.cn",
                title: "云调查APP",
              );
            }));
          },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
