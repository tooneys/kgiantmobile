import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kgiantmobile/navigation_menu.dart';
import 'package:kgiantmobile/src/data/repositories/user/user_repository.dart';
import 'package:kgiantmobile/src/exceptions/firebase_auth_exceptions.dart';
import 'package:kgiantmobile/src/exceptions/firebase_exceptions.dart';
import 'package:kgiantmobile/src/exceptions/format_exceptions.dart';
import 'package:kgiantmobile/src/exceptions/platform_exceptions.dart';
import 'package:kgiantmobile/src/features/authentication/screens/login/login.dart';
import 'package:kgiantmobile/src/features/authentication/screens/onboarding/onboarding.dart';
import 'package:kgiantmobile/src/features/authentication/screens/register/verify_email.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  ///function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      //local storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const OnBoardingScreen());
    }
  }

  /// email login
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw '[Login error] 문제가 발생하였습니다. 잠시후 다시 시도하여 주십시오! ${e.toString()}';
    }
  }

  /// email register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw '[register Id error] 문제가 발생하였습니다. 잠시후 다시 시도하여 주십시오! ${e.toString()}';
    }
  }

  ///send Email
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw '[sending email error] 문제가 발생하였습니다. 잠시후 다시 시도하여 주십시오! ${e.toString()}';
    }
  }

  /// forgot password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw '[sending password reset error] 문제가 발생하였습니다. 잠시후 다시 시도하여 주십시오! ${e.toString()}';
    }
  }

  ///logout
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw '[logout error] 문제가 발생하였습니다. 잠시후 다시 시도하여 주십시오! ${e.toString()}';
    }
  }

  /// google Login
  Future<UserCredential?> signInWithGoogle() async {
    try {
      print('1');
      //trigger the auth flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      print('2');
      // Obtain the auth details from request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      print('3');
      // Create new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw '[Google Login error] 문제가 발생하였습니다. 잠시후 다시 시도하여 주십시오! ${e.toString()}';
    }
  }

  /// reAuthentication Email & Password
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw '[Login error] 문제가 발생하였습니다. 잠시후 다시 시도하여 주십시오! ${e.toString()}';
    }
  }

  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw '[Login error] 문제가 발생하였습니다. 잠시후 다시 시도하여 주십시오! ${e.toString()}';
    }
  }
}
