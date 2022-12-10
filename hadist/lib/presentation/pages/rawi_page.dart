import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      backgroundColor: greenColor5,
      body: BlocBuilder<RawiBloc, RawiState>(
        builder: (context, state) {
          if (state is RawiLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RawiHasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, top: 70),
                  child: Text(
                    'Hadist',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.toDouble(),
                        color:Colors.black
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.result.length,
                      itemBuilder: (context, int index) {
                        final rawi = state.result[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
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
                                  color: greenColor5,
                                  elevation: 0.0,
                                  child: ListTile(
                                    dense: true,
                                    minLeadingWidth: 5,
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
                                        '${index+1}',
                                        style: openSansMedium.copyWith(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      rawi.name,
                                      style: openSansNormal.copyWith(
                                        fontSize: 14,
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
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        );
                      },
                    )
                )
              ],
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
