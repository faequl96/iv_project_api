import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
import 'package:iv_project_api/src/core/general_exception.dart';
import 'package:iv_project_model/iv_project_model.dart';

class AuthService {
  final Dio _dio = ApiClient.dio;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<AuthResponse> login(LoginAuthRequest request) async {
    try {
      final response = await _dio.post(AuthEndpoints.login, data: request.toJson());
      return AuthResponse.fromJson(response.data['data']);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        await _googleSignIn.signOut();
        throw GeneralException('Google Sign-In dibatalkan');
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw GeneralException('Google Sign-In gagal mendapatkan token.');
      }

      final OAuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(authCredential);
      final User? user = userCredential.user;
      if (user == null) {
        throw GeneralException('Login gagal, user tidak ditemukan.');
      }

      return user;
    } catch (_) {
      rethrow;
    }
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;
      if (user == null) {
        throw GeneralException('Login gagal, user tidak ditemukan.');
      }

      return user;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> linkingGoogleAndEmail(String email, String password) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        await _googleSignIn.signOut();
        throw GeneralException('Google Sign-In dibatalkan');
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw GeneralException('Google Sign-In gagal mendapatkan token.');
      }

      final OAuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential googleUserCredential = await FirebaseAuth.instance.signInWithCredential(authCredential);
      User? user = googleUserCredential.user;
      if (user == null) {
        throw GeneralException('Login gagal, user tidak ditemukan.');
      }

      if (user.email == email) {
        AuthCredential emailCredential = EmailAuthProvider.credential(email: email, password: password);
        await user.linkWithCredential(emailCredential);
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
    } catch (_) {
      rethrow;
    }
  }
}
