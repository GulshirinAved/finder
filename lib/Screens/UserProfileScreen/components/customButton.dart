import 'package:flutter/material.dart';
import 'package:yitirdim/Theme/constants.dart';

class CustomButton extends StatelessWidget {
  final String title1;
  final VoidCallback onTap1;
  final String title2;
  final VoidCallback onTap2;

  const CustomButton({
    super.key,
    required this.title1,
    required this.onTap1,
    required this.title2,
    required this.onTap2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: onTap1,
            child: Text(
              title1,
              style: TextStyle(
                  fontFamily: 'Comfortaa-SemiBold',
                  fontSize: AppConstants().fontSize20,
                  color: AppConstants().greyColor),
            ),
          ),
          GestureDetector(
            onTap: onTap2,
            child: Container(
              height: 38,
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 6, bottom: 6, left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: AppConstants().borderRadius15,
                color: AppConstants().mainColor,
              ),
              child: Text(
                title2,
                style: TextStyle(
                    fontFamily: 'Comfortaa-SemiBold',
                    fontSize: AppConstants().fontSize20,
                    color: AppConstants().whiteColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
