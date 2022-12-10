import 'package:addon/presentation/bloc/doa/doa_bloc.dart';
import 'package:addon/presentation/pages/doa_page.dart';
import 'package:alquran/presentation/bloc/juz_detail/juz_detail_bloc.dart';
import 'package:alquran/presentation/bloc/surah/surah_bloc.dart';
import 'package:alquran/presentation/bloc/surah_detail/surah_detail_bloc.dart';
import 'package:alquran/presentation/pages/juz/juz_detail_page.dart';
import 'package:alquran/presentation/pages/juz/juz_page.dart';
import 'package:alquran/presentation/pages/surah/surah_detail_page.dart';
import 'package:alquran/presentation/pages/surah/surah_page.dart';
import 'package:core/core.dart';
import 'package:core/presentation/pages/dashboard_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadist/presentation/bloc/list_hadist/list_hadist_bloc.dart';
import 'package:hadist/presentation/bloc/rawi/rawi_bloc.dart';
import 'package:hadist/presentation/pages/list_hadist_page.dart';
import 'package:hadist/presentation/pages/rawi_page.dart';
import 'package:sholat/presentation/pages/waktu_sholat.dart';
import 'package:notification/presentation/pages/notification_settings.dart';
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
          BlocProvider<DoaBloc>(
            create: (context) => di.locator<DoaBloc>(),
          ),
          BlocProvider<SurahBloc>(
            create: (context) => di.locator<SurahBloc>(),
          ),
          BlocProvider<SurahDetailBloc>(
            create: (context) => di.locator<SurahDetailBloc>(),
          ),
          BlocProvider<JuzDetailBloc>(
            create: (context) => di.locator<JuzDetailBloc>(),
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
                    builder: (context) => const HijrahHomePage());
              case DASHBOARD_PAGE:
                return MaterialPageRoute(
                    builder: (context) => const PageMain());
              case LOGIN_PAGE:
                return MaterialPageRoute(
                    builder: (context) => const LoginPage());
              case PROFIL_PAGE:
                return MaterialPageRoute(
                    builder: (context) => const ProfilePage());
              case DOA_PAGE:
                return MaterialPageRoute(builder: (context) => const DoaPage());
              case HADIST_PAGE:
                return MaterialPageRoute(
                    builder: (context) => const RawiPage());
              case LIST_HADIST_PAGE:
                final id = settings.arguments as String;
                return MaterialPageRoute(
                    builder: (context) => ListHadistPage(id: id), settings: settings);
              case WAKTU_SHOLAT_PAGE:
                return MaterialPageRoute(
                    builder: (context) => const WaktuSholatPage());
              case NOTIFICATION_SETTINGS_PAGE:
                return MaterialPageRoute(
                    builder: (context) => const NotificationSettingsPages());
              case SURAH_PAGE:
                return MaterialPageRoute(
                    builder: (context) => const SurahPage());
              case SURAH_DETAIL_PAGE:
                final id = settings.arguments as int;
                return MaterialPageRoute(
                    builder: (_) => SurahDetailPage(id: id), settings: settings);
              case JUZ_PAGE:
                return MaterialPageRoute(
                    builder: (context) => const JuzPage());
              case JUZ_DETAIL_PAGE:
                final id = settings.arguments as int;
                return MaterialPageRoute(
                    builder: (_) => JuzDetailPage(id: id), settings: settings);
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
