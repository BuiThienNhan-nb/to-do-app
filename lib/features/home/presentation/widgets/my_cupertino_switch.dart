import 'package:flutter/cupertino.dart';
import 'package:to_do_app/config/colors.dart';

class MyCupertinoSwitch extends StatefulWidget {
  bool isOn;

  MyCupertinoSwitch({
    Key? key,
    required this.isOn,
  }) : super(key: key);

  @override
  State<MyCupertinoSwitch> createState() => _MyCupertinoSwitchState();
}

class _MyCupertinoSwitchState extends State<MyCupertinoSwitch> {
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      activeColor: AppColors.echoBlueColor,
      thumbColor: AppColors.endeavourColor,
      value: widget.isOn,
      onChanged: (value) => setState(() => widget.isOn = value),
    );
  }
}
