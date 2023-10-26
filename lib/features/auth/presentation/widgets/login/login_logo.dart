import 'package:chat/core/utils/constants/assets.dart';
import 'package:chat/core/utils/constants/styles.dart';
import 'package:flutter/material.dart';

class LoginLogo extends SliverToBoxAdapter {
  const LoginLogo({super.key});

  @override
  Widget? get child => const Column(
        children: [
          Image(image: AssetImage(AppAssets.scholar)),
          Text('Scholar Chat', style: AppTextStyle.stylePacifico32),
        ],
      );
}
