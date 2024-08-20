import 'package:flutter/material.dart';
import 'package:frontend/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final bool disabled;
  final String text;

  const FormButton({
    super.key,
    required this.disabled,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size5),
          color:
              disabled ? Colors.grey.shade300 : Theme.of(context).primaryColor,
        ),
        duration: Duration(milliseconds: 500),
        child: AnimatedDefaultTextStyle(
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
          style: TextStyle(
            color: disabled ? Colors.grey.shade400 : Colors.red,
            fontWeight: FontWeight.w600,
          ),
          duration: Duration(milliseconds: 500),
        ),
      ),
    );
  }
}
