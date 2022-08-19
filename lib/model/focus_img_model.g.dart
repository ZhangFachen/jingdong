// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_img_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FocusImgModelRes _$FocusImgModelResFromJson(Map<String, dynamic> json) =>
    FocusImgModelRes()
      ..result = (json['result'] as List<dynamic>?)
          ?.map((e) => FocusImgModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$FocusImgModelResToJson(FocusImgModelRes instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

FocusImgModel _$FocusImgModelFromJson(Map<String, dynamic> json) =>
    FocusImgModel()
      ..title = json['title'] as String?
      ..status = json['status'] as String?
      ..pic = json['pic'] as String?
      ..url = json['url'] as String?
      ..sId = json['_id'] as String?
;

Map<String, dynamic> _$FocusImgModelToJson(FocusImgModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'status': instance.status,
      'pic': instance.pic,
          'url': instance.url,
          '_id': instance.sId,
    };
