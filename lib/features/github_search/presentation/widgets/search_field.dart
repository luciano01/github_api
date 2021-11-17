import 'package:flutter/material.dart';
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
          horizontal: 8,
          vertical: 8,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                validator: validator,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                  prefixIcon: Icon(Icons.person_outline),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: controller.clear,
                  ),
                  hintText: AppConst.textFormFieldHint,
                ),
                onFieldSubmitted: onFieldSubmitted,
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: onPressedSearch,
            ),
          ],
        ),
      ),
    );
  }
}
