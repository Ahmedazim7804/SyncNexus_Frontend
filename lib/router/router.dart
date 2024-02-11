import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worker_app/models/employee_model.dart';
import 'package:worker_app/provider/uid_provider.dart';
import 'package:worker_app/router/auth_listenable.dart';
import 'package:worker_app/ui/screens/authentication/signup_screen.dart';
import 'package:worker_app/ui/screens/authentication/user_details_screen.dart';
import 'package:worker_app/ui/screens/employer_screen/employee_tasks_screen.dart';
import 'package:worker_app/ui/screens/employer_screen/employees_list_screen.dart';
import 'package:worker_app/ui/screens/employer_screen/employer_homescreen.dart';
import 'package:worker_app/ui/screens/employer_screen/employer_payment.dart';
import 'package:worker_app/ui/screens/employer_screen/employer_root_scaffold.dart';
import 'package:worker_app/ui/screens/employer_screen/jobs_list_screen.dart';
import 'package:worker_app/ui/screens/employer_screen/profile_screen.dart';

import 'package:worker_app/ui/screens/employe_screen/employee_homescreen.dart';
import 'package:worker_app/ui/screens/employe_screen/employee_jobs_screen.dart';
import 'package:worker_app/ui/screens/employe_screen/employee_root_scaffold.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorEmployerDashboardKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellEmployerDashboard');
final _shellNavigatorEmployerJobsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellEmployerJobs');
final _shellNavigatorEmployerPaymentKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellEmployerPayment');
final _shellNavigatorEmployerProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellEmployerProfile');
final _shellNavigatorEmployeeDashboardKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellEmployeeDashboard');
final _shellNavigatorEmployeeJobsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellEmployeeProfile');

class MyAppRouter {
  static AuthListen authListen = AuthListen();
  static GoRouter goRouter = GoRouter(
      navigatorKey: _rootNavigatorKey,
      refreshListenable: authListen,
      initialLocation: '/screens/authentication/signup',
      redirect: (context, state) {
        if (!authListen.isSignedIn) {
          if (authListen.user != null) {
            context.read<UidProvider>().uid = authListen.user!.uid;
            authListen.isSignedIn = true;
            authListen.subscription.cancel();

            try {
              if (context.read<SharedPreferences>().getBool('employee')!) {
                return '/screens/worker/homescreen';
              } else {
                return '/screens/worker/homescreen';
              }
            } catch (e) {
              return '/screens/worker/homescreen';
            }
          } else {
            authListen.isSignedIn = true;
            authListen.subscription.cancel();
            return null;
          }
        }
        return null;
      },
      routes: [
        StatefulShellRoute.indexedStack(
            builder: (context, state, child) =>
                EmployerRootScaffold(child: child),
            branches: [
              StatefulShellBranch(
                  navigatorKey: _shellNavigatorEmployerDashboardKey,
                  routes: [
                    GoRoute(
                      path: '/screens/employer/employees',
                      pageBuilder: (context, state) =>
                          const MaterialPage(child: EmployeesListScreen()),
                    ),
                    GoRoute(
                        path: '/screens/employer/employee',
                        pageBuilder: (context, state) {
                          Employee employee = state.extra as Employee;
                          return MaterialPage(
                              child: EmployeeTaskListScreen(
                            employee: employee,
                          ));
                        }),
                    GoRoute(
                      path: '/screens/employer/homescreen',
                      pageBuilder: (context, state) =>
                          const MaterialPage(child: EmployerHomeScreen()),
                    ),
                  ]),
              StatefulShellBranch(
                  navigatorKey: _shellNavigatorEmployerJobsKey,
                  routes: [
                    GoRoute(
                      path: '/screens/employer/jobs',
                      pageBuilder: (context, state) =>
                          const MaterialPage(child: JobsListScreen()),
                    ),
                  ]),
              StatefulShellBranch(
                  navigatorKey: _shellNavigatorEmployerPaymentKey,
                  routes: [
                    GoRoute(
                      path: '/screens/employer/payment',
                      pageBuilder: (context, state) =>
                          const MaterialPage(child: EmployerPaymentScreen()),
                    ),
                  ]),
              StatefulShellBranch(
                  navigatorKey: _shellNavigatorEmployerProfileKey,
                  routes: [
                    GoRoute(
                      path: '/screens/employer/profile',
                      pageBuilder: (context, state) =>
                          const MaterialPage(child: EmployerProfileScreen()),
                    ),
                  ]),
            ]),
        StatefulShellRoute.indexedStack(
            builder: (context, state, child) =>
                EmployeeRootScaffold(child: child),
            branches: [
              StatefulShellBranch(
                  navigatorKey: _shellNavigatorEmployeeDashboardKey,
                  routes: [
                    GoRoute(
                      path: '/screens/worker/homescreen',
                      pageBuilder: (context, state) =>
                          const MaterialPage(child: WorkerHomeScreen()),
                    ),
                  ]),
              StatefulShellBranch(
                  navigatorKey: _shellNavigatorEmployeeJobsKey,
                  routes: [
                    GoRoute(
                      path: '/screens/employee/jobs',
                      pageBuilder: (context, state) =>
                          const MaterialPage(child: EmployeeJobsScreen()),
                    ),
                  ]),
            ]),
        GoRoute(
          path: '/screens/authentication/signup',
          pageBuilder: (context, state) =>
              const MaterialPage(child: SignUpScreen()),
        ),
        GoRoute(
          path: '/screens/authentication/other',
          pageBuilder: (context, state) =>
              const MaterialPage(child: OthersDetailScreen()),
        ),
      ]);
}
