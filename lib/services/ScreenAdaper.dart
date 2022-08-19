

import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AutoSizeUtils on num {
  ///根据高度去适配
  double get px => ScreenUtil().setHeight(this);
}


double getScreenWidth() {
  return ScreenUtil().screenWidth;
}