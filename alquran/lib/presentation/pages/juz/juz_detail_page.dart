import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';
import 'package:alquran/presentation/bloc/juz_detail/juz_detail_bloc.dart';

class JuzDetailPage extends StatefulWidget {
  final int id;
  const JuzDetailPage({super.key, required this.id});

  @override
  State<JuzDetailPage> createState() => _JuzDetailPageState();
}

class _JuzDetailPageState extends State<JuzDetailPage> {
  // bloc surah detail
  late JuzDetailBloc _surahDetailBloc;
  @override
  void initState() {
    _surahDetailBloc = BlocProvider.of<JuzDetailBloc>(context);
    _surahDetailBloc.add(FetchJuzDetailEvent(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Surah',
          style: openSansMedium,
        ),
      ),
      body: BlocBuilder<JuzDetailBloc, JuzDetailState>(
          builder: (context, state) {
            if (state is JuzDetailLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is JuzDetailHasData) {
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
                        // Text(
                        //   "${state.result.name?.transliteration?.id}",
                        //   style: openSansMedium.copyWith(
                        //     fontSize: 16,
                        //     letterSpacing: 0.3,
                        //     color: whiteColor,
                        //   ),
                        // ),
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
                              color: index % 2 == 0 ? Colors.black12 : Colors.white,
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
            } else if (state is JuzDetailError) {
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
