import 'package:flutter/material.dart';

class AnimatedRoundedTabbarFilled extends StatefulWidget {
  final double borderRadius;
  final Function(int) onTabChange;
  const AnimatedRoundedTabbarFilled({super.key, this.borderRadius = 8, required this.onTabChange});

  @override
  State<AnimatedRoundedTabbarFilled> createState() =>
      _AnimatedRoundedTabbarFilledState();
}

class _AnimatedRoundedTabbarFilledState
    extends State<AnimatedRoundedTabbarFilled> {
  late List<bool> isHoverList = [false, false, false];
  int _currentIndex = 1;
  late final Function(int) onTabChange;

  @override
  void initState() {
    super.initState();
    onTabChange = widget.onTabChange;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        3,
        (index) {
          return InkWell(
            onTap: () {
              setState(() {
                _currentIndex = index;
              });
              onTabChange(index);
            },
            onHover: (value) {
              setState(() {
                isHoverList[index] = value;
              });
            },
            child: AnimatedContainer(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                color: _currentIndex == index || isHoverList[index]
                    ? Theme.of(context).primaryColor
                    : const Color.fromARGB(255, 240, 242, 243)
              ),
              child: Text(
                ['Catalog', 'Statics', 'Articles'][index],
                style: TextStyle(fontSize: 18, color: _currentIndex == index || isHoverList[index] ? Colors.white : Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}
