import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/app_colors.dart';
import 'package:flutter_app_std/core/componens/custom_circle_pro_ind.dart';
import 'package:flutter_app_std/core/function/navigate_without_back.dart';
import 'package:flutter_app_std/views/auth/cubit/authentication_cubit.dart';
import 'package:flutter_app_std/views/auth/logic/models/user_model.dart';
import 'package:flutter_app_std/views/auth/logic/ui/login_view.dart';
//  import 'package:flutter_app_std/views/product_details/logic/cubit/authentication_cubit.dart';
import 'package:flutter_app_std/views/profile/ui/wedget/custom_row_btn.dart';
import 'package:flutter_app_std/views/profile/ui/wedget/edit_name.dart';
import 'package:flutter_app_std/views/profile/ui/wedget/my_orders.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit()..getUserdata(),
      child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            navigateTo(context, LoginView());
          }
        },
        builder: (context, state) {
          UserDataModel? user =
              context.watch<AuthenticationCubit>().userDataModel;
          return state is LogoutLoading || state is GetUserDataLoading
              ? CustomerCircleProglndicator()
              : Center(
                  child: Card(
                    margin: const EdgeInsets.all(15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        const CircleAvatar(
                          radius: 40,
                          foregroundColor: AppColors.kWhiteColor,
                          backgroundColor: AppColors.kPrimaryColor,
                          child: Icon(
                            Icons.person,
                            size: 30,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          user?.name ?? "user name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(height: 6),
                        Text(user?.email ?? "User email"),
                        const SizedBox(height: 24),
                        CuctomRowBtn(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EditName()),
                            );
                          },
                          icon: Icons.person,
                          text: 'Edit Name',
                        ),
                        const SizedBox(height: 18),
                        CuctomRowBtn(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyOrdersView(),
                              ),
                            );
                          },
                          icon: Icons.shopping_cart,
                          text: 'My Orders',
                        ),
                        const SizedBox(height: 18),
                        CuctomRowBtn(
                          onTap: () async {
                            await context.read<AuthenticationCubit>().signout();
                          },
                          icon: Icons.logout_outlined,
                          text: 'Logout',
                        ),
                      ]),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
