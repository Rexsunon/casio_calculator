import 'package:casio_calculator/model/model.dart';
import 'package:casio_calculator/utils/color_constants.dart';
import 'package:casio_calculator/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Keypad extends StatelessWidget {
  const Keypad({Key? key, required this.keypadModel}) : super(key: key);

  final KeypadModel keypadModel;

  @override
  Widget build(BuildContext context) {
    double kKeypadWidth = 80;
    double kKeypadShadowWidth = 78;
    double kKeypadShadowHeight = 75;
    double kKeypadHeight = 75;

    if (keypadModel.text == '0') {
      kKeypadWidth = 182;
      kKeypadShadowWidth = 178;
    }

    return SizedBox(
      width: 100,
      height: 80,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: kKeypadShadowWidth,
              height: kKeypadShadowHeight,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: kJetBlackColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: kKeypadWidth,
              height: kKeypadHeight,
              decoration: BoxDecoration(
                border: Border.all(width: 3),
                borderRadius: BorderRadius.circular(10),
                color: kLightGrayColor,
              ),
              child: Center(
                child: Text(
                  keypadModel.text,
                  style: GoogleFonts.bungee(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: keypadModel.color,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
