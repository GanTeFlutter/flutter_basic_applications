import 'package:facebook_app/constant/giris_kismi_sabitler/colors.dart';
import 'package:flutter/material.dart';

class CoustomElevatedButton extends StatelessWidget {
  final bool truefalse;
  final String textt;
  final void Function()? onPressed;
  const CoustomElevatedButton(
      {super.key,
      required this.truefalse,
      required this.textt,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: truefalse
          ? ElevatedButton.styleFrom(
              backgroundColor: ProjectColor2.facebookblueColor,
            )
          : ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              elevation: MaterialStateProperty.all(0.0),
              side: MaterialStateProperty.all(const BorderSide(
                color: ProjectColor2.facebookblueColor,
              )),
            ),
      child: SizedBox(
          height: 57,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: Text(
            textt,
            style: TextStyle(
              fontSize: 17,
              color: truefalse
                  ? ProjectColor2.beyaz
                  : ProjectColor2.facebookblueColor,
            ),
          ))),
    );
  }
}
