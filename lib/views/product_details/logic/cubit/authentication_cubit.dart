import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_std/views/auth/logic/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  final SupabaseClient client = Supabase.instance.client;

  // ------------------- LOGIN -------------------
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await client.auth.signInWithPassword(email: email, password: password);
      emit(LoginSuccess());
    } on AuthApiException catch (e) {
      log(e.toString());
      emit(LoginError(e.message));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  // ------------------- REGISTER -------------------
  Future<void> registar({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    try {
      await client.auth.signUp(email: email, password: password);
      await addUserData(name: name, email: email);
      await getUserdata();
      emit(SignUpSuccess());
    } on AuthApiException catch (e) {
      log(e.toString());
      emit(SignUpError(e.message));
    } catch (e) {
      emit(SignUpError(e.toString()));
    }
  }

  // ------------------- GOOGLE SIGN-IN -------------------
  GoogleSignInAccount? googleUser;
  Future<AuthResponse> googleSignIn() async {
    emit(GooglelSignInLoding());
    const webClientId =
        '366738714548-gnaa9l06svjm79gam3rq9dt59eghtufl.apps.googleusercontent.com';
    const androidClientId =
        '366738714548-eqrkpc7ob7moknd7osfutcj2ubjrc85j.apps.googleusercontent.com';
    // final GoogleSignIn googleSignIn = GoogleSignIn(serverClientId: webClientId);
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: kIsWeb ? webClientId : null,
      serverClientId: kIsWeb ? null : androidClientId,
    );

    googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return AuthResponse();
    }

    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      emit(GooglelSignInError());
      return AuthResponse();
    }

    final response = await client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    await addUserData(
      name: googleUser!.displayName ?? 'No Name',
      email: googleUser!.email,
    );

    emit(GoogleSignInSuccess());
    return response;
  }

  // ------------------- SIGN OUT -------------------
  Future<void> signout() async {
    emit(LogoutLoading());
    try {
      await client.auth.signOut();
      emit(LogoutSuccess());
    } catch (e) {
      log(e.toString());
      emit(LogoutError());
    }
  }

  // ------------------- RESET PASSWORD -------------------
  Future<void> resetPassword({required String email}) async {
    emit(PasswordResetLoading());
    try {
      await client.auth.resetPasswordForEmail(email);
      emit(PasswordResetSuccess());
    } catch (e) {
      log(e.toString());
      emit(PasswordResetErorr());
    }
  }

  // ------------------- USER DATA -------------------
  UserDataModel? userDataModel;

  Future<void> addUserData({
    required String name,
    required String email,
  }) async {
    emit(UserDataAdeddLoading());
    try {
      await client.from('users').upsert([
        {
          "user_id": client.auth.currentUser!.id,
          "name": name,
          "email": email,
        }
      ]);

      emit(UserDataAdeddSuccess());
    } catch (e) {
      log('Error inserting data ❌: $e');
      emit(UserDataAdeddErorr());
    }
  }

  Future<void> getUserdata() async {
    emit(GetUserDataLoading());
    try {
      final data = await client
          .from('users')
          .select()
          .eq("user_id", client.auth.currentUser!.id);

      if (data.isNotEmpty) {
        userDataModel = UserDataModel(
          userId: data[0]["user_id"],
          name: data[0]["name"],
          email: data[0]["email"],
        );
        emit(GetUserDataSuccess());
      } else {
        emit(GetUserDataErorr());
      }
    } catch (e) {
      log(e.toString());
      emit(GetUserDataErorr());
    }
  }
}
