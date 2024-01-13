import 'package:flutter/material.dart';
import 'package:yitirdim/Theme/constants.dart';

class TextFieldsSearch extends StatelessWidget {
  TextFieldsSearch(
      {super.key,
      required this.searchController,
      required this.onEditingComplete});

  final TextEditingController searchController;
  Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: EdgeInsets.all(7).copyWith(left: 0, right: 0),
      child: TextFormField(
        textAlign: TextAlign.start,
        controller: searchController,
        keyboardType: TextInputType.text,
        maxLines: 1,
        enabled: true,
        textDirection: TextDirection.ltr,
        decoration: InputDecoration(
            errorMaxLines: 2,
            hintMaxLines: 5,
            helperMaxLines: 5,
            hintText: 'Gozleg...',
            hintStyle: TextStyle(
              color: AppConstants().greyColor,
              fontFamily: 'Comfortaa-SemiBold',
            ),
            contentPadding: EdgeInsets.only(left: 10, top: 0, bottom: 0),
            border: InputBorder.none,
            filled: true,
            fillColor: Theme.of(context).colorScheme.onBackground,
            enabledBorder: OutlineInputBorder(
                borderRadius: AppConstants().borderRadius7,
                borderSide: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(0.1))),
            focusedBorder: OutlineInputBorder(
                borderRadius: AppConstants().borderRadius7,
                borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(0.1)))),
        onEditingComplete: onEditingComplete,
      ),
    );
  }
}
