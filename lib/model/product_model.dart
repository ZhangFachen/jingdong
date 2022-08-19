import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';


@JsonSerializable()
class ProductModelRes {

  ProductModelRes();
  factory ProductModelRes.fromJson(Map<String, dynamic> json) => _$ProductModelResFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelResToJson(this);

  List<ProductModel> ? result;
}



@JsonSerializable()
class ProductModel {

  ProductModel();
  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  String? sId;//需要手动转换的字段  _id
  String? title;
  String? cid;
  Object? price;//价格
  String? old_price;//以前价格
  String? pic;//"public\\upload\\RinsvExKu7Ed-ocs_7W1DxYO.png"
  String? s_pic;//public\\upload\\RinsvExKu7Ed-ocs_7W1DxYO.png_200x200.png

}
