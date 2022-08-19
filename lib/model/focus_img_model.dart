import 'package:json_annotation/json_annotation.dart';

part 'focus_img_model.g.dart';


@JsonSerializable()
class FocusImgModelRes {

  FocusImgModelRes();
  factory FocusImgModelRes.fromJson(Map<String, dynamic> json) => _$FocusImgModelResFromJson(json);
  Map<String, dynamic> toJson() => _$FocusImgModelResToJson(this);

  List<FocusImgModel> ? result;

}



@JsonSerializable()
class FocusImgModel {

  FocusImgModel();
  factory FocusImgModel.fromJson(Map<String, dynamic> json) => _$FocusImgModelFromJson(json);
  Map<String, dynamic> toJson() => _$FocusImgModelToJson(this);

  String? sId;//需要手动转换的字段  _id
  String? title;
  String? status;
  String? pic;
  String? url;

}
