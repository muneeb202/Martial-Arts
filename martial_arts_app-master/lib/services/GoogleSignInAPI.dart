import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInAPI {
  static final _googleSignIn = GoogleSignIn(
      scopes: ['email'],
      clientId:
          '240736778213-cqd3cpbb006cg9tq84fofnkrvpvqhus0.apps.googleusercontent.com');

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  static Future logout() => _googleSignIn.disconnect();
}
