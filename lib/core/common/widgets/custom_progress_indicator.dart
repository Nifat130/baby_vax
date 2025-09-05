
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utils/constants/app_colors.dart';

class CustomProgressIndicator extends StatelessWidget{
  const CustomProgressIndicator({super.key, this.color});

  final Color? color;
  @override
  Widget build(BuildContext context){
    return Center(
      child: SpinKitWave(
        color: color ?? AppColors.primary,
        size: 35.h,
      ),
    );
  }
}