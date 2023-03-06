import 'package:casio_calculator/home/components/keypad.dart';
import 'package:casio_calculator/utils/color_constants.dart';
import 'package:casio_calculator/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeView extends HookWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() { });

    final scale = useState<double>(1 - animationController.value);

    void tapDown(TapDownDetails details) {
      // print(scale);
      animationController.forward();
    }

    void tapUp(TapUpDetails details) {
      print(scale);
    animationController.reverse();
  }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'C A S I O',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 5),
                      Text('CALCULATOR', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Wrap(
                    spacing: 5,
                    children: [
                      _casioLedBox(),
                      _casioLedBox(),
                      _casioLedBox(),
                      _casioLedBox(),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: size.width,
                height: 230,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: SingleChildScrollView(
                  child: StaggeredGrid.count(
                    axisDirection: AxisDirection.down,
                    crossAxisCount: 4,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                      // childAspectRatio: 1.03
                    children: [
                      ...keypadTexts.map((keypad) {
                        final crossAxisCellCount = keypad.text == '0' ? 2 : 1;
                        return StaggeredGridTile.count(
                          crossAxisCellCount: crossAxisCellCount,
                          mainAxisCellCount: 1,
                          child: GestureDetector(
                            onTapDown: tapDown,
                            onTapUp: tapUp,
                            child: Transform.scale(
                              scale: scale.value,
                              child: Keypad(keypadModel: keypad),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _casioLedBox() {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5),
        borderRadius: BorderRadius.circular(2),
        color: kLightGrayColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurStyle: BlurStyle.solid,
            offset: Offset(2.5, 2.5),
          ),
        ],
      ),
    );
  }
}
