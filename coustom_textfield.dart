//Dışarıdan aldığı parametler sayesinde hem email hem de password kısmında kullanılabilir
//Bool deger sayesinde password kısmında Göz ikonu aktif hale geliyor(sifreyi gizlemek veye görmek için)

import 'package:facebook_app/constant/giris_kismi_sabitler/colors.dart';
import 'package:flutter/material.dart';

class CoustomTextField extends StatefulWidget {
  final String labeltext;
  final TextEditingController textfieldController;
  final bool isEmailPassword;

  const CoustomTextField({
    Key? key,
    required this.labeltext,
    required this.textfieldController,
    required this.isEmailPassword,
  }) : super(key: key);

  @override
  State<CoustomTextField> createState() => _CoustomTextFieldState();
}

class _CoustomTextFieldState extends State<CoustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    const double kenarradius = 15;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextField(
        obscureText: widget.isEmailPassword ? false : _obscureText,
        controller: widget.textfieldController,
        textInputAction: TextInputAction.next,
        keyboardType: widget.isEmailPassword
            ? TextInputType.emailAddress
            : TextInputType.visiblePassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: ProjectColor2.beyaz,
          contentPadding: PaddingCoustom()._edgeInsets,
          enabledBorder: enabledBorder(kenarradius),
          focusedBorder: focusedBorder(kenarradius),
          label: labelText(),
          border: border(kenarradius),
          suffixIcon:
              widget.isEmailPassword ? const SizedBox() : passwordGozukme(),
        ),
      ),
    );
  }

  GestureDetector passwordGozukme() {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          _obscureText = false;
        });
      },
      onLongPressUp: () {
        setState(() {
          _obscureText = true;
        });
      },
      child: Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility_outlined,
        color: ProjectColor2.grey3,
      ),
    );
  }

  OutlineInputBorder border(double kenarradius) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(kenarradius)),
    );
  }

  Text labelText() {
    return Text(
      widget.labeltext,
      style: TextStyle(
        color: ProjectColor2.grey3,
      ),
    );
  }

  OutlineInputBorder focusedBorder(double kenarradius) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: ProjectColor2.grey3),
      borderRadius: BorderRadius.all(Radius.circular(kenarradius)),
    );
  }

  OutlineInputBorder enabledBorder(double kenarradius) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: ProjectColor2.grey2),
      borderRadius: BorderRadius.all(Radius.circular(kenarradius)),
    );
  }
}

class PaddingCoustom {
  final EdgeInsets _edgeInsets = const EdgeInsets.all(23);
}
