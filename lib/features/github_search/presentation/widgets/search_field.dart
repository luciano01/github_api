import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:github_api/core/utils/app_colors.dart';
import 'package:github_api/core/utils/app_const.dart';

class SearchField extends StatelessWidget {
  final void Function()? onPressedSearch;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  const SearchField({
    Key? key,
    required this.onPressedSearch,
    required this.controller,
    required this.formKey,
    required this.autovalidateMode,
    required this.validator,
    required this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                cursorColor: AppColors.white,
                controller: controller,
                validator: validator,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.white,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.white,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: AppColors.white,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: AppColors.white,
                    ),
                    onPressed: controller.clear,
                  ),
                  hintText: AppConst.textFormFieldHint,
                  hintStyle: TextStyle(
                    color: AppColors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                style: TextStyle(
                  color: AppColors.white,
                ),
                onFieldSubmitted: onFieldSubmitted,
              ),
            ),
            TextButton(
              child: Text(
                'Search'.toUpperCase(),
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
              onPressed: onPressedSearch,
            ),
          ],
        ),
      ),
    );
  }
}
