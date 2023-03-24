import 'package:casio_calculator/model/model.dart';
import 'package:casio_calculator/utils/color_constants.dart';
import 'package:casio_calculator/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class Keypad extends StatefulHookWidget {
  const Keypad({Key? key, required this.keypadModel}) : super(key: key);

  final KeypadModel keypadModel;

  @override
  State<Keypad> createState() => _KeypadState();
}

class _KeypadState extends State<Keypad> {
  @override
  Widget build(BuildContext context) {

    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() { });
    });

    final scale = useState<double>(1 - animationController.value);

    void tapDown(TapDownDetails details) => animationController.forward();

    void tapUp(TapUpDetails details) => animationController.reverse();

    return GestureDetector(
      onTapDown: tapDown,
      onTapUp: tapUp,
      child: Transform.scale(
        scale: 1 - animationController.value,
        child: Container(
          width: kKeypadWidth,
          height: kKeypadHeight,
          decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.circular(10),
            color: kLightGrayColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurStyle: BlurStyle.solid,
                offset: Offset(3.3, 5.5),
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.keypadModel.text,
              style: GoogleFonts.bungee(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: widget.keypadModel.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
