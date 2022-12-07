import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

typedef OAuthSignIn = void Function();

final FirebaseAuth _auth = FirebaseAuth.instance;

class ScaffoldSnackbar {
  ScaffoldSnackbar(this._context);

  factory ScaffoldSnackbar.of(BuildContext context) {
    return ScaffoldSnackbar(context);
  }

  final BuildContext _context;

  void show(String message) {
    ScaffoldMessenger.of(_context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }
}

enum AuthMode { login, register }

extension on AuthMode {
  String get title => this == AuthMode.login ? 'Login' : 'Register';
}

class LoginPage extends StatefulWidget {
  static const routeName = '/login-page';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String error = '';

  AuthMode mode = AuthMode.login;

  bool isLoading = false;

  void setIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  late Map<Buttons, OAuthSignIn> authButtons;

  @override
  void initState() {
    super.initState();
    authButtons = {
      Buttons.Google: () => _handleMultiFactorException(
            _signInWithGoogle,
          ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SafeArea(
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: error.isNotEmpty,
                          child: MaterialBanner(
                            backgroundColor: Theme.of(context).errorColor,
                            content: Text(error),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    error = '';
                                  });
                                },
                                child: const Text(
                                  'Dismiss',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                            contentTextStyle:
                                const TextStyle(color: Colors.white),
                            padding: const EdgeInsets.all(10),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText1,
                            children: [
                              TextSpan(
                                text: mode == AuthMode.login
                                    ? 'Please, Sign In To Continue'
                                    : 'Please, Register To Continue',
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: 'Email',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) =>
                                  value != null && value.isNotEmpty
                                      ? null
                                      : 'Required',
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                hintText: 'Password',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) =>
                                  value != null && value.isNotEmpty
                                      ? null
                                      : 'Required',
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: _resetPassword,
                            child: const Text(
                              'Forgot password ?',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ButtonTheme(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                              ),
                              onPressed: isLoading
                                  ? null
                                  : () => _handleMultiFactorException(
                                        _emailAndPassword,
                                      ),
                              child: isLoading
                                  ? const CircularProgressIndicator.adaptive()
                                  : Text(mode.title),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text("Or Continue With", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        ...authButtons.keys
                            .map(
                              (button) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  child: isLoading
                                      ? Container(
                                          color: Colors.grey[200],
                                          height: 50,
                                          width: double.infinity,
                                        )
                                      : SizedBox(
                                          width: double.infinity,
                                          height: 50,
                                          child: ButtonTheme(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: SignInButton(
                                              button,
                                              onPressed: authButtons[button]!,
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                            )
                            .toList(),
                        const SizedBox(height: 20),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText1,
                            children: [
                              TextSpan(
                                text: mode == AuthMode.login
                                    ? "Don't have an account? "
                                    : 'You have an account? ',
                              ),
                              TextSpan(
                                text: mode == AuthMode.login
                                    ? 'Register now'
                                    : 'Click to login',
                                style: const TextStyle(color: kPrimaryColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    setState(() {
                                      mode = mode == AuthMode.login
                                          ? AuthMode.register
                                          : AuthMode.login;
                                    });
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _resetPassword() async {
    String? email;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Send'),
            ),
          ],
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter your email'),
              const SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
              ),
            ],
          ),
        );
      },
    );

    if (email != null) {
      try {
        await _auth.sendPasswordResetEmail(email: email!);
        ScaffoldSnackbar.of(context).show('Password reset email is sent');
      } catch (e) {
        ScaffoldSnackbar.of(context).show('Error resetting');
      }
    }
  }

  Future<void> _handleMultiFactorException(
    Future<void> Function() authFunction,
  ) async {
    setIsLoading();
    try {
      await authFunction();
    } on FirebaseAuthMultiFactorException catch (e) {
      setState(() {
        error = '${e.message}';
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = '${e.message}';
      });
    } catch (e) {
      setState(() {
        error = '$e';
      });
    } finally {
      setIsLoading();
    }
  }

  Future<void> _emailAndPassword() async {
    if (formKey.currentState?.validate() ?? false) {
      setIsLoading();
      if (mode == AuthMode.login) {
        await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else if (mode == AuthMode.register) {
        await _auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      }
    }
  }

  Future<void> _signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
    }
  }
}
