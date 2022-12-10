import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';
import 'package:alquran/presentation/bloc/surah_detail/surah_detail_bloc.dart';

class SurahDetailPage extends StatefulWidget {
  final int id;
  const SurahDetailPage({super.key, required this.id});

  @override
  State<SurahDetailPage> createState() => _SurahDetailPageState();
}

class _SurahDetailPageState extends State<SurahDetailPage> {
  // bloc surah detail
  late SurahDetailBloc _surahDetailBloc;
  @override
  void initState() {
    _surahDetailBloc = BlocProvider.of<SurahDetailBloc>(context);
    _surahDetailBloc.add(FetchSurahDetailEvent(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
      ),
      body: BlocBuilder<SurahDetailBloc, SurahDetailState>(
          builder: (context, state) {
            if (state is SurahDetailLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SurahDetailHasData) {
              final juz = state.result.verses?.first;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 32,
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 18,
                    ),
                    width: double.infinity,
                    color: kPrimaryColor,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${state.result.name?.transliteration?.id}",
                          style: openSansMedium.copyWith(
                            fontSize: 16,
                            letterSpacing: 0.3,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Juz ${juz?.meta?.juz}",
                          style: openSansMedium.copyWith(
                            fontSize: 16,
                            letterSpacing: 0.3,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        if (state.result.preBismillah?.text?.arab?.isNotEmpty ==
                            true) ...[
                          Container(
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            height: 54,
                            width: double.infinity,
                            child: Text(
                              state.result.preBismillah?.text?.arab ?? "",
                              style: arabicFont.copyWith(
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.result.verses?.length,
                          itemBuilder: (context, int index) {
                            final data = state.result.verses?[index];
                            return Container(
                              padding: const EdgeInsets.only(
                                top: 12,
                                left: 20,
                                right: 20,
                                bottom: 16,
                              ),
                              color: index % 2 == 0 ? kBackgroundColor : Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          '${data?.number?.inSurah}.',
                                          style: robotMonoNormal.copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 7,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "${data?.text?.arab}",
                                              style: arabicFont.copyWith(
                                                fontSize: 30,
                                                letterSpacing: 0.3,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                            Text(
                                              data?.text?.transliteration?.en ??
                                                  "",
                                              style: openSansNormal.copyWith(
                                                fontSize: 14,
                                                letterSpacing: 0.3,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    data?.translation?.id ?? "",
                                    style: openSansNormal.copyWith(
                                      fontSize: 14,
                                      letterSpacing: 0.3,
                                    ),
                                  ),

                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else if (state is SurahDetailError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Container();
            }
          },
        ),
      );
  }
}
