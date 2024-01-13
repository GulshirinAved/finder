import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppConstants {
  //colors
  final Color whiteColor = Colors.white;
  final Color blackColor = Colors.black;
  final Color darkBlue = Color(0xff1B3254);
  final Color mainColor = Color(0xff1E61B0);
  final Color lightBlueColor = Color(0xff469ED2);
  final Color blueColor = Color(0xff0075FF);
  final Color redColor = Colors.red;
  final Color yellowColor = Color.fromARGB(255, 244, 190, 54);

  final Color greyColor = Colors.grey;
  final Color greyColor1 = Color.fromARGB(255, 245, 243, 243);
  final Color transpColor = Colors.transparent;
  final Color darkColor = Color.fromARGB(255, 19, 25, 30);
  final Color darkPurple = Color.fromARGB(255, 1, 2, 41);
//borderRadius
  final BorderRadius borderRadius5 = BorderRadius.circular(5);

  final BorderRadius borderRadius7 = BorderRadius.circular(7);
  final BorderRadius borderRadius8 = BorderRadius.circular(8);
  final BorderRadius borderRadius10 = BorderRadius.circular(10);
  final BorderRadius borderRadius15 = BorderRadius.circular(15);
  final BorderRadius borderRadius20 = BorderRadius.circular(20);

  final BorderRadius borderRadius25 = BorderRadius.circular(25);

//fontsize
  final double fontSize12 = 12;
  final double fontSize13 = 13;

  final double fontSize14 = 14;
  final double fontSize15 = 15;
  final double fontSize17 = 17;
  final double fontSize18 = 18;
  final double fontSize20 = 20;
  final double fontSize23 = 23;
}

// constant api
String url = 'https://finder.alemtilsimat.com/api/';

//fonts
const String defaultFont = 'Comfortaa-SemiBold';

List colorText = [
  {'color': Colors.amber, 'colorTitle': 'sary'},
  {'color': Colors.black, 'colorTitle': 'gara'},
  {'color': Colors.blue, 'colorTitle': 'gok'},
  {'color': Colors.brown, 'colorTitle': 'gonur'},
  {'color': Colors.deepOrange, 'colorTitle': 'mamisi'},
  {'color': Colors.deepPurple, 'colorTitle': 'cyrnyl'},
  {'color': Colors.green, 'colorTitle': 'yasyl'},
  {'color': Colors.grey, 'colorTitle': 'cal'},
  {'color': Colors.pink, 'colorTitle': 'gulgune'},
  {'color': Colors.red, 'colorTitle': 'gyzyl'},
  {'color': Colors.white, 'colorTitle': 'ak'},
];

