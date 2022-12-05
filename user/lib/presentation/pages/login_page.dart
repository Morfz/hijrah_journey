import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider;
import 'package:user/presentation/pages/profile_page.dart';

final actionCodeSettings = ActionCodeSettings(
  url: 'https://hijrah-journey.firebaseapp.com',
  handleCodeInApp: true,
);
final emailLinkProviderConfig = EmailLinkAuthProvider(
    actionCodeSettings: actionCodeSettings);

class HijrahLoginPage extends StatelessWidget {
  static const routeName = '/login';
  const HijrahLoginPage({super.key});

  String get initialRoute {
    final auth = FirebaseAuth.instance;

    if (auth.currentUser == null) {
      return '/login';
    }
    return HOME_PAGE;
  }

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.standard,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyle),
        textButtonTheme: TextButtonThemeData(style: buttonStyle),
        outlinedButtonTheme: OutlinedButtonThemeData(style: buttonStyle),
      ),
      initialRoute: initialRoute,
      routes: {
        LOGIN_PAGE: (context) {
          return SignInScreen(
            actions: [
              ForgotPasswordAction((context, email) {
                Navigator.pushNamed(
                    context, '/forgot-password', arguments: {'email': email});
              }),
              AuthStateChangeAction<SignedIn>((context, state) {
                Navigator.pushReplacementNamed(context, HOME_PAGE);
              }),
              AuthStateChangeAction<UserCreated>((context, state) {
                Navigator.pushReplacementNamed(context, HOME_PAGE);
              }),
            ],
            styles: const {
              EmailFormStyle(signInButtonVariant: ButtonVariant.filled)
            },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  action == AuthAction.signIn
                      ? 'Please Sign In To Continue'
                      : 'Please Create An Account To Continue',
                ),
              );
            },
          );
        },
        '/verify-email': (context) {
          return EmailVerificationScreen(
            actionCodeSettings: actionCodeSettings,
            actions: [
              EmailVerifiedAction(() {
                Navigator.pushReplacementNamed(context, PROFIL_PAGE);
              }),
              AuthCancelledAction((context) {
                FirebaseUIAuth.signOut(context: context);
                Navigator.pushReplacementNamed(context, '/login');
              })
            ],
          );
        },
        '/forgot-password': (context) {
          final arguments = ModalRoute
              .of(context)
              ?.settings
              .arguments as Map<String, dynamic>?;

          return ForgotPasswordScreen(
              email: arguments?['email']
          );
        },
        PROFIL_PAGE: (context) {
          return ProfilePage();
        },
      },
      title: 'Hijrah Journey',
    );
  }
}
