import 'package:alquran/presentation/pages/juz/juz_page.dart';
import 'package:alquran/presentation/pages/surah/surah_page.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({Key? key}) : super(key: key);

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.only(left: 20, top: 50),
              child: Text(
                'Al-Quran',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.toDouble(),
                    color:Colors.black
                ),
              ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 45,
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TabBar(
              indicatorColor: kPrimaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(text: 'Surah'),
                Tab(text: 'Juz')
              ],
            ),
          ),
          Expanded(
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    SurahPage(),
                    JuzPage()
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}