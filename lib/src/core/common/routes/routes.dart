import 'package:ecomtest/src/features/home/view/pages/home_screen.dart';
import 'package:ecomtest/src/features/login/view/pages/sign_in.dart';
import 'package:ecomtest/src/features/profile/view/pages/profile.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The auth provider configuration
final authProviders = [EmailAuthProvider()];

///route configuration
GoRouter router() => GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: HomeScreenPage.route,
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreenPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: SignInScreenPage.route,
              builder: (BuildContext context, GoRouterState state) {
                return SignInScreenPage(
                  providers: authProviders,
                );
              },
            ),
            GoRoute(
                path: ProfileScreenPage.route,
                builder: (BuildContext context, GoRouterState state) {
                  return ProfileScreenPage(
                    providers: authProviders,
                  );
                }),
          ],
        ),
      ],
    );
