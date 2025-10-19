import 'package:envied/envied.dart';

part 'env_dev.g.dart';

@Envied(path: 'assets/env/.dev.env')
abstract class EnvDev {
  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  static final String baseUrl = _EnvDev.baseUrl;

  @EnviedField(varName: 'SUPABASE_URL', obfuscate: true)
  static final String supabaseUrl = _EnvDev.supabaseUrl;
}

//EnvDev.baseUrl,
//EnvDev.supabaseUrl,
