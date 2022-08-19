import 'dart:math';

import 'package:flutter/material.dart';


//购物车

class ShoppingCartPage extends StatefulWidget {
  ShoppingCartPage({ Key? key }) : super(key: key);
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {


  List<Widget> _widgetList = [
    Container(
      width: 300,
      height: 300,
      color: Colors.red,
    ),
    Container(
      width: 250,
      height: 250,
      color: Colors.green,
    ),
    Container(
      width: 200,
      height: 200,
      color: Colors.indigo,
    ),
    Container(
      width: 150,
      height: 150,
      color: Colors.brown,
    ),
  ];




  @override
  void initState() {
    super.initState();









  }


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,//设置内部组件的位置
      child: IndexedStack(
        children: _widgetList,
        alignment: AlignmentDirectional.topStart,//对齐方式
        textDirection: TextDirection.ltr,//textDirection文本对齐方式，一般不会修改
        index: 2,
      ),
    );
  }
}


