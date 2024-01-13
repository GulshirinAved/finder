// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:yitirdim/Theme/constants.dart';

class TExtField extends StatelessWidget {
  final icon;
  String hintText;
  bool isPassword;
  bool phone;
  var number;
  TextEditingController controllerr;

  TExtField(
      {Key? key,
      required this.icon,
      required this.hintText,
      required this.isPassword,
      required this.phone,
      required this.number,
      required this.controllerr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    double _width = MediaQuery.of(context).size.width;
    return Container(
      height: _width / 7.5,
      width: _width / 1.22,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: _width / 30, top: 3.5),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.background),
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        maxLines: null,
        expands: true,
        controller: controllerr,
        inputFormatters: [LengthLimitingTextInputFormatter(number)],
        cursorColor: AppConstants().mainColor,
        obscureText: isPassword,
        keyboardType: phone ? TextInputType.phone : TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: icon != null
                ? Icon(
                    icon,
                    size: 25,
                    color: Theme.of(context).iconTheme.color,
                  )
                : Container(
                    margin: EdgeInsets.all(8).copyWith(top: 15, left: 10),
                    child: Text(
                      '+993',
                      style: TextStyle(
                        fontFamily: 'Comfortaa-SemiBold',
                        fontWeight: FontWeight.bold,
                        fontSize: AppConstants().fontSize14,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    )),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: AppConstants().fontSize13,
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppConstants().redColor))),
        onChanged: (value) {},
        onFieldSubmitted: (value) {},
        onEditingComplete: () {
          FocusScope.of(context).unfocus();
        },
      ),
    );
    // return Container(
    //   height: _width / 7.5,
    //   width: _width / 1.22,
    //   alignment: Alignment.center,
    //   padding: EdgeInsets.only(right: _width / 30, top: 3.5),
    //   decoration: BoxDecoration(
    //     border: Border.all(color: Theme.of(context).colorScheme.background),
    //     color: Theme.of(context).colorScheme.onBackground,
    //     borderRadius: BorderRadius.circular(15),
    //   ),
    //   child: TextField(
    //     controller: controllerr,
    //     inputFormatters: [LengthLimitingTextInputFormatter(number)],
    //     cursorColor: AppConstants().mainColor,
    //     obscureText: isPassword,
    //     keyboardType: phone ? TextInputType.phone : TextInputType.text,
    //     decoration: InputDecoration(
    //         prefixIcon: icon != null
    //             ? Icon(
    //                 icon,
    //                 size: 25,
    //                 color: Theme.of(context).iconTheme.color,
    //               )
    //             : Container(
    //                 margin: EdgeInsets.all(8).copyWith(top: 15, left: 10),
    //                 child: Text(
    //                   '+993',
    //                   style: TextStyle(
    //                     fontFamily: 'Comfortaa-SemiBold',
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: AppConstants().fontSize14,
    //                     color: Theme.of(context).iconTheme.color,
    //                   ),
    //                 )),
    //         border: InputBorder.none,
    //         hintText: hintText,
    //         hintStyle: TextStyle(
    //           fontSize: AppConstants().fontSize13,
    //         ),
    //         focusedBorder: InputBorder.none,
    //         enabledBorder: InputBorder.none,
    //         errorBorder: InputBorder.none),
    //     onChanged: (value) {},
    //     onEditingComplete: () {
    //       FocusScope.of(context).unfocus();
    //     },
    //   ),
    // );
  }
}
