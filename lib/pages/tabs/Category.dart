import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myjingdong/config/Config.dart';
import 'package:myjingdong/services/ScreenAdaper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myjingdong/model/category_model.dart';
import 'package:dio/dio.dart';

//分类

//自定义有状态组件
class Category extends StatefulWidget {
  Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int _selectIndex = 0;
  double width = 0;
  double leftWidth = 0;
  double rightItemWidth = 0;
  double itemHeight = 0;

  List _leftProductList = [];//左侧数据
  List _rightProductList = [];//右侧数据

  @override
  void initState() {
    super.initState();
    width = ScreenUtil().screenWidth;
    leftWidth = width / 4;
    rightItemWidth = (width - leftWidth - 20 - 20) / 3;
    itemHeight = rightItemWidth + 30;
    _getLeftProductData();
  }


  //获取左侧列表
  _getLeftProductData() async{
    String api = '${Config.domain}api/pcate';
    Response response;
    response = await Dio().get(api);
    CateModelRes productList = CateModelRes.fromJson(response.data);
    if(productList.result.length > 0) {
      setState(() {
        _leftProductList = productList.result;
      });
      _getRightProductData(_leftProductList[0].sId);
    }
  }

  //获取右侧列表
  _getRightProductData(pid) async{
    String api = '${Config.domain}api/pcate?pid=${pid}';
    Response response;
    response = await Dio().get(api);
    CateModelRes productList = CateModelRes.fromJson(response.data);
    setState(() {
      if(productList.result.length > 0) {
        _rightProductList = productList.result;
      }
    });
  }

  _getLeftListWidget() {
    return Container(
      width: leftWidth,
      child: ListView.builder(
        itemCount: _leftProductList.length,
        itemBuilder: (BuildContext context, int index) {
          CateItemModel itemModel = _leftProductList[index];
          return Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    _selectIndex = index;
                    _getRightProductData(_leftProductList[_selectIndex].sId);
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 74.px,
                  alignment: Alignment.center,
                  child: Text(itemModel.title ?? ''),
                  color: index == _selectIndex ? Color.fromRGBO(240, 246, 246, 0.9) : Colors.white,
                ),
              ),
              Divider(
                height: 4,
              )
            ],
          );
        },
      ),
    );
  }

  _getRightListWidget() {
    return Expanded(
      child: Container(
        color: Color.fromRGBO(240, 246, 246, 0.9),
        padding: EdgeInsets.all(10),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10.0, //水平子 Widget 之间间距
              mainAxisSpacing: 10.0, //垂直子 Widget 之间间距
              crossAxisCount: 3, //一行的 Widget 数量
              childAspectRatio: rightItemWidth / itemHeight, //设置宽高比 这样宽就是高的一半
            ),
            itemCount: _rightProductList.length,
            itemBuilder: (context, index) {

              CateItemModel itemModel = _rightProductList[index];
              //处理图片
              String pic = itemModel.pic!;
              pic=Config.domain+pic.replaceAll('\\', '/');

              return Container(
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.network(pic, fit: BoxFit.cover),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      child: Text(itemModel.title ?? ''),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分类'),
      ),
      body: Row(
        children: <Widget>[
          _getLeftListWidget(),
          _getRightListWidget(),
        ],
      ),
    );
  }
}

