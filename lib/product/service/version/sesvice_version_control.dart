class VersionControlService {
  Future<String> checkVersion() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return '1.0.0'; // Güncel versiyon
  }
}
