import 'package:flutter/material.dart';
import 'package:yitirdim/Theme/constants.dart';

class NumberTextFormField extends StatelessWidget {
  final bool last;
  final bool first;
  final TextEditingController controller;
  const NumberTextFormField(
      {super.key,
      required this.last,
      required this.first,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 85,
        child: AspectRatio(
          aspectRatio: 0.75,
          child: TextField(
            controller: controller,
            autofocus: true,
            cursorColor: AppConstants().mainColor,
            onChanged: (value) {
              if (value.length == 1 && last == false) {
                FocusScope.of(context).nextFocus();
              }
              if (value.length == 0 && first == false) {
                FocusScope.of(context).previousFocus();
              }
            },
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Comfortaa-SemiBold',
              fontSize: AppConstants().fontSize23,
            ),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counter: Offstage(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).dividerColor.withOpacity(0.7)),
                  borderRadius: AppConstants().borderRadius15),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).dividerColor,
                  ),
                  borderRadius: AppConstants().borderRadius15),
            ),
          ),
        ));
  }
}
