import 'package:flutter/material.dart';
import 'package:flutter_base_start/future/splash/cubit/version_control_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<VersionControlCubit, VersionControlState>(
        listener: _handleVersionControlState,
        child: _buildLoadingContent(),
      ),
    );
  }

  void _handleVersionControlState(
    BuildContext context,
    VersionControlState state,
  ) {
    if (state is VersionControlLoaded) {
      final targetRoute = state.version ? 'HomeView' : 'VersionUpdate';
      context.goNamed(targetRoute);
    }
  }

  Widget _buildLoadingContent() {
    return Center(
      child: Assets.lottie.premiumAnimation.lottie(
        height: 200,
        width: 200,
        package: 'gen',
      ),
    );
  }
}
