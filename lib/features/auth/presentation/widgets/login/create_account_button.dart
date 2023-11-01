import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:chat/core/utils/config/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateNewAccount extends StatelessWidget {
  const CreateNewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Align(
        child: TextButton(
          onPressed: () => context.push(AppRouter.signUp),
          child: Text(S.of(context).createNewAccount),
        ),
      ),
    );
  }
}