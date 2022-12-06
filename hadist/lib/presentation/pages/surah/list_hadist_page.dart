import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadist/common/style_text_theme.dart';
import 'package:hadist/domain/entities/list_hadist.dart';
import 'package:hadist/presentation/bloc/list_hadist/list_hadist_bloc.dart';

import '../../../common/color_theme.dart';

class SurahDetailPage extends StatefulWidget {
  final String id;
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
        elevation: 0.0,
        title: Text(
          'Surah',
          style: openSansMedium,
        ),
      ),
      body: BlocBuilder<SurahDetailBloc, SurahDetailState>(
          builder: (context, state) {
            if (state is SurahDetailLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SurahDetailHasData) {
              // final juz = state.result.name;
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
                    color: blueColor,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${state.result.name}",
                          style: openSansMedium.copyWith(
                            fontSize: 16,
                            letterSpacing: 0.3,
                            color: whiteColor,
                          ),
                        ),
                        // Text(
                        //   "Juz ${juz?.meta?.juz}",
                        //   style: openSansMedium.copyWith(
                        //     fontSize: 16,
                        //     letterSpacing: 0.3,
                        //     color: whiteColor,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        // if (state.result.preBismillah?.text?.arab?.isNotEmpty ==
                        //     true) ...[
                        //   Container(
                        //     color: Colors.transparent,
                        //     alignment: Alignment.center,
                        //     height: 54,
                        //     width: double.infinity,
                        //     child: Text(
                        //       state.result.hadiths.arab ?? "",
                        //       style: arabicFont.copyWith(
                        //         fontSize: 30,
                        //       ),
                        //       textAlign: TextAlign.center,
                        //     ),
                        //   ),
                        // ],
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.result.hadiths.length,
                          itemBuilder: (context, int index) {
                            final data = state.result.hadiths[index];
                            return Container(
                              padding: const EdgeInsets.only(
                                top: 12,
                                left: 20,
                                right: 20,
                                bottom: 16,
                              ),
                              color: index % 2 == 0 ? blueColor3 : whiteColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Expanded(
                                      //   flex: 1,
                                      //   child: Text(
                                      //     '${data?.number?.inSurah}.',
                                      //     style: robotMonoNormal.copyWith(
                                      //       fontSize: 14,
                                      //     ),
                                      //   ),
                                      // ),
                                      Expanded(
                                        flex: 7,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "${data?.arab}",
                                              style: arabicFont.copyWith(
                                                fontSize: 30,
                                                letterSpacing: 0.3,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                            // Text(
                                            //   data?.text?.transliteration?.en ??
                                            //       "",
                                            //   style: openSansNormal.copyWith(
                                            //     fontSize: 14,
                                            //     letterSpacing: 0.3,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    data?.id ?? "",
                                    style: openSansNormal.copyWith(
                                      fontSize: 14,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          // context.read<SurahLocalBloc>().add(
                                          //   RemoveSurahEvent(
                                          //     state.result,
                                          //     data ?? VerseSurah(),
                                          //   ),
                                          // );
                                        },
                                        icon: const Icon(
                                          Icons.bookmark_border_outlined,
                                          size: 16,
                                        ),
                                      ),
                                    ],
                                  )
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
