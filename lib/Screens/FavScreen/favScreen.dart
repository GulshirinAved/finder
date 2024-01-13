import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yitirdim/API/data/services/favoriteAdd_service.dart';
import 'package:yitirdim/API/data/services/location_service.dart';
import 'package:yitirdim/Screens/CustomWidgets/customAppBar.dart';
import 'package:yitirdim/Screens/FavScreen/favScreen_conrtoller.dart';
import 'package:yitirdim/Screens/HomePageScreen/components/stuff_card.dart';
import 'package:yitirdim/Theme/constants.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  FavoriteScreenController controller = Get.put(FavoriteScreenController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.returnFav();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppConstants().whiteColor,
        appBar: CustomAppBar(
          number: 3,
          title: "favorites".tr,
        ),
        body: GetBuilder<FavoriteScreenController>(
          builder: (controller) {
            return FutureBuilder(
              future: FavoriteService().favoriteAll(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    itemCount: snapshot.data.length,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisExtent: 200),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          margin: EdgeInsets.only(left: 3, right: 3),
                          alignment: Alignment.topCenter,
                          // child: Text(snapshot.data[index].post.desc_tm)
                          child: StuffCard(
                            status: snapshot.data[index].post.status,
                            desc: snapshot.data[index].post.desc_tm,
                            locationTitle:
                                snapshot.data[index].post.location.name_tm,
                            mainCategory:
                                snapshot.data[index].post.category.name_tm,
                            // ['category']['name_tm'],
                            subCategory:
                                snapshot.data[index].post.category.name_tm,
                            colorName: snapshot.data[index].post.color.name_tm,
                            // [index]['color']
                            //     ['name_tm'],
                            created_at: snapshot.data[index].post.created_at,

                            imageTitle: snapshot.data[index].post.name_tm,
                            locationId: snapshot.data[index].post.location_id,

                            post_id: snapshot.data[index].post.id,
                            weight: snapshot.data[index].post.weight,
                            height: snapshot.data[index].post.height,
                            type_id: snapshot.data[index].post.type_id,
                            phoneNumber: snapshot.data[index].post.phone ?? 3,
                            category:
                                snapshot.data[index].post.category.name_tm,
                            clientName: snapshot.data[index].post.client.name,
                            client_id: snapshot.data[index].post.client_id,
                            imageList: [],
                            index: index,
                            loading: false,
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                    color: AppConstants().mainColor,
                  ));
                }
              },
            );
          },
        ));
  }
}
