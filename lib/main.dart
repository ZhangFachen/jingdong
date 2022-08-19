import 'package:flutter/material.dart';
import 'package:myjingdong/routes/routes.dart';

void main() => runApp(const MyApp());


//自定义有状态组件
class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Tabs(),
        initialRoute: '/',
        onGenerateRoute:onGenerateRoute,
    );
  }
}


