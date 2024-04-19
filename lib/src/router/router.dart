import 'package:chat_app/src/router/router_path.dart';
import 'package:chat_app/src/views/pages/chat_page.dart';
import 'package:chat_app/src/views/pages/forgotpass_page.dart';
import 'package:chat_app/src/views/pages/signin_page.dart';
import 'package:chat_app/src/views/pages/signup_page.dart';
import 'package:chat_app/src/views/pages/top_page.dart';
import 'package:chat_app/src/views/pages/user_list_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: RouterPath.signin,
  routes: [
    GoRoute(
      name: RouterPath.signin,
      path: RouterPath.signin,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const SignInPage(),
      ),
    ),
    GoRoute(
      name: RouterPath.signup,
      path: RouterPath.signup,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const SignUpPage(),
      ),
    ),
    GoRoute(
      name: RouterPath.top,
      path: RouterPath.top,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const TopPage(),
      ),
    ),
    GoRoute(
      name: RouterPath.userlist,
      path: RouterPath.userlist,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const UserListPage(),
      ),
    ),
    GoRoute(
      name: RouterPath.chat,
      path: '${RouterPath.chat}/:dispNm',
      pageBuilder: (context, state) {
        final dispNm = state.pathParameters['dispNm']!;
        return MaterialPage(
          key: state.pageKey,
          child: ChatPage(dispNm: dispNm),
        );
      },
    ),
    GoRoute(
      name: RouterPath.forgetpass,
      path: RouterPath.forgetpass,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const ForgotPassPage(),
      ),
    ),
  ],
);
