// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_sign_in/google_sign_in.dart';

Future<GoogleLoginResponseStruct> loginWithGoogle() async {
  GoogleLoginResponseStruct googleLoginResp = GoogleLoginResponseStruct();
  try {
    GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          '645660464319-0shaobpkrmkajun0028a1gu3jtanuoh7.apps.googleusercontent.com',
      scopes: <String>[
        'email',
        'profile',
      ],
    );
    GoogleSignInAccount? account = await googleSignIn.signIn();
    if (account != null) {
      googleLoginResp.displayName = account.displayName ?? 'noname';
      googleLoginResp.email = account.email;
      googleLoginResp.id = account.id;
      googleLoginResp.photoUrl = account.photoUrl ?? 'noImage';
      googleLoginResp.image = account.photoUrl ?? 'noImage';
      googleLoginResp.serverAuthCode = account.serverAuthCode ?? 'noname';
      googleLoginResp.responseStatus = true;
      print('User signed in successfully');
    } else {
      googleLoginResp.responseStatus = false;
      googleLoginResp.errorMsg = 'User cancelled sign in';
      print('User cancelled sign in');
    }
  } catch (error) {
    googleLoginResp.responseStatus = false;
    googleLoginResp.errorMsg = 'Error signing in: $error';
    print('Error signing in: $error');
  }
  return googleLoginResp;
}
