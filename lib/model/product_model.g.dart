// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModelRes _$ProductModelResFromJson(Map<String, dynamic> json) =>
    ProductModelRes()
      ..result = (json['result'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ProductModelResToJson(ProductModelRes instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel()
  ..title = json['title'] as String?
  ..cid = json['cid'] as String?
  ..price = (json['price'] as num?)?.toDouble()
  ..old_price = json['old_price'] as String?
  ..pic = json['pic'] as String?
  ..s_pic = json['s_pic'] as String?
  ..sId = json['_id'] as String?;

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'cid': instance.cid,
      'price': instance.price,
      'old_price': instance.old_price,
      'pic': instance.pic,
      's_pic': instance.s_pic,
      '_id': instance.sId,
    };
