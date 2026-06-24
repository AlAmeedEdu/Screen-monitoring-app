import 'package:get/get.dart';

import 'app_routes.dart';
import '../modules/auth/bindings/login_binding.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main_layout/bindings/main_layout_binding.dart';
import '../modules/main_layout/views/main_layout_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/quick_monitor/bindings/quick_monitor_binding.dart';
import '../modules/quick_monitor/views/quick_monitor_view.dart';
import '../modules/roles/bindings/create_role_binding.dart';
import '../modules/roles/bindings/roles_binding.dart';
import '../modules/roles/views/create_role_view.dart';
import '../modules/roles/views/roles_view.dart';
import '../modules/schools/bindings/school_classes_binding.dart';
import '../modules/schools/bindings/school_details_binding.dart';
import '../modules/schools/bindings/schools_binding.dart';
import '../modules/schools/views/school_classes_view.dart';
import '../modules/schools/views/school_details_view.dart';
import '../modules/schools/views/schools_view.dart';
import '../modules/screen_logs/bindings/screen_logs_binding.dart';
import '../modules/screen_logs/views/screen_logs_view.dart';
import '../modules/screens/bindings/create_screen_binding.dart';
import '../modules/screens/bindings/screen_details_binding.dart';
import '../modules/screens/bindings/screens_binding.dart';
import '../modules/screens/views/create_screen_view.dart';
import '../modules/screens/views/screen_details_view.dart';
import '../modules/screens/views/screens_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/teachers/bindings/teacher_details_binding.dart';
import '../modules/teachers/bindings/teachers_binding.dart';
import '../modules/teachers/views/teacher_details_view.dart';
import '../modules/teachers/views/teachers_view.dart';
import '../modules/timetable/bindings/timetable_binding.dart';
import '../modules/timetable/views/timetable_view.dart';
import '../modules/users/bindings/create_user_binding.dart';
import '../modules/users/bindings/user_details_binding.dart';
import '../modules/users/bindings/users_binding.dart';
import '../modules/users/views/create_user_view.dart';
import '../modules/users/views/user_details_view.dart';
import '../modules/users/views/users_view.dart';

abstract final class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = <GetPage>[
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashView(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.onboarding,
        page: () => const OnboardingView(),
        binding: OnboardingBinding()),
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginView(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.mainLayout,
        page: () => const MainLayoutView(),
        binding: MainLayoutBinding()),
    GetPage(
        name: AppRoutes.home,
        page: () => const HomeView(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutes.screens,
        page: () => const ScreensView(),
        binding: ScreensBinding()),
    GetPage(
        name: AppRoutes.screenDetails,
        page: () => const ScreenDetailsView(),
        binding: ScreenDetailsBinding()),
    GetPage(
        name: AppRoutes.createScreen,
        page: () => const CreateScreenView(),
        binding: CreateScreenBinding()),
    GetPage(
        name: AppRoutes.screenLogs,
        page: () => const ScreenLogsView(),
        binding: ScreenLogsBinding()),
    GetPage(
        name: AppRoutes.schools,
        page: () => const SchoolsView(),
        binding: SchoolsBinding()),
    GetPage(
        name: AppRoutes.schoolDetails,
        page: () => const SchoolDetailsView(),
        binding: SchoolDetailsBinding()),
    GetPage(
        name: AppRoutes.schoolClasses,
        page: () => const SchoolClassesView(),
        binding: SchoolClassesBinding()),
    GetPage(
        name: AppRoutes.quickMonitor,
        page: () => const QuickMonitorView(),
        binding: QuickMonitorBinding()),
    GetPage(
        name: AppRoutes.teachers,
        page: () => const TeachersView(),
        binding: TeachersBinding()),
    GetPage(
        name: AppRoutes.teacherDetails,
        page: () => const TeacherDetailsView(),
        binding: TeacherDetailsBinding()),
    GetPage(
        name: AppRoutes.timetable,
        page: () => const TimetableView(),
        binding: TimetableBinding()),
    GetPage(
        name: AppRoutes.roles,
        page: () => const RolesView(),
        binding: RolesBinding()),
    GetPage(
        name: AppRoutes.createRole,
        page: () => const CreateRoleView(),
        binding: CreateRoleBinding()),
    GetPage(
        name: AppRoutes.users,
        page: () => const UsersView(),
        binding: UsersBinding()),
    GetPage(
        name: AppRoutes.userDetails,
        page: () => const UserDetailsView(),
        binding: UserDetailsBinding()),
    GetPage(
        name: AppRoutes.createUser,
        page: () => const CreateUserView(),
        binding: CreateUserBinding()),
    GetPage(
        name: AppRoutes.profile,
        page: () => const ProfileView(),
        binding: ProfileBinding()),
  ];
}
