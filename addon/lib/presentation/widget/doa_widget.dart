import 'package:addon/domain/entities/doa.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoaWidget extends StatelessWidget {
  final Doa doa;

  const DoaWidget(this.doa, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: InkWell(
        onTap: () {
          // Navigator.pushNamed(
          //   context,
          //   DoaDetailPage.routeName,
          //   arguments: doa.id,
          // );
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                doa.doa ?? '-',
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
