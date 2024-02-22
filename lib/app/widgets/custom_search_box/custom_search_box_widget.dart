import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../input_primary/input_primary_widget.dart';

class CustomSearchBoxWidget extends StatelessWidget {
  const CustomSearchBoxWidget(
      {Key? key,
      required this.textController,
      required this.onChanged,
      this.btnAction})
      : super(key: key);

  final Function()? btnAction;
  final Function(String) onChanged;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: InputPrimaryWidget(
            keyboardType: TextInputType.text,
            label: "Pesquisar...",
            onChanged: onChanged,
            textController: textController,
            icon: MdiIcons.magnify,
          )),
          SizedBox(
            width: 10.w,
          ),
          if (btnAction != null)
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Theme.of(context).primaryColor),
                onPressed: btnAction,
                child: Text(
                  "Buscar",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.background),
                )),
        ],
      ),
    );
  }
}
