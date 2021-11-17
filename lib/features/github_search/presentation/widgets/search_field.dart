import 'package:flutter/material.dart';
import 'package:github_api/core/utils/app_const.dart';

class SearchField extends StatelessWidget {
  final void Function()? onPressedSearch;
  final void Function()? onPressedClean;
  const SearchField({
    Key? key,
    required this.onPressedSearch,
    required this.onPressedClean,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
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
                  onPressed: onPressedClean,
                ),
                hintText: AppConst.textFormFieldHint,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: onPressedSearch,
          ),
        ],
      ),
    );
  }
}
