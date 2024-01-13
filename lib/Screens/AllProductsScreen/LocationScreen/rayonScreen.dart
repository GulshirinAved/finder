import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yitirdim/API/data/services/filter_service.dart';
import 'package:yitirdim/API/data/services/location_service.dart';
import 'package:yitirdim/Screens/AddingProductScreen/components/select_button.dart';
import 'package:yitirdim/Screens/AllProductsScreen/LocationScreen/locationScreen_controller.dart';
import 'package:yitirdim/Screens/CustomWidgets/customAppBar.dart';
import 'package:yitirdim/Theme/constants.dart';

class RayonScreen extends StatelessWidget {
  final String velayat;

  final int mainId;
  final int number;
  const RayonScreen(
      {super.key,
      required this.velayat,
      required this.mainId,
      required this.number});

  @override
  Widget build(BuildContext context) {
    LOcationScreenController locationController =
        Get.put(LOcationScreenController(), permanent: true);
    return Scaffold(
      // backgroundColor: AppConstants().whiteColor,
      appBar: CustomAppBar(
        number: 3,
        title: velayat,
        needLeading: true,
      ),
      body: FutureBuilder(
          future: LocationService().getRayons(mainId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Obx(() => CheckBox(
                        locationController: locationController,
                        title: snapshot.data[index].name_tm,
                        value: number == 1
                            ? locationController.locationListAdd
                                .contains(snapshot.data[index].id)
                            : locationController.locationList
                                .contains(snapshot.data[index].id),
                        onChanged: (value) {
                          locationController.nameRayon.value =
                              snapshot.data[index].name_tm;
                          number == 1
                              ? locationController.namingLocation(
                                  value!,
                                  snapshot.data[index].id,
                                )
                              : locationController.addingLocation(
                                  snapshot.data[index].id, value!);
                        },
                      ));
                },
              );
            } else {
              return SizedBox();
            }
          }),
      bottomNavigationBar: CustomButton(
          ontap: number == 1
              ? () {
                  locationController.addingVerifiedLocationAdd(
                      locationController.locationListAdd.value);

                  locationController.selectionLocation(velayat, mainId,
                      locationController.locationListAdd.value[0]);

                  Navigator.pop(context);
                  Navigator.pop(context);
                }
              : () {
                  locationController.addingVerifiedLocation(
                      locationController.locationList.value);
                  Navigator.pop(context);
                  Navigator.pop(context);
                }),
    );
  }
}

class CheckBox extends StatelessWidget {
  final String title;
  Function(bool?)? onChanged;
  bool value;
  CheckBox(
      {super.key,
      required this.title,
      required this.locationController,
      required this.onChanged,
      required this.value});

  final LOcationScreenController locationController;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
        controlAffinity: ListTileControlAffinity.leading,
        fillColor: MaterialStateProperty.all(Colors.transparent),
        side: MaterialStateBorderSide.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return BorderSide(color: AppConstants().mainColor);
          } else {
            return BorderSide(color: AppConstants().mainColor);
          }
        }),
        checkColor: AppConstants().mainColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        value: value,
        title: Text(title),
        onChanged: onChanged);
  }
}
