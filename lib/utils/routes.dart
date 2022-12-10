import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:inmotion/main.dart';
import 'package:inmotion/views/auth/signup.dart';
import 'package:inmotion/views/main/profile.dart';
import 'package:inmotion/views/main/progress.dart';
import 'package:inmotion/views/main/rating.dart';
import 'package:inmotion/views/main/settings.dart';
import 'package:inmotion/views/main/train.dart';

import '../views/auth/signin.dart';

class MyRoutes {
  MyRoutes._();

  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String feed = '/feed';
  static const String progress = '/progress';
  static const String rating = '/rating';
  static const String profile = '/profile';
  static const String train = '/train';
  static const String settings = '/settings';

  static Map<String, WidgetBuilder> define() {
    return {
      feed: (context) => Main(),
      signIn: (context) => SignIn(),
      signUp: (context) => SignUp(),
      progress: (context) => Progress(),
      rating: (context) => Rating(),
      train: (context) => Train(),
      settings: (context) => const Settings(),
      profile: (context) => const Profile(),
    };
  }
}
