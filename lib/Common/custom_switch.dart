import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';

class CustomSwitch extends StatefulWidget {
  final Function(bool value) onChanged;
  final bool value;
  final double trackWidth;
  final double trackHeight;
  final double toggleWidth;
  final double toggleHeight;
  final Color toggleActiveColor;
  final Color trackInActiveColor;
  final Color trackActiveColor;
  const CustomSwitch({
    required this.onChanged,
    required this.value,
    this.trackHeight = 30,
    this.trackWidth = 63,
    this.toggleWidth =20,
    this.toggleHeight =20,
    this.trackActiveColor = Colors.white,
    this.trackInActiveColor = Colors.white,
    this.toggleActiveColor = VinTeumColors.mainBlue,

  });
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSwitched = !_isSwitched;
        });
      },
      child: Container(
        width: widget.trackWidth,
        height: widget.toggleHeight>widget.trackHeight?widget.toggleHeight:widget.trackHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: widget.trackWidth,
              height: widget.trackHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: VinTeumColors.mainBlue),
                color: _isSwitched ? widget.trackActiveColor : widget.trackInActiveColor,
              ),),
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
              left: _isSwitched ? 35.0 : 10.0,
              child: GestureDetector(
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    double newPosition = details.localPosition.dx;
                    if (newPosition < -10.0) {
                      newPosition = -10.0;
                    } else if (newPosition > 10.0) {
                      newPosition = 10.0;
                    }
                    _isSwitched = newPosition > 0.0;
                  });
                },
                child: Container(
                  width:widget.toggleWidth,
                  height:widget.toggleHeight,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.toggleActiveColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}