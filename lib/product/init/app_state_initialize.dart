import 'package:flutter/material.dart';
import 'package:flutter_base_start/product/service/notification/bloc/notification_bloc.dart';
import 'package:flutter_base_start/product/service/version/cubit/version_control_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///[StateInitialize] app genelinde kullanılacak olan blocProviderlarımızı burada başlatıyoruz
class StateInitialize extends StatelessWidget {
  const StateInitialize({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VersionControlCubit(VersionControlService()),
        ),
        BlocProvider(
          create: (context) => NotificationBloc(),
        ),
      ],
      child: child,
    );
  }
}

// VersionControlService tek bir service te kullanıldığı için getit eklemedim
