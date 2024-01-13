import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:yitirdim/API/data/services/filter_service.dart';
import 'package:yitirdim/API/data/services/location_service.dart';
import 'package:yitirdim/API/data/services/posts/post_service.dart';
import 'package:yitirdim/Screens/AllProductsScreen/LocationScreen/locationScreen_controller.dart';

import 'package:yitirdim/Screens/AllProductsScreen/LocationScreen/rayonScreen.dart';
import 'package:yitirdim/Screens/CustomWidgets/customAppBar.dart';

import 'package:yitirdim/Theme/constants.dart';

class LocationScreen extends StatelessWidget {
  final int number;
  const LocationScreen({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    LOcationScreenController locationController =
        Get.put(LOcationScreenController(), permanent: true);
    return Scaffold(
      // backgroundColor: AppConstants().whiteColor,
      appBar: CustomAppBar(
        number: 3,
        title: 'Yer',
        needLeading: true,
        needDelete: true,
        widget: Obx(() => IconButton(
              onPressed: () {
                locationController.locationList.clear();
                locationController.verifyLocationListAdd.clear();
              },
              icon: Text(
                "Arassalamak",
                style: TextStyle(
                    fontFamily: 'Comfortaa-SemiBold',
                    color: number == 0
                        ? locationController.locationList.value.isNotEmpty
                            ? AppConstants().redColor
                            : AppConstants().greyColor
                        : number == 1
                            ? locationController
                                    .verifyLocationListAdd.value.isNotEmpty
                                ? AppConstants().redColor
                                : AppConstants().greyColor
                            : null),
              ),
            )),
      ),
      body: FutureBuilder(
          future: LocationService().getVelayat(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        Get.to(() => RayonScreen(
                              velayat: snapshot.data[index].name_tm,
                              mainId: snapshot.data[index].id,
                              number: number,
                            ));
                      },
                      title: Text(
                        snapshot.data[index].name_tm,
                        style: TextStyle(
                          fontFamily: 'Comfortaa-SemiBold',
                          // color: AppConstants().darkBlue
                        ),
                      ),
                      trailing: Icon(
                        IconlyLight.arrowRightCircle,
                        color: Theme.of(context).iconTheme.color,

                        // color: AppConstants().mainColor,
                      ));
                },
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return SizedBox();
            }
          }),
    );
  }
}
