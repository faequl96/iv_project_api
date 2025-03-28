import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iv_project_api/src/core/api_client.dart';
import 'package:iv_project_api/src/core/api_exception.dart';
import 'package:iv_project_api/src/core/endpoints.dart';
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
        throw Exception('Google Sign-In dibatalkan');
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw Exception('Google Sign-In gagal mendapatkan token.');
      }

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
      final User? user = userCredential.user;
      if (user == null) {
        throw Exception('Login gagal, user tidak ditemukan.');
      }

      return user;
    } on FirebaseAuthException catch (error) {
      throw Exception('Firebase Login Error: ${error.message}');
    } catch (error) {
      throw Exception('Terjadi kesalahan saat login: $error');
    }
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;
      if (user == null) {
        throw Exception('Login gagal, user tidak ditemukan.');
      }

      return user;
    } on FirebaseAuthException catch (error) {
      throw Exception('Firebase Login Error: ${error.message}');
    } catch (error) {
      throw Exception('Terjadi kesalahan saat login: $error');
    }
  }
}
