import 'package:flutter/material.dart';
import 'package:white_tower_mobile/themes/common.dart';

enum ButtonType {
  primary,
  primarySoft,
  secondary,
  secondarySoft,
  tertiary,
  tertiarySoft,
  surface,
  error,
  errorSoft,
}

class Button extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final double width;
  final ButtonType type;
  final bool disabled;

  const Button({
    super.key,
    required this.text,
    this.onPressed,
    this.width = 150,
    this.type = ButtonType.surface,
    this.disabled = false,
  });

  @override
  State<Button> createState() => _ButtonState();
}

typedef _ButtonPalette = ({
  Color bodyColor,
  Color textColor,
  Color borderColor,
});

class _ButtonState extends State<Button> {
  bool _isPressed = false;

  static const double _initialBodyHeight = 45.0; // 按钮主体固定高度
  static const double _initialBorderHeight = 4.0; // 底部立体边框的高度/厚度

  static const double _buttonTotalHeight =
      _initialBodyHeight + _initialBorderHeight;

  static const double _pressedBorderHeight = 0.0;

  void _onTapDown(TapDownDetails details) {
    if (widget.disabled) {
      return;
    }
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    widget.onPressed?.call();

    if (mounted) {
      setState(() {
        _isPressed = false;
      });
    }
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  // 核心逻辑：根据 ButtonType 确定按钮的主色和文字色

  @override
  Widget build(BuildContext context) {
    final double currentBottomBorder = _isPressed
        ? _pressedBorderHeight
        : _initialBorderHeight;

    final colorScheme = Theme.of(context).colorScheme;

    final _ButtonPalette palette = widget.disabled
        ? (bodyColor: disabled, textColor: onDisabled, borderColor: disabled)
        : _getButtonPalette(colorScheme, widget.type);

    final BoxBorder? border = widget.type == .surface
        ? Border.all(color: palette.borderColor, width: 0.5)
        : null;

    final width = super.widget.width;

    final double verticalPadding = _isPressed ? _initialBorderHeight : 0.0;

    return SizedBox(
      height: _buttonTotalHeight,
      width: width,

      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: .only(top: verticalPadding),
            child: Container(
              height: _initialBodyHeight,
              width: width,

              decoration: BoxDecoration(
                color: palette.bodyColor,
                borderRadius: BorderRadius.circular(13.0),
                border: border,
                boxShadow: [
                  BoxShadow(
                    color: palette.borderColor,
                    offset: Offset(0, currentBottomBorder),
                    blurRadius: 0,
                    spreadRadius: 0,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                widget.text,
                style: TextStyle(color: palette.textColor, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_ButtonPalette _getButtonPalette(ColorScheme colorScheme, ButtonType type) {
  late _ButtonPalette palette;

  switch (type) {
    case .primary:
      var bodyColor = colorScheme.primary;
      palette = (
        bodyColor: colorScheme.primary,
        textColor: colorScheme.onPrimary,
        borderColor: Color.lerp(bodyColor, Colors.black, 0.1)!,
      );
      break;
    case .primarySoft:
      palette = (
        bodyColor: colorScheme.primaryContainer,
        textColor: colorScheme.onPrimaryContainer,
        borderColor: colorScheme.primary,
      );
      break;
    case .secondary:
      var bodyColor = colorScheme.secondary;
      palette = (
        bodyColor: colorScheme.secondary,
        textColor: colorScheme.onSecondary,
        borderColor: Color.lerp(bodyColor, Colors.black, 0.1)!,
      );
      break;
    case .secondarySoft:
      palette = (
        bodyColor: colorScheme.secondaryContainer,
        textColor: colorScheme.onSecondaryContainer,
        borderColor: colorScheme.secondary,
      );
      break;
    case .tertiary:
      var bodyColor = colorScheme.tertiary;
      palette = (
        bodyColor: colorScheme.tertiary,
        textColor: colorScheme.onTertiary,
        borderColor: Color.lerp(bodyColor, Colors.black, 0.1)!,
      );
      break;
    case .tertiarySoft:
      palette = (
        bodyColor: colorScheme.tertiaryContainer,
        textColor: colorScheme.onTertiaryContainer,
        borderColor: colorScheme.tertiary,
      );
      break;
    case .surface:
      var bodyColor = colorScheme.surface;
      palette = (
        bodyColor: colorScheme.surface,
        textColor: colorScheme.onSurface,
        borderColor: Color.lerp(bodyColor, Colors.black, 0.2)!.withAlpha(200),
      );
      break;
    case .error:
      var bodyColor = colorScheme.error;
      palette = (
        bodyColor: colorScheme.error,
        textColor: colorScheme.onError,
        borderColor: Color.lerp(bodyColor, Colors.black, 0.1)!,
      );
      break;
    case .errorSoft:
      palette = (
        bodyColor: colorScheme.errorContainer,
        textColor: colorScheme.onErrorContainer,
        borderColor: colorScheme.error,
      );
      break;
  }

  return palette;
}
