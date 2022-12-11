import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadist/presentation/bloc/list_hadist/list_hadist_bloc.dart';

class ListHadistPage extends StatefulWidget {
  static const routeName = '/list-hadist-page';

  final String id;
  const ListHadistPage({super.key, required this.id});

  @override
  State<ListHadistPage> createState() => _ListHadistPageState();
}

class _ListHadistPageState extends State<ListHadistPage> {
  // bloc surah detail
  late ListHadistBloc _listHadistBloc;
  @override
  void initState() {
    _listHadistBloc = BlocProvider.of<ListHadistBloc>(context);
    _listHadistBloc.add(FetchListHadistEvent(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.filter_list,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              _showBottomSheet(
                // idPeople: arg.idPeople,
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<ListHadistBloc, ListHadistState>(
          builder: (context, state) {
            if (state is ListHadistLoading) {
              return const Center(
                child: CircularProgressIndicator(color: kPrimaryColor,),
              );
            } else if (state is ListHadistError) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is ListHadistHasData) {
              return ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 40, right: 20, bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    color: kPrimaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${state.result.name}",
                          style: openSansNormal.copyWith(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "${state.result.available} Hadist",
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
                        color: index % 2 == 0 ? kBackgroundColor : CupertinoColors.systemGrey6,
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
                                  child: Container(
                                    width: 36,
                                    height: 36,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: greyColor,
                                    ),
                                    child: Text(
                                      "${data.number}",
                                      style: openSansMedium.copyWith(
                                        fontSize: 16,
                                        color: kMikadoYellow,
                                      ),
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
                                        "${data.arab}",
                                        style: arabicFont.copyWith(
                                          fontSize: 24,
                                          letterSpacing: 0.3,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              data.id,
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
              );
            } else if (state is ListHadistError) {
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

  _showBottomSheet(
    // @required String idPeople,
  ) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: new Icon(Icons.photo),
            title: new Text('Photo'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: new Icon(Icons.music_note),
            title: new Text('Music'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: new Icon(Icons.videocam),
            title: new Text('Video'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: new Icon(Icons.share),
            title: new Text('Share'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    });
  }
}
