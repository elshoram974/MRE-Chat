import 'package:chat/core/utils/constants/assets.dart';
import 'package:chat/core/utils/constants/styles.dart';
import 'package:chat/core/utils/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          (MediaQuery.sizeOf(context).height / 6).hightPadding,
          const Image(image: AssetImage(AppAssets.scholar)),
          const Text('Scholar Chat', style: AppTextStyle.stylePacifico32),
        ],
      ),
    );
  }
}
