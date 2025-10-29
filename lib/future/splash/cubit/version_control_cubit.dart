import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'version_control_state.dart';

class VersionControlCubit extends Cubit<VersionControlState> {
  VersionControlCubit(this._service) : super(VersionControlInitial()) {
    checkVersion();
  }

  final VersionControlService _service;

  Future<void> checkVersion() async {
    emit(VersionControlLoading());
    try {
      final version = await _service.checkVersion();
      emit(VersionControlLoaded(version: version));
    } on Exception catch (e) {
      emit(VersionControlError(e.toString()));
    }
  }
}

class VersionControlService {
  Future<bool> checkVersion() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return true;
  }
}
