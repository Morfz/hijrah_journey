import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadist/presentation/bloc/list_hadist/list_hadist_bloc.dart';
import 'package:hadist/presentation/bloc/rawi/rawi_bloc.dart';
import 'package:hadist/presentation/pages/list_hadist_page.dart';
import 'package:hadist/presentation/pages/rawi_page.dart';
import 'package:sholat/views/waktu_sholat.dart';
import 'package:sholat/views/wilayah_sholat.dart';
import 'package:user/presentation/pages/login_page.dart';
import 'package:user/presentation/pages/profile_page.dart';

import 'firebase_options.dart';
import 'locator.dart' as di;

void main() async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<RawiBloc>(
            create: (context) => di.locator<RawiBloc>(),
          ),
          BlocProvider<ListHadistBloc>(
            create: (context) => di.locator<ListHadistBloc>(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: const Color(0xFF4CA86E),
          ),
          title: 'Hijrah Journey App',
          home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return HijrahHomePage();
                }
                return LoginPage();
              }),
          navigatorObservers: [routeObserver],
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case HOME_PAGE:
                return MaterialPageRoute(
                    builder: (context) => HijrahHomePage());
              case LOGIN_PAGE:
                return MaterialPageRoute(
                    builder: (context) => const LoginPage());
              case PROFIL_PAGE:
                return MaterialPageRoute(
                    builder: (context) => const ProfilePage());
              case HADIST_PAGE:
                return MaterialPageRoute(
                    builder: (context) => const RawiPage());
              case LIST_HADIST_PAGE:
                final id = settings.arguments as String;
                return MaterialPageRoute(
                    builder: (_) => ListHadistPage(id: id), settings: settings);
              case WAKTU_SHOLAT_PAGE:
                return MaterialPageRoute(
                    builder: (context) => const WaktuSholatPage());
              case WILAYAH_SHOLAT_PAGE:
                return MaterialPageRoute(
                    builder: (context) => const WilayahSholatPage());
              default:
                return MaterialPageRoute(builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page Not Found'),
                    ),
                  );
                });
            }
          },
        ));
  }
}
