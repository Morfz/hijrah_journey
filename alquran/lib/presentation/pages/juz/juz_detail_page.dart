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
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
      ),
      body: BlocBuilder<JuzDetailBloc, JuzDetailState>(
          builder: (context, state) {
            if (state is JuzDetailLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is JuzDetailHasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 40, right: 20, bottom: 20),
                          width: MediaQuery.of(context).size.width,
                          color: kPrimaryColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Juz ${state.result.juz}",
                                style: openSansNormal.copyWith(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                "${state.result.juzStartInfo} | ${state.result.juzEndInfo}",
                                style: openSansNormal.copyWith(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
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
