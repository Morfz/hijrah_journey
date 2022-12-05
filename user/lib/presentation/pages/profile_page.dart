import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile-page';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text('Profile'),
        ),
        body: Column(children: [
          const SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                FirebaseAuth.instance.currentUser?.photoURL ??
                    'https://www.pngarts.com/files/10/Default-Profile-Picture-Transparent-Image.png',
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            FirebaseAuth.instance.currentUser?.displayName ?? 'No Name',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Theme.of(context).primaryColor),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Edit Display Name'),
                    content: TextField(
                      controller: TextEditingController(
                          text: FirebaseAuth.instance.currentUser?.displayName),
                      onChanged: (value) {
                        FirebaseAuth.instance.currentUser
                            ?.updateDisplayName(value);
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Edit Name'),
          ),
          //firebase logout button
          const SizedBox(height: 40),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Theme.of(context).primaryColor),
            ),
            onPressed: () {
              final scaffoldMessenger = ScaffoldMessenger.of(context);
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed(LOGIN_PAGE);

              SnackBar snackBar =
                  const SnackBar(content: Text('Logout Successfull'));
              scaffoldMessenger.showSnackBar(snackBar);
            },
            child: const Text('Logout'),
          ),
          //firebase delete account button with alert dialog
          const SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Theme.of(context).primaryColor),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Delete Account'),
                    content: const Text(
                        'Are you sure you want to delete your account?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          final scaffoldMessenger =
                              ScaffoldMessenger.of(context);
                          FirebaseAuth.instance.currentUser!.delete();
                          Navigator.of(context)
                              .pushReplacementNamed(LOGIN_PAGE);

                          SnackBar snackBar =
                              const SnackBar(content: Text('Account Deleted'));
                          scaffoldMessenger.showSnackBar(snackBar);
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Delete Account'),
          ),
        ]));
  }
}
