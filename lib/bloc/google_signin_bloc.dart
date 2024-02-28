import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class GoogleLoginEvent extends Equatable {
  const GoogleLoginEvent();

  @override
  List<Object> get props => [];
}

class GoogleLoginButtonPressed extends GoogleLoginEvent {}

abstract class GoogleLoginState extends Equatable {
  const GoogleLoginState();

  @override
  List<Object> get props => [];
}

class GoogleLoginInitial extends GoogleLoginState {}

class GoogleLoginLoading extends GoogleLoginState {}

class GoogleLoginSuccess extends GoogleLoginState {
  final String displayName;

  const GoogleLoginSuccess({required this.displayName});

  @override
  List<Object> get props => [displayName];
}

class GoogleLoginError extends GoogleLoginState {
  final String message;

  const GoogleLoginError({required this.message});

  @override
  List<Object> get props => [message];
}

class GoogleLoginBloc extends Bloc<GoogleLoginEvent, GoogleLoginState> {
  GoogleLoginBloc() : super(GoogleLoginInitial()) {
    on<GoogleLoginEvent>((event, emit) async {
      if (event is GoogleLoginButtonPressed) {
        emit(GoogleLoginLoading());
        try {
          GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
          GoogleSignInAuthentication? googleAuth =
              await googleUser?.authentication;

          if (googleAuth?.accessToken == null && googleAuth?.idToken == null) {
            emit(
                const GoogleLoginError(message: "google login canced by user"));
          } else {
            AuthCredential credential = GoogleAuthProvider.credential(
                accessToken: googleAuth?.accessToken,
                idToken: googleAuth?.idToken);
            UserCredential userCredential =
                await FirebaseAuth.instance.signInWithCredential(credential);

            if (userCredential.user != null) {
              emit(GoogleLoginSuccess(
                  displayName: userCredential.user?.displayName ?? "No Name"));
            } else {
              emit(const GoogleLoginError(message: "No User found"));
            }
          }
        } on Exception catch (e) {
          emit(GoogleLoginError(message: e.toString()));
        }
      }
    });
  }
}
