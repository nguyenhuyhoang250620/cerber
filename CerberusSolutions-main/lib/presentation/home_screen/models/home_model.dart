import 'package:cerberus_ai_system/presentation/home_screen/models/feature_data.dart';
import 'package:get/get.dart';
import 'sliderheaderads_item_model.dart';
import 'item_feature_model.dart';

class HomeModel {
  RxList<SliderheaderadsItemModel> sliderheaderadsItemList = RxList.filled(4, SliderheaderadsItemModel());

  RxList<ItemFeatureModel> homeScreenItemList = RxList.filled(10, ItemFeatureModel());

  RxList featureData = FeatureData.data.obs;
}
