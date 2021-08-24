import 'package:flutter/material.dart';
import 'package:github_api/app/modules/start/components/search_bottom_sheet_widget.dart';

class SearchFabWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final GlobalKey<FormState> formKey;
  final AutovalidateMode? autovalidateMode;
  const SearchFabWidget({
    Key? key,
    required this.onPressed,
    required this.validator,
    required this.onChanged,
    required this.formKey,
    required this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      child: Icon(Icons.search),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return SearchBottomSheetWidget(
              onPressed: onPressed,
              validator: validator,
              onChanged: onChanged,
              formKey: formKey,
              autovalidateMode: autovalidateMode,
            );
          },
        );
      },
    );
  }
}
