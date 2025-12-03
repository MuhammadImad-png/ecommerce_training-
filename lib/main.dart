import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/app_colors.dart';
import 'package:flutter_app_std/core/componens/sensitve_data.dart';
import 'package:flutter_app_std/core/my_observer.dart';
import 'package:flutter_app_std/views/auth/logic/ui/login_view.dart';
import 'package:flutter_app_std/views/fevorite/ui/favorite_provider.dart';
import 'package:flutter_app_std/views/nav_bar/logic/ui/main_home_view.dart';
import 'package:flutter_app_std/views/product_details/logic/cubit/authentication_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';

// عشان نقدر نعمل ناڤيجيت من أي حتة
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: 'https://vkbbzvwaqazmreegcjrw.supabase.co', anonKey: anonkey);

  Bloc.observer = MyObserver();
  runApp(const OurMarket());
}

class OurMarket extends StatelessWidget {
  const OurMarket({super.key});

  @override
  Widget build(BuildContext context) {
    SupabaseClient client = Supabase.instance.client;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: BlocProvider(
        create: (context) => AuthenticationCubit()..getUserdata(),
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: "Welcome To Our Market",
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.kScaffoldColor,
          ),
          home: client.auth.currentUser != null ? MainHomeView() : LoginView(),
        ),
      ),
    );
  }
}
