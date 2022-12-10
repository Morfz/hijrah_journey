import 'package:addon/presentation/pages/doa_page.dart';
import 'package:addon/presentation/pages/kiblat_page.dart';
import 'package:addon/presentation/pages/tasbih_page.dart';
import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sholat/data/api/api_waktu_sholat.dart';
import 'package:sholat/presentation/pages/waktu_sholat.dart';
import 'package:sholat/presentation/providers/harian_waktu_sholat_provider.dart';
import 'package:addon/presentation/pages/asmaulhusna_page.dart';
import 'package:addon/presentation/pages/niatshalat_page.dart';

class PageMain extends StatefulWidget {
  const PageMain({Key? key}) : super(key: key);

  @override
  _PageMainState createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  final User? _user = FirebaseAuth.instance.currentUser;

  String _displayName() {
    if (_user?.displayName == null) {
      return '';
    } else {
      return _user!.displayName!;
    }
  }

  String _time() {
    final now = DateTime.now();
    final formatter = DateFormat('HH:mm');
    final formatted = formatter.format(now);
    return formatted;
  }

  String _date() {
    final now = DateTime.now();
    final formatter = DateFormat('dd-MM-yyyy');
    final formatted = formatter.format(now);
    return formatted;
  }

  @override
  void initState() {
    super.initState();
    _time();
    _date();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          HarianJadwalSholatProvider(apiService: WaktuSholatApiService()),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Material(
              color: kPrimaryColor,
              child: Container(
                margin: const EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Assalamu'alaikum, "+ _displayName(),
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      // height: Get.width / 2,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Consumer<HarianJadwalSholatProvider>(
                          builder: (context, state, _) {
                        if (state.state == ResultState.loading) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ));
                        } else if (state.state == ResultState.hasData) {
                          var list = state.status.praytimes.values.toList();
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    child: const Icon(
                                      Icons.place,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      state.status.location,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    DateFormat("dd MMM yyyy")
                                        .format(DateTime.now()),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 12),
                                child: Column(
                                  children: [
                                    Text(
                                      _time(),
                                      style: const TextStyle(
                                        fontSize: 32,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                          "Subuh",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Text(
                                          list[state.days].fajr,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          "Dzuhur",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Text(
                                          list[state.days].dhuhr,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          "Ashar",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Text(
                                          list[state.days].asr,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          "Maghrib",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Text(
                                          list[state.days].fajr,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          "Isya",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Text(
                                          list[state.days].ishaA,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else if (state.state == ResultState.noData) {
                          return Center(
                            child: Material(
                              child: Text(state.message),
                            ),
                          );
                        } else if (state.state == ResultState.error) {
                          return Center(
                            child: Material(
                              child: Text(state.message),
                            ),
                          );
                        } else {
                          return const Center(
                            child: Material(
                              child: Text(''),
                            ),
                          );
                        }
                      }),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      alignment: Alignment.topCenter,
                      child: Container(
                        alignment: Alignment.center,
                        height: 300,
                        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                            bottom: Radius.circular(20),
                          ),
                        ),
                          child: Wrap(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.5, 10, 8.5, 10),
                                child: Expanded(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/doaa.png",
                                        width: 60,
                                        height: 60,
                                      ),
                                      const Text("Doa Harian"),
                                      OutlinedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const DoaPage()),
                                          );
                                        },
                                        child: const Text("Pilih"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.5, 10, 8.5, 10),
                                child: Expanded(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/sujud.png",
                                        width: 60,
                                        height: 60,
                                      ),
                                      const Text("Jadwal Shalat"),
                                      OutlinedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const WaktuSholatPage()),
                                          );
                                        },
                                        child: const Text("Pilih"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.5, 10, 8.5, 10),
                                child: Expanded(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/carpet.png",
                                        width: 60,
                                        height: 60,
                                      ),
                                      const Text("Niat Shalat"),
                                      OutlinedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const NiatShalatPage()),
                                          );
                                        },
                                        child: const Text("Pilih"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.5, 10, 8.5, 10),
                                child: Expanded(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/kiblat.png",
                                        width: 60,
                                        height: 60,
                                      ),
                                      const Text("Arah Kiblat"),
                                      OutlinedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const KiblatPage()),
                                          );
                                        },
                                        child: const Text("Pilih"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.5, 10, 8.5, 10),
                                child: Expanded(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/tasbih.png",
                                        width: 60,
                                        height: 60,
                                      ),
                                      const Text("The Tasbih"),
                                      OutlinedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TasbihPage()),
                                          );
                                        },
                                        child: const Text("Pilih"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.5, 10, 8.5, 10),
                                child: Expanded(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/asmaicon.png",
                                        width: 60,
                                        height: 60,
                                      ),
                                      const Text("Asmaul Husna"),
                                      OutlinedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const AsmaulHusnaPage()),
                                          );
                                        },
                                        child: const Text("Pilih"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
