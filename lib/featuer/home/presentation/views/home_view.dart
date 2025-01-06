import 'package:flutter/material.dart';
import 'package:fruits/core/utils/colors.dart';
import 'package:fruits/featuer/home/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits/featuer/home/presentation/widgets/home_views_body.dart';

class HomeView extends StatelessWidget{
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
 // bottomNavigationBar: CustomBottomNavigationBar(),
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(child: HomeViewsBody()),
    );
  }
}