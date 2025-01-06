// import 'package:flutter/material.dart';
// import 'package:fruits/core/widgets/search_text_field.dart';
// import 'package:fruits/featuer/home/presentation/widgets/best_selling_grid_view.dart';
// import 'package:fruits/featuer/home/presentation/widgets/best_selling_header.dart';
// import 'package:fruits/featuer/home/presentation/widgets/custom_home_app_bar.dart';
// import 'package:fruits/featuer/home/presentation/widgets/featured_items.dart';
// import 'package:fruits/featuer/home/presentation/widgets/featured_list.dart';
// import 'package:gap/gap.dart';

// class HomeViewsBody extends StatelessWidget{
//   const HomeViewsBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CustomScrollView(
//       slivers: [
    
//         SliverToBoxAdapter(
//           child: Column(
            
//             children: [
//               Gap(16),
//               CustomHomeAppBar(),
//               Gap(16),
//               Padding(
//                 padding: EdgeInsets.only(right: 15,left: 15),
//                 child: SearchTextField(),
//               ), // pdding 18
//               Gap(12),
//               Padding(
//                 padding: EdgeInsets.only(right: 10,left: 10),
//                 child: FeaturedList(),
//               ),
//               Gap(12),
//               Padding(
//                 padding: EdgeInsets.only(right: 10,left: 10),
//                 child: BestSellingHeader(),
//               ),
//                  Gap(12),
//               // FeaturedItems(),
//             ],
//           ),
//         ),
//         Gap(8),
//         // BestSellingGridView(),
//       ],
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:fruits/core/widgets/search_text_field.dart';
import 'package:fruits/featuer/home/presentation/widgets/best_selling_grid_view.dart';
import 'package:fruits/featuer/home/presentation/widgets/best_selling_header.dart';
import 'package:fruits/featuer/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:fruits/featuer/home/presentation/widgets/featured_list.dart';
import 'package:gap/gap.dart';

class HomeViewsBody extends StatelessWidget {
  const HomeViewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Gap(16),
                CustomHomeAppBar(),
                Gap(16),
                SearchTextField(),
                Gap(12),
                FeaturedList(),
                Gap(12),
                BestSellingHeader(),
                Gap(8),
              ],
            ),
          ),
         BestSellingGridView(),
        ],
      ),
    );
  }
}


