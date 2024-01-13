import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:yitirdim/API/data/services/location_service.dart';
import 'package:yitirdim/Screens/HomePageScreen/homePage_controller.dart';
import 'package:yitirdim/Theme/constants.dart';

class LocationText extends StatelessWidget {
  Color? color;
  double? iconSize;
  double? fontSize;
  String locationTitle;
  int? index;
  double? width;
  int? locationId;

  LocationText(
      {super.key,
      this.color,
      this.fontSize,
      this.iconSize,
      required this.locationTitle,
      this.width,
      this.index,
      required this.locationId});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            IconlyBold.location,
            size: iconSize == null ? 16 : iconSize,
            color: AppConstants().redColor,
          ),
          Container(
              margin: EdgeInsets.only(left: 2),
              width: width ?? 105,
              child: FutureBuilder(
                  future: LocationService().getLocations(locationId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        index == null
                            ? locationTitle
                            : Get.locale!.languageCode == 'tkm'
                                ? snapshot.data.name_tm.toString() +
                                    ',' +
                                    locationTitle
                                : snapshot.data.name_ru.toString() +
                                    ',' +
                                    locationTitle,
                        maxLines: 2,
                        style: TextStyle(
                            fontFamily: 'Comfortaa-SemiBold',
                            color: color == null ? Colors.black : color,
                            fontSize: fontSize == null
                                ? AppConstants().fontSize13
                                : fontSize),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  })),
        ],
      ),
    );
  }
}
