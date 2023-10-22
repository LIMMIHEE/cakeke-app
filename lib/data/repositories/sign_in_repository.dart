import 'package:cakeke/data/models/auth/sign_in_response.dart';
import 'package:cakeke/data/providers/sign_in_provider.dart';
import 'package:cakeke/data/repositories/token_repository.dart';

class SignInRepository {
  final SignInProvider signinProvider;
  final TokenRepository tokenRepository = TokenRepository();

  SignInRepository({required this.signinProvider});

  Future<SignInResponse> signin({
    required String id,
    required String password,
  }) async {
    final res = await signinProvider.signin(id: id, password: password);
    await tokenRepository
        .saveAccessToken('${res.grantType} ${res.accessToken}');

    return res;
  }
}
