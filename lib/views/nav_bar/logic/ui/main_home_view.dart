import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/app_colors.dart';
import 'package:flutter_app_std/views/fevorite/ui/favorite_View.dart';
import 'package:flutter_app_std/views/nav_bar/logic/cubit/nav_bar_cubit.dart';
import 'package:flutter_app_std/views/nav_bar/logic/ui/Home_View.dart';
import 'package:flutter_app_std/views/profile/ui/profile_view.dart';
import 'package:flutter_app_std/views/store/store_View.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainHomeView extends StatelessWidget {
  MainHomeView({super.key});
  final List<Widget> views = [
    const HomeView(),
    const StoreView(),
    const FavoriteView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          NavBarCubit cubit = context.read<NavBarCubit>();
          return Scaffold(
            body: SafeArea(child: views[cubit.currentIndex]),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(color: AppColors.kWhiteColor),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                child: GNav(
                  onTabChange: (index) {
                    cubit.changecurrentIndex(index);
      },
                  rippleColor: AppColors
                      .kPrimaryColor, // tab button ripple color when pressed
                  hoverColor: Colors.grey[700]!,

                  duration: const Duration(
                      milliseconds: 300), // tab animation duration
                  gap: 8, // the tab button gap between icon and text
                  color: AppColors.kGrayColor, // unselected icon color
                  activeColor: Colors.white, // selected icon and text color
                  iconSize: 24, // tab button icon size
                  tabBackgroundColor: AppColors.kPrimaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  tabs: const [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.store,
                      text: 'Store',
                    ),
                    GButton(
                      icon: Icons.favorite,
                      text: 'Favorite',
                    ),
                    GButton(
                      icon: Icons.person,
                      text: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
