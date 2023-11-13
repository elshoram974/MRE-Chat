import 'package:chat/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCubit cubit = context.read<HomeCubit>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("${cubit.getUser()?.displayName}"),
        leading: IconButton(
          onPressed: cubit.signOut,
          icon: const Icon(Icons.logout_outlined),
        ),
      ),
    );
  }
}
