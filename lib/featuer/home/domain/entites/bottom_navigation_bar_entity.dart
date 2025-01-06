import 'package:fruits/core/constants/app_assets.dart';



class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
          activeImage: AppAssets.home,
          inActiveImage: AppAssets.homeActive,
          name: 'الرئيسية'),
      BottomNavigationBarEntity(
          activeImage: AppAssets.product,
          inActiveImage: AppAssets.productsActive,
          name: 'المنتجات'),
      BottomNavigationBarEntity(
          activeImage: AppAssets.cart,
          inActiveImage:AppAssets.cartActive,
          name: 'سلة التسوق'),
      BottomNavigationBarEntity(
          activeImage: AppAssets.user,
          inActiveImage: AppAssets.userActive,
          name: 'حسابي'),
    ];