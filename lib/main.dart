import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/app_colors.dart';
import 'package:flutter_app_std/core/my_observer.dart';
import 'package:flutter_app_std/views/auth/logic/ui/login_view.dart';
import 'package:flutter_app_std/views/nav_bar/logic/ui/main_home_view.dart';
import 'package:flutter_app_std/views/product_details/logic/cubit/authentication_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: 'https://vkbbzvwaqazmreegcjrw.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZrYmJ6dndhcWF6bXJlZWdjanJ3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjIyNDQzODQsImV4cCI6MjA3NzgyMDM4NH0.kfdKFZldLmG1S9UB-1Mbnpd5Kb9qoPTZYjpv6p43Uuc');
  Bloc.observer = MyObserver();
  runApp(const OurMarket());
}

class OurMarket extends StatelessWidget {
  const OurMarket({super.key});
  @override
  Widget build(BuildContext context) {
    SupabaseClient client = Supabase.instance.client;

    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Welcome To Our Market",
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.kScaffoldColor,
          ),
          home: client.auth.currentUser != null ? MainHomeView() : LoginView()),
    );
  }
}
// client.auth.currentUser != null ? MainHomeView() : LoginView(),
