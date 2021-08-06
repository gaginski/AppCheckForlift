import 'package:CheckForklift/shared/themes/app_images.dart';
import 'package:CheckForklift/shared/themes/app_text_styles.dart';
import 'package:CheckForklift/shared/themes/appcolors.dart';
import 'package:flutter/material.dart';

var text = new TextEditingController();

class ButtonConfigurarApi extends StatelessWidget {
  final VoidCallback onTap;
  const ButtonConfigurarApi({Key? key, required this.onTap}) : super(key: key);

  void setText(String txt) {
    text.text = txt;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: AppColors.shape,
            borderRadius: BorderRadius.circular(5),
            border: Border.fromBorderSide(
              BorderSide(
                color: AppColors.stroke,
              ),
            )),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.acess,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      width: 16,
                      height: 16,
                    ),
                    Container(
                      height: 56,
                      width: 1,
                      color: AppColors.stroke,
                      alignment: Alignment.center,
                    )
                  ],
                )),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text.text,
                    style: AppTextStyles.buttonGray,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
