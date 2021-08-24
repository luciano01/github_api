import 'package:flutter/material.dart';
import 'package:github_api/app/shared/utils/app_colors.dart';
import 'package:github_api/app/shared/utils/app_constants.dart';
import 'package:github_api/app/shared/utils/app_text_styles.dart';

class SearchBottomSheetWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final GlobalKey<FormState> formKey;
  final AutovalidateMode? autovalidateMode;
  const SearchBottomSheetWidget({
    Key? key,
    required this.onPressed,
    required this.validator,
    required this.onChanged,
    required this.formKey,
    required this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Container(
        padding: MediaQuery.of(context).viewInsets,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Wrap(
            children: [
              Center(
                child: Text(
                  AppConstants.bottomSheetTitle,
                  style: AppTextStyles.bottomSheetTitle,
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: AppConstants.textFormFieldHintText,
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: validator,
                      onChanged: onChanged,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(width: 15),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: Icon(Icons.send),
                    onPressed: onPressed,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