List imageTitle = [
  {
    'id': 1,
    'title': 'Elektronika',
    'mainImage': 'assets/svg_icons/0.svg',
    'color': AppConstants().blueColor.withOpacity(0.3),
    'subCategory': [
      ///egerde sbCategoriyada iconka goymajak bolsalar subImage gerek dal
      {'subImage': 'assets/images/phone.png', 'title': 'Smartfonlar'},
      {'subImage': 'assets/images/phone.png', 'title': 'Laptoplar'},
      {'subImage': 'assets/images/phone.png', 'title': 'Cameralar'},
      {'subImage': 'assets/images/phone.png', 'title': 'Planshetlar'},
      {'subImage': 'assets/images/phone.png', 'title': 'Kabellar'},
      {'subImage': 'assets/images/phone.png', 'title': 'Naushniklar'},
    ],
  },
  {
    'id': 2,
    'title': 'Şahsy zatlar',
    'mainImage': 'assets/svg_icons/5.svg',
    'color': Color.fromARGB(255, 57, 220, 215).withOpacity(0.3),
    'subCategory': [
      {'subImage': 'assets/images/phone.png', 'title': 'Gapjyk'},
      {'subImage': 'assets/images/phone.png', 'title': 'Acarlar'},
      {'subImage': 'assets/images/phone.png', 'title': 'Sumka'},
      {'subImage': 'assets/images/phone.png', 'title': 'Say-sepler'},
      {'subImage': 'assets/images/phone.png', 'title': 'Sagatlar'},
    ]
  },
  {
    'id': 3,
    'title': 'Dokument',
    'mainImage': 'assets/svg_icons/7.svg',
    'color': Colors.orangeAccent.withOpacity(0.3),
    'subCategory': [
      {'subImage': 'assets/images/phone.png', 'title': 'Passport'},
      {'subImage': 'assets/images/phone.png', 'title': 'Surujilik pravasy'},
      {'subImage': 'assets/images/phone.png', 'title': 'Kartlar'},
      {'subImage': 'assets/images/phone.png', 'title': 'Beylekiler'},
    ]
  },
  {
    'id': 4,
    'title': 'Sport zatlar',
    'mainImage': 'assets/svg_icons/3.svg',
    'color': Color.fromARGB(255, 16, 138, 214).withOpacity(0.3),
    'subCategory': [
      {'subImage': 'assets/images/phone.png', 'title': 'Tigir'},
      {'subImage': 'assets/images/phone.png', 'title': 'Skateboard'},
      {'subImage': 'assets/images/phone.png', 'title': 'Tennis raketalary'},
      {'subImage': 'assets/images/phone.png', 'title': 'Toplar'},
      {'subImage': 'assets/images/phone.png', 'title': 'Sport sumkalar'},
    ]
  },
  {
    'id': 5,
    'title': 'Oy hayvan',
    'mainImage': 'assets/svg_icons/4.svg',
    'color': Colors.pink.withOpacity(0.3),
    'subCategory': [
      {'subImage': 'assets/images/phone.png', 'title': 'Itler'},
      {'subImage': 'assets/images/phone.png', 'title': 'Pisikler'},
      {'subImage': 'assets/images/phone.png', 'title': 'Gushlar'},
      {'subImage': 'assets/images/phone.png', 'title': 'Toplar'},
      {'subImage': 'assets/images/phone.png', 'title': 'Sport sumkalar'},
    ]
  },
  {
    'id': 6,
    'title': 'Cagalaryn zatlary',
    'mainImage': 'assets/svg_icons/2.svg',
    'color': Color.fromARGB(255, 29, 209, 101).withOpacity(0.3),
    'subCategory': [
      {'subImage': 'assets/images/phone.png', 'title': 'Kalyaska'},
      {'subImage': 'assets/images/phone.png', 'title': 'Oyunjaklar'},
      {'subImage': 'assets/images/phone.png', 'title': 'Babek sumka'},
      {'subImage': 'assets/images/phone.png', 'title': 'Babek korset'},
      {'subImage': 'assets/images/phone.png', 'title': 'Soska,cuyshe'},
    ]
  },
  {
    'id': 7,
    'title': 'Kanselýariýa',
    'mainImage': 'assets/svg_icons/6.svg',
    'color': Colors.indigo.withOpacity(0.3),
    'subCategory': [
      {'subImage': 'assets/images/phone.png', 'title': 'Kitaplar'},
      {'subImage': 'assets/images/phone.png', 'title': 'Depderler'},
      {'subImage': 'assets/images/phone.png', 'title': 'Kalkulyator'},
    ]
  },
  {
    'id': 8,
    'title': 'Gezelenc zatlar',
    'mainImage': 'assets/svg_icons/1.svg',
    'color': Colors.lime.withOpacity(0.3),
    'subCategory': [
      {'subImage': 'assets/images/phone.png', 'title': 'Bagaz'},
      {'subImage': 'assets/images/phone.png', 'title': 'Aksesuarlar'},
    ]
  },
  {
    'id': 9,
    'title': 'Beylekiler',
    'mainImage': 'assets/svg_icons/8.svg',
    'color': const Color.fromARGB(255, 114, 114, 114).withOpacity(0.3),
    'subCategory': []
  },
  {
    'id': 9,
    'title': 'Beylekiler',
    'mainImage': 'assets/svg_icons/8.svg',
    'color': Color.fromARGB(255, 195, 64, 255).withOpacity(0.3),
    'subCategory': []
  },
  {
    'id': 9,
    'title': 'Beylekiler',
    'mainImage': 'assets/svg_icons/8.svg',
    'color': const Color.fromARGB(255, 255, 64, 64).withOpacity(0.3),
    'subCategory': []
  },
];

Map<String, String> velayatTm = {
  'Hemmesi': 'all',
  'Aşgabat': 'ashgabat',
  'Ahal': 'ahal',
  'Mary': 'mary',
  'Lebap': 'lebap',
  'Balkan': 'balkan',
  'Daşoguz': 'dashoguz',
};
Map<String, String> velayatRu = {
  'Все': 'all',
  'Ашхабад': 'ashgabat',
  'Ахал': 'ahal',
  'Мары': 'mary',
  'Лебап': 'lebap',
  'Балкан': 'balkan',
  'Дашогуз': 'dashoguz',
};
