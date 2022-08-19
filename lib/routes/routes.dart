import 'package:flutter/material.dart';
import 'package:myjingdong/pages/Tabs.dart';



//配置路由
final routes={
  '/':(context)=>Tabs(),//根路由
  // '/form':(context)=>FormPage(),//无参数路由
  // '/search':(context,{arguments})=>SearchPage(arguments:arguments),//有参数路由
};

//固定写法
var onGenerateRoute=(RouteSettings settings) {
  // 统一处理
  final String? name = settings.name;
  final Function pageContentBuilder = routes[name] as Function;
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    }else{
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context));
      return route;
    }
  }
};


