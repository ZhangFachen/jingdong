import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:myjingdong/config/Config.dart';
import 'package:myjingdong/model/focus_img_model.dart';
import 'package:myjingdong/model/product_model.dart';
import 'package:myjingdong/services/ScreenAdaper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dio/dio.dart';

//首页

//自定义有状态组件
//自定义有状态组件
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


  List _focusData = [];//轮播图数据
  List _hotProductList = [];//猜你喜欢数据
  List _bestProductList = [];//热门推荐数据

  @override
  void initState() {
    super.initState();
    _getFocusData();
    _getLoveProductData();
    _getLoveProductData();
    _getrecProductData();
  }

  //获取轮播图
  _getFocusData() async{
    String api = '${Config.domain}api/focus';
    Response response;
    response = await Dio().get(api);
    FocusImgModelRes focusList = FocusImgModelRes.fromJson(response.data);
    setState(() {
      if(focusList.result != null && focusList.result!.length > 0) {
        _focusData = focusList.result!;
      }
    });
  }

  //获取猜你喜欢
  _getLoveProductData() async{
    String api = '${Config.domain}api/plist?is_hot=1';
    Response response;
    response = await Dio().get(api);
    ProductModelRes productList = ProductModelRes.fromJson(response.data);
    setState(() {
      if(productList.result != null && productList.result!.length > 0) {
        _hotProductList = productList.result!;
      }
    });
  }

  //获取热门推荐数据
  _getrecProductData() async{
    String api = '${Config.domain}api/plist?is_best=1';
    Response response;
    response = await Dio().get(api);
    ProductModelRes productList = ProductModelRes.fromJson(response.data);
    setState(() {
      if(productList.result != null && productList.result!.length > 0) {
        _bestProductList = productList.result!;
      }
    });
  }

  //轮播图
  Widget _swiperWidget() {
    if(_focusData.length > 0) {
      return AspectRatio(
        aspectRatio: 2 / 1,
        child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              String pic = this._focusData[index].pic;
              pic = Config.domain + pic.replaceAll('\\', '/');
              return Image.network(
                pic,
                fit: BoxFit.fill,
              );
            },
            itemCount: this._focusData.length,
            pagination: const SwiperPagination(),
            autoplay: true),
      );
    }else {
      return Text('数据加载中...');
    }
  }

  //获取中间标题widget
  Widget _getTitleWidget(String title) {
    return Container(
      height: 50.px,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20.px),
            width: 10.px,
            color: Colors.red,
          ),
          SizedBox(width: 20.px),
          Text(
            title,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 20
            ),
          ),
        ],
      ),
    );
  }

  //猜你喜欢
  Widget _guessYouLiveList() {
    if(_hotProductList.length > 0) {
      return Container(
        height: 240.px,
        padding: EdgeInsets.all(20.px),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (contxt, index) {
            String pic = this._hotProductList[index].s_pic;
            pic = Config.domain + pic.replaceAll('\\', '/');
            return Container(
              margin: EdgeInsets.only(right: 10.px),
              height: 200.px,
              width: 200.px,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 140.px,
                    width: 140.px,
                    child: Image.network(
                      pic,
                      alignment: Alignment.center,//图片对齐方式
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10.px,),
                  Text("第${index+1}条"),
                ],
              ),
            );
          },
          itemCount: _hotProductList.length,
        ),
      );
    }else {
      return Text('数据加载中...');
    }
  }

  //热门推荐
Widget _recProductItemWidget() {
  double width = (ScreenUtil().screenWidth - 30) / 2;
    if(_bestProductList.length > 0){
      return Container(
        padding: EdgeInsets.all(10),
        child: Wrap(
          runSpacing: 10,
          spacing: 10,
          children: this._bestProductList.map((value) {
            ProductModel productModel = value;
            String? pic = productModel.s_pic;
            pic = Config.domain + pic!.replaceAll('\\', '/');
            return Container(
              padding: EdgeInsets.all(10.px),
              width: width,
              decoration: BoxDecoration(//注意使用 BoxDecoration
                border:Border.all(//统一设置边框
                  color: Color.fromRGBO(233, 233, 233, 0.9),
                  width: 1.0,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: width-20.px,
                    height: width-20.px,
                    child: Image.network(
                      pic,
                      alignment: Alignment.center,//图片对齐方式
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.px),
                    child: Text(
                      productModel.title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.px),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "¥${productModel.price}",
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text("¥${productModel.old_price ?? "0"}",
                              style: TextStyle(color: Colors.black54, fontSize: 14, decoration: TextDecoration.lineThrough)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      );
    } else {
      return Container();
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: ListView(
        children: <Widget>[
          _swiperWidget(),
          SizedBox(height: 10.px),
          _getTitleWidget('猜你喜欢'),
          SizedBox(height: 10.px),
          _guessYouLiveList(),
          SizedBox(height: 10.px),
          _getTitleWidget('热门推荐'),
          _recProductItemWidget(),
        ],
      ),
    );
  }


}
