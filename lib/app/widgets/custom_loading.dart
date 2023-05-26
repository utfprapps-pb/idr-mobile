import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';

final customLoading = Center(
  child: SpinKitCubeGrid(
    color: UIColors.primaryColor,
    size: 30.0,
  ),
);
