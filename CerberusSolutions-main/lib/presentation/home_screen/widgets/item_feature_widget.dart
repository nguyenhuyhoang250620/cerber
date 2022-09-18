import 'package:cerberus_ai_system/core/utils/helper.dart';
import 'package:cerberus_ai_system/presentation/home_screen/models/feature_data.dart';
import 'package:cerberus_ai_system/widgets/glassmorphism_button.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../controller/home_controller.dart';
import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/widgets/custom_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemFeatureWidget extends StatelessWidget {
  ItemFeatureWidget(this.featureItem, {Key? key}) : super(key: key);

  //ItemFeatureModel homeScreenItemModelObj;
  FeatureData featureItem;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: getGlassmorphicContainer(
          margin: getMargin(left: ResponsiveWrapper.of(context).isLargerThan(MOBILE) ? 8 : 12),
          padding: getPadding(
              top: ResponsiveWrapper.of(context).isLargerThan(MOBILE) ? 32 : 32,
              bottom: ResponsiveWrapper.of(context).isLargerThan(MOBILE) ? 32 : 32),
          borderRadius: 16,
          border: 1,
          width: ResponsiveWrapper.of(context).isLargerThan(MOBILE) ? 400 : 240,
          height: 320,
          child: FittedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: getPadding(left: 16, right: 16),
                      child: Text(featureItem.getFeatureTitle(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.titleFeatureHomeScreen),
                    ),
                    Container(
                      margin: getMargin(left: 5, top: 5, right: 5, bottom: 5),
                      child: Text(
                        featureItem.getFeatureDescription(),
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: AppStyle.descriptionFeature,
                      ),
                    ),
                  ],
                ),
                CommonImageView(
                  imagePath: featureItem.imagePath,
                  width: ResponsiveWrapper.of(context).isLargerThan(MOBILE) ? 220 : 180,
                ),
                GlassmorphismButton(
                  onTap: (){
                    Get.back();
                    Get.toNamed(featureItem.getRoutes().toString());
                  },
                  width: 32,
                  height: 28,
                  text: 'BẮT ĐẦU',
                  borderRadius: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
