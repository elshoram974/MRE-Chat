import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoLoginButton extends StatelessWidget {
  const GoLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Align(
        child: TextButton(
          onPressed: () => context.pop(),
          child: Text(S.of(context).login),
        ),
      ),
    );
  }
}