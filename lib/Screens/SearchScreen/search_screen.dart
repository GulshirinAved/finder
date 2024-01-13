import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yitirdim/API/data/models/filter_model.dart';
import 'package:yitirdim/API/data/services/filter_service.dart';
import 'package:yitirdim/API/data/services/location_service.dart';
import 'package:yitirdim/API/data/services/posts/post_service.dart';
import 'package:yitirdim/Screens/AddingProductScreen/components/select_button.dart';
import 'package:yitirdim/Screens/AllProductsScreen/CategoryFilterScreen/subCategoryFilter_screen.dart';
import 'package:yitirdim/Screens/AllProductsScreen/LocationScreen/locationScreen_controller.dart';
import 'package:yitirdim/Screens/AllProductsScreen/LocationScreen/location_screen.dart';
import 'package:yitirdim/Screens/CategoryScreen/components/footer.dart';
import 'package:yitirdim/Screens/CustomWidgets/customAppBar.dart';
import 'package:yitirdim/Screens/HomePageScreen/components/stuff_card.dart';
import 'package:yitirdim/Screens/SearchScreen/components/rowText.dart';
import 'package:yitirdim/Screens/SearchScreen/search_controller.dart';
import 'package:yitirdim/Screens/TodaysScreen/todaysProduct_screem.dart';
import 'package:yitirdim/Theme/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SEarchScreenController searchTextController;
  late LOcationScreenController locationController;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchTextController = Get.put(SEarchScreenController());
    locationController = Get.put(LOcationScreenController());
    searchController = TextEditingController(
        text: searchTextController.searchText.value.toString());
    _getData(isRefresh: true);
  }

  RefreshController _refreshController = RefreshController();
  bool isDataLoading = false;

  int page = 1;

  Future<void> _getData({bool isRefresh = false}) async {
    if (isRefresh) {
      page = 1;
      locationController.allProducts.clear();
    }
    List data = await PostService().searchProducts(
        searchTextController.searchText.value,
        page,
        locationController.verifyLocationList.value,
        locationController.verifyCategoryList.value);
    locationController.allProducts.addAll(data);
    _refreshController.refreshCompleted();
  }

  Future<void> _loadMoreData() async {
    if (isDataLoading) return;

    isDataLoading = true;

    page++;

    List data = await FilterService().searchProducts(
        searchTextController.searchText.value,
        page,
        locationController.verifyLocationList.value,
        locationController.verifyCategoryList.value);

    locationController.allProducts.addAll(data);
    isDataLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        number: 2,
        searchController: searchController,
        needLeading: true,
        onTap: () async {
          await showModalBottomSheet(
            context: context,
            enableDrag: true,
            isDismissible: false,
            showDragHandle: true,
            useSafeArea: true,
            barrierColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,

            // backgroundColor: AppConstants().whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),

            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 4,
                    width: 120,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                  Container(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => LocationScreen(
                            number: 0,
                          ));
                    },
                    child: rowText("Yerler", () {
                      Get.to(() => LocationScreen(
                            number: 0,
                          ));
                    }, context),
                  ),
                  Divider(
                    color: Color.fromARGB(255, 243, 242, 242),
                  ),
                  SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SubCatgeoryFilterScreen(
                            number: 0,
                          ));
                    },
                    child: rowText("categories".tr, () {
                      Get.to(() => SubCatgeoryFilterScreen(
                            number: 0,
                          ));
                    }, context),
                  ),
                  CustomButton(ontap: () {
                    _getData(isRefresh: true);
                    Navigator.pop(context);
                    // Get.back();
                  }),
                ],
              );
            },
          );
        },
        onEditingComplete: () async {
          FocusManager.instance.primaryFocus?.unfocus();
          setState(() {
            searchTextController.loading.value = true;
            searchTextController.searchingText(searchController.text);
          });
          await Future.delayed(Duration(seconds: 3));
          setState(() {
            searchTextController.loading.value = false;
          });
          _getData(isRefresh: true);
        },
      ),
      body: searchTextController.loading.value
          ? ShimmerGridview()
          : FutureBuilder(
              future: PostService().searchProducts(
                  searchTextController.searchText.value,
                  page,
                  locationController.verifyLocationList.value,
                  locationController.verifyCategoryList.value),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  searchTextController.loading.value = false;
                  if (snapshot.data.isEmpty) {
                    return Center(
                      child: Text("No Results"),
                    );
                  }
                  return SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: SmartRefresher(
                      controller: _refreshController,
                      onRefresh: () async {
                        await _getData(isRefresh: true);
                      },
                      onLoading: () {
                        _loadMoreData();
                      },
                      enablePullDown: true,
                      enablePullUp: true,
                      header: MaterialClassicHeader(
                        color: AppConstants().mainColor,
                      ),
                      footer: footer(),
                      child: Obx(
                        () => GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(right: 10, left: 10, top: 5),
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 6,
                                  mainAxisSpacing: 6,
                                  mainAxisExtent: 200),
                          itemCount: locationController.allProducts.length,
                          itemBuilder: (context, index) {
                            return Container(
                              // margin: EdgeInsets.only(bottom: 5),
                              padding: EdgeInsets.all(7).copyWith(bottom: 0),
                              alignment: Alignment.topCenter,
                              child: StuffCard(
                                post_id: snapshot.data[index].id,
                                client_id: 0,
                                type_id: snapshot.data[index].type_id,
                                created_at: DateTime.parse(
                                  locationController
                                      .allProducts[index].created_at
                                      .toString(),
                                ).toString(),
                                colorName: locationController
                                    .allProducts[index].color.name_tm,
                                category: locationController
                                    .allProducts[index].category.name_tm,
                                status: snapshot.data[index].status,
                                desc: locationController
                                    .allProducts[index].desc_tm,
                                imageTitle: locationController
                                        .allProducts[index].name_tm ??
                                    '',
                                index: index,
                                imageList: snapshot.data[index].images,
                                locationTitle: locationController
                                        .allProducts[index].location.name_tm ??
                                    '',
                                loading: false,
                                locationId: snapshot.data[index].location_id,
                                height: snapshot.data[index].height ?? 0,
                                weight: snapshot.data[index].weight ?? 0,
                                mainCategory: "",
                                phoneNumber: snapshot.data[index].phone,
                                subCategory:
                                    snapshot.data[index].category.name_tm,
                                clientName: snapshot.data[index].client.name,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                } else {
                  return ShimmerGridview();
                }
              },
            ),
    );
  }
}

class SubCategoryTile extends StatelessWidget {
  final String title;

  const SubCategoryTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    List allSubCategories = [];
    for (var item in imageTitle) {
      if (item['title'] == title) {
        allSubCategories = List.from(item['subCategory']);
      }
    }
    return Column(children: [
      Container(
          height: 4,
          width: 120,
          margin: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
              color: AppConstants().greyColor,
              borderRadius: AppConstants().borderRadius15)),
      Container(
        color: AppConstants().greyColor,
      ),
      Text(
        "Kici Kategoriya",
        style: TextStyle(
            fontFamily: 'Comfortaa-SemiBold',
            // color: AppConstants().darkBlue,
            fontSize: AppConstants().fontSize20,
            fontWeight: FontWeight.w500),
      ),
      Container(
        height: 400,
        width: Get.width,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: allSubCategories.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Get.back();
                Get.back();
              },
              title: Text(allSubCategories[index]['title']),
              trailing: Icon(
                IconlyLight.arrowRightCircle,
                color: Theme.of(context).iconTheme.color,

                // color: AppConstants().mainColor,
              ),
            );
          },
        ),
      )
    ]);
  }
}
