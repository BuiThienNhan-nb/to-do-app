import 'package:to_do_app/features/auth/domain/entities/user.dart';

class AppValue {
  AppValue._internal();

  static String accessToken = "";

  static User currentUser = User(
    id: "62b29670a4448f451c4ec3d7",
    name: "Bùi Thiện Nhân",
    email: "btnhan1@gmail.com",
    token: AppValue.accessToken,
  );
}
