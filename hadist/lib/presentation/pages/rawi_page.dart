import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadist/common/color_theme.dart';
import 'package:core/core.dart';
import 'package:hadist/common/style_text_theme.dart';
import 'package:hadist/presentation/bloc/rawi/rawi_bloc.dart';

class RawiPage extends StatefulWidget {
  const RawiPage({super.key});

  @override
  State<RawiPage> createState() => _RawiPageState();
}

class _RawiPageState extends State<RawiPage> {
  // bloc surah
  late RawiBloc _surahBloc;

  @override
  void initState() {
    _surahBloc = BlocProvider.of<RawiBloc>(context);
    _surahBloc.add(FetchRawiEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Al-Quran',
          style: openSansMedium,
        ),
      ),
      body: BlocBuilder<RawiBloc, RawiState>(
        builder: (context, state) {
          if (state is RawiLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RawiHasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.result.length,
              itemBuilder: (context, int index) {
                final surah = state.result[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      LIST_HADIST_PAGE,
                      arguments: state.result[index].id,
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Card(
                          elevation: 0.0,
                          child: ListTile(
                            dense: true,
                            minLeadingWidth: 5,
                            leading: Container(
                              width: 36,
                              height: 36,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: greyColor1,
                              ),
                              // child: Text(
                              //   surah.number.toString(),
                              //   style: openSansMedium.copyWith(
                              //     fontSize: 16,
                              //     color: blueColor,
                              //   ),
                              // ),
                            ),
                            title: Text(
                              surah.name,
                              style: openSansNormal.copyWith(
                                fontSize: 14,
                                color: blackColor,
                              ),
                            ),
                            subtitle: Text(
                              '${surah.available}',
                              style: openSansNormal.copyWith(
                                fontSize: 12,
                                color: blackColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                        color: greyColor1,
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is RawiError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is RawiEmpty) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
