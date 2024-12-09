import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> google_sigin()async{
  final GoogleSignInAccount? selected_acc = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? user_data = await selected_acc?.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: user_data?.accessToken,
    idToken: user_data?.idToken
  );

  return FirebaseAuth.instance.signInWithCredential(credential);
}

Future<void> logout_google()async{
  FirebaseAuth.instance.signOut();
  print("User have sign out from the app");
}

Future<void> get_data()async{
  final UserCredential user_data = await google_sigin();
  print("This is the name of user ${user_data.user?.displayName}");
}