import 'package:flutter/material.dart';
import 'package:yitirdim/Theme/constants.dart';

Widget flagBox(flag, title, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: ListTile(
      leading: ClipRRect(
        borderRadius: AppConstants().borderRadius8,
        child: Image.asset(
          'assets/images/${flag}.png',
          height: 45,
          width: 50,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(title),
    ),
  );
}
