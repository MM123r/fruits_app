import 'package:flutter/material.dart';
import 'package:fruits/core/constants/app_assets.dart';
import 'package:fruits/featuer/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:fruits/featuer/home/presentation/widgets/in_active_item.dart';
import 'naivation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, });
  // final ValueChanged<int> onItemTapped;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
      ),
      
      child: Row(
        children: bottomNavigationBarItems.asMap().entries.map((e)
         {
          var index = e.key;
          var entity = e.value;

          return NaivgationBarItem(
            isSelected: selectedIndex == index,
            bottomNavigationBarEntity:entity,
            );
        }).toList(),
      ),
    );
  }
}
