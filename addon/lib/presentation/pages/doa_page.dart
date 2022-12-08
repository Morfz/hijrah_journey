import 'package:addon/presentation/bloc/doa/doa_bloc.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoaPage extends StatefulWidget {
  const DoaPage({Key? key}) : super(key: key);

  @override
  State<DoaPage> createState() => _DoaPageState();
}

class _DoaPageState extends State<DoaPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<DoaBloc>().add(GetDoaListEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Doa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<DoaBloc, DoaState>(
          builder: (context, state) {
            if (state is DoaLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is DoaLoaded) {
              return ListView.builder(
                itemCount: state.result.length,
                itemBuilder: (context, index) {
                  final doa = state.result[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 5,
                    margin: const EdgeInsets.all(5),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        title: Text(
                          doa.doa,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Container(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        child: Text(
                                          doa.ayat,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        child: Text(
                                          doa.latin,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8, top: 5),
                                        child: Text(doa.artinya,
                                            style: const TextStyle(
                                              fontSize: 12,
                                            )),
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is DoaEmpty) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              );
            } else if (state is DoaError) {
              return Center(
                key: const Key('error_message'),
                child: Text(
                  state.message,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
