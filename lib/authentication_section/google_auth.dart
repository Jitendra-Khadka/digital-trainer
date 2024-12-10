import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> google_sigin()async{
  final GoogleSignInAccount? selected_acc = await GoogleSignIn().signIn();

  print("This shit is working and what is your problem bitch ................................");

  final GoogleSignInAuthentication? user_data = await selected_acc?.authentication;
  print("This is the value of user_data : $user_data //////////////////////////////>>>>>>>>>>>>>>>>>");

  final user_credential = await GoogleAuthProvider.credential(
    accessToken: user_data?.accessToken,
    idToken: user_data?.idToken
  );

  return FirebaseAuth.instance.signInWithCredential(user_credential);
}

Future<void> logout_google()async{
  FirebaseAuth.instance.signOut();
  print("User have sign out from the app");
}

Future<void> get_data()async{
  final UserCredential user_data = await google_sigin();
  print("This is the name of user ${user_data.user?.displayName}");
}