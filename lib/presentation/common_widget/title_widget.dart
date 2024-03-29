import 'package:flutter/material.dart';

import '../../common/utils.dart';
import '../theme/app_text_theme.dart';

class InputTitleWidget extends StatelessWidget {
  const InputTitleWidget({
    super.key,
    required this.title,
    this.required = true,
    this.style,
  });

  final String? title;
  final bool required;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return RichText(
      text: TextSpan(
        text: title,
        style: style ?? textTheme.inputTitle,
        children: [
          if (required)
            TextSpan(
              text: ' *',
              style: textTheme.inputRequired,
            ),
        ],
      ),
    );
  }
}
