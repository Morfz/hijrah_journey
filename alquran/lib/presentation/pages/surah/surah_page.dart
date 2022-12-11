import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';
import 'package:alquran/presentation/bloc/surah/surah_bloc.dart';

class SurahPage extends StatefulWidget {
  const SurahPage({super.key});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  // bloc surah
  late SurahBloc _surahBloc;

  @override
  void initState() {
    _surahBloc = BlocProvider.of<SurahBloc>(context);
    _surahBloc.add(FetchSurahEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocBuilder<SurahBloc, SurahState>(
        builder: (context, state) {
          if (state is SurahLoading) {
            return const Center(
              child: CircularProgressIndicator(color: kPrimaryColor,),
            );
          } else if (state is SurahHasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.result.length,
              itemBuilder: (context, int index) {
                final surah = state.result[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      SURAH_DETAIL_PAGE,
                      arguments: surah.number,
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Card(
                          color: kBackgroundColor,
                          elevation: 0.0,
                          child: ListTile(
                            dense: true,
                            leading: Container(
                              width: 36,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(8),
                                color: greenColor4,
                              ),
                              child: Text(
                                surah.number.toString(),
                                style: openSansMedium.copyWith(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            title: Text(
                              surah.transliterationSurah.id,
                              style: openSansNormal.copyWith(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            subtitle: Text(
                              '${surah.revelation.id} | ${surah.translation.id} | ${surah.numberOfVerse} Ayat',
                              style: openSansNormal.copyWith(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(
                                right: 24,
                              ),
                              child: Text(
                                surah.nameSurah.short,
                                textAlign: TextAlign.right,
                                style: arabicFont.copyWith(
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is SurahError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is SurahEmpty) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
