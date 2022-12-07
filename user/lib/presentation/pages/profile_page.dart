import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_page.dart';

const placeholderImage =
    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile-page';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User user;
  late TextEditingController controller;

  String? photoURL;

  bool showSaveButton = false;
  bool isLoading = false;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser!;
    controller = TextEditingController(text: user.displayName);

    controller.addListener(_onNameChanged);

    FirebaseAuth.instance.userChanges().listen((event) {
      if (event != null && mounted) {
        setState(() {
          user = event;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(_onNameChanged);

    super.dispose();
  }

  void setIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void _onNameChanged() {
    setState(() {
      if (controller.text == user.displayName || controller.text.isEmpty) {
        showSaveButton = false;
      } else {
        showSaveButton = true;
      }
    });
  }

  List get userProviders => user.providerData.map((e) => e.providerId).toList();

  Future updateDisplayName() async {
    await user.updateDisplayName(controller.text);

    setState(() {
      showSaveButton = false;
    });
    ScaffoldSnackbar.of(context).show('Name updated');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Profile'),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          body: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            maxRadius: 60,
                            backgroundImage: NetworkImage(
                              user.photoURL ?? placeholderImage,
                            ),
                          ),
                          Positioned.directional(
                            textDirection: Directionality.of(context),
                            end: 0,
                            bottom: 0,
                            child: Material(
                              clipBehavior: Clip.antiAlias,
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(40),
                              child: InkWell(
                                onTap: () async {
                                  final photoURL = await getPhotoURLFromUser();

                                  if (photoURL != null) {
                                    await user.updatePhotoURL(photoURL);
                                  }
                                },
                                radius: 50,
                                child: const SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: Icon(Icons.edit),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        textAlign: TextAlign.center,
                        controller: controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          alignLabelWithHint: true,
                          label: Center(
                            child: Text(
                              'Click to add a display name',
                            ),
                          ),
                        ),
                      ),
                      Text(user.email ?? user.phoneNumber ?? 'User'),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (userProviders.contains('phone'))
                            const Icon(Icons.phone),
                          if (userProviders.contains('password'))
                            const Icon(Icons.mail),
                          if (userProviders.contains('google.com'))
                            SizedBox(
                              width: 24,
                              child: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png',
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                        ),
                        onPressed: _signOut,
                        child: const Text('Sign out'),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.directional(
                textDirection: Directionality.of(context),
                end: 50,
                top: 50,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: !showSaveButton
                      ? SizedBox(key: UniqueKey())
                      : TextButton(
                          onPressed: isLoading ? null : updateDisplayName,
                          child: const Text('Save changes'),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> getPhotoURLFromUser() async {
    String? photoURL;

    // Update the UI - wait for the user to enter the SMS code
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('New image Url:'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
            OutlinedButton(
              onPressed: () {
                photoURL = null;
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
          content: Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onChanged: (value) {
                photoURL = value;
              },
              textAlign: TextAlign.center,
              autofocus: true,
            ),
          ),
        );
      },
    );

    return photoURL;
  }

  /// Example code for sign out.
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut().then((_) {
      Navigator.of(context).pushReplacementNamed(LOGIN_PAGE);
    });
    await GoogleSignIn().signOut();
  }
}
