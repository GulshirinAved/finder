import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:yitirdim/Theme/constants.dart';

CustomFooter footer() {
  return CustomFooter(
    builder: (BuildContext context, LoadStatus? mode) {
      Widget? body;

      if (mode == LoadStatus.idle) {
        body = Text(
          'Loading...',
          style: TextStyle(
            // color: AppConstants().blackColor,
            fontFamily: 'Comfortaa-SemiBold',
          ),
        );
      } else if (mode == LoadStatus.loading) {
        body = CircularProgressIndicator(
          color: AppConstants().mainColor,
        );
      } else if (mode == LoadStatus.failed) {
        body = Text(
          'Load Failed! Click retry!',
          style: TextStyle(
            // color: AppConstants().blackColor,
            fontFamily: 'Comfortaa-SemiBold',
          ),
        );
      } else if (mode == LoadStatus.canLoading) {
        body = const Text('');
      } else if (mode == LoadStatus.noMore) {
        body = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info_outline,
            ),
            Text(
              ' No more Data',
              style: TextStyle(
                // color: AppConstants().blackColor,
                fontFamily: 'Comfortaa-SemiBold',
              ),
            ),
          ],
        );
      }
      return SizedBox(
        height: 55.0,
        child: Center(child: body ?? Container()),
      );
    },
  );
}
