import 'package:flutter/material.dart';
import 'package:wac_test/constants/appConstants.dart';
import 'package:wac_test/features/homescreen/controller/repositories/homeScreenRepository.dart';
import 'package:wac_test/features/homescreen/modal/categories.dart';

import '../../modal/bannerSlider.dart';
import '../../modal/productContent.dart';

class HomeScreenProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isError = false;
  bool _isLoaded = false;
  ApiExceptions error = ApiExceptions.None;

  bool get isLoaded => _isLoaded;
  bool get isLoading => _isLoading;
  bool get isError => _isError;

  String? _adBannerUrl;
  BannerSlider? _bannerSlider;
  List<ProductContent>? _bestSellerProducts;
  Categories? _categories;
  List<ProductContent>? _mostPopularProducts;

  BannerSlider? get bannerSlider => _bannerSlider;
  List<ProductContent>? get bestSellerProducts => _bestSellerProducts;
  Categories? get categories => _categories;
  List<ProductContent>? get mostPopularProducts => _mostPopularProducts;
  String? get adBannerUrl => _adBannerUrl;

  getHomeScreenData() async {
    _isLoading = true;
    notifyListeners();
    final response = await HomeScreenRepositories().homeScreenRepositories();
    var result;
    response.fold((l) => result = l, (r) => result = r);
    if (response.isRight()) {
      _isLoading = false;
      _isLoaded = true;
      _bannerSlider = BannerSlider.fromJson(result[0]);
      if (result[1]['contents'] != null) {
        _bestSellerProducts = <ProductContent>[];
        result[1]['contents'].forEach((v) {
          _bestSellerProducts!.add(ProductContent.fromJson(v));
        });
      }
      _adBannerUrl = result[2]['image_url'];
      _categories = Categories.fromJson(result[3]);
      if (result[4]['contents'] != null) {
        _mostPopularProducts = <ProductContent>[];
        result[4]['contents'].forEach((v) {
          _mostPopularProducts!.add(ProductContent.fromJson(v));
        });
      }
      print("BannerSlider:${bannerSlider!.title}");
      print("BestSellerProducts:${bestSellerProducts![0].productName}");
      print("Categories:${categories!.title}");
      print("MostPopularProducts:${mostPopularProducts![0].productName}");
      notifyListeners();
    } else {
      _isLoading = false;
      _isError = true;
      error = result;
      notifyListeners();
    }
  }
}
