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
  // bloc rawi
  late RawiBloc _rawiBloc;

  @override
  void initState() {
    _rawiBloc = BlocProvider.of<RawiBloc>(context);
    _rawiBloc.add(FetchRawiEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Hadist',
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
                final rawi = state.result[index];
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
                                color: greyColor,
                              ),
                              child: Text(
                                "${index+1}",
                                style: openSansMedium.copyWith(
                                  fontSize: 16,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                            title: Text(
                              rawi.name,
                              style: openSansNormal.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            trailing: Text(
                              '${rawi.available}',
                              style: openSansNormal.copyWith(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                        color: Colors.grey,
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
