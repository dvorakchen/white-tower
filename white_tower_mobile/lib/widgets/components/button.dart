import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:white_tower_mobile/themes/app_colors.dart';

enum ButtonType { success, wrong }

class Button extends HookConsumerWidget {
  final void Function()? onPress;
  final String label;
  final ButtonType type;

  const Button({
    super.key,
    required this.onPress,
    required this.label,
    this.type = .success,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = ref.read(appThemeProvider);

    var btnBgColor = cs.success;
    var btnTxtColor = cs.successContent;
    var btnBdrColor = Color.lerp(cs.success, Colors.black, 0.5)!;

    if (type == .wrong) {
      btnBgColor = cs.error;
      btnTxtColor = cs.errorContent;
      btnBdrColor = Color.lerp(cs.error, Colors.black, 0.5)!;
    }

    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 50,
        padding: .all(5),
        decoration: BoxDecoration(
          color: btnBgColor,
          border: Border(bottom: BorderSide(color: btnBdrColor, width: 3)),
          borderRadius: .circular(15),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20,
              color: btnTxtColor,
              fontWeight: .w800,
            ),
          ),
        ),
      ),
    );
  }
}
