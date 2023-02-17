import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        const SizedBox(width: 7),
        Text(LocaleKeys.divider_or).tr(),
        const SizedBox(width: 7),
        Expanded(child: Divider()),
      ],
      mainAxisSize: MainAxisSize.max,
    );
  }
}
