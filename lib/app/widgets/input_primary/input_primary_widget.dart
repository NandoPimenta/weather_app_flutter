import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class InputPrimaryWidget extends StatelessWidget {
     InputPrimaryWidget(
      {super.key,
       this.icon,
      required this.label,
      required this.textController,
      required this.onChanged,
      this.lines = 1,
      this.isPassword = false,
      this.keyboardType = TextInputType.text});
  final String label;
  final IconData? icon;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController textController;
  final Function(String) onChanged;
  final int lines;
  final ValueNotifier<bool> showPassword = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: showPassword,
      builder: (context,w) {
        return TextField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  keyboardType: keyboardType,
                  controller: textController,
                  onChanged: onChanged,
                  maxLines: lines,
                  obscureText: !showPassword.value && isPassword,
                  decoration: InputDecoration(
                    hintText: label,
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    prefixIcon:
                    icon == null 
                    ? null
                    : Icon(
                     icon,
                      color: Theme.of(context).primaryColor,
                    ),
                        suffixIcon: !isPassword
                    ? null
                    : GestureDetector(
                            onTap: () {
                              showPassword.value = !showPassword.value;
                            },
                            child: Icon(
                            showPassword.value?  MdiIcons.eye
                             : MdiIcons.eyeOffOutline,
                              color:
                              showPassword.value?
                               Theme.of(context).primaryColor :
                               Theme.of(context).hintColor,
                            )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Theme.of(context).hintColor, width: 1)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Theme.of(context).hintColor, width: 1),
                    ),
                  ),
                );
      }
    );
  }
}