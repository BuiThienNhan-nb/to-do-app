import '../core/injection/network_injection_container.dart';
import '../features/auth/domain/usecases/injection/autrh_injection_container.dart';
import '../features/note/domain/usecases/injection/note_injection_container.dart';

class DependencyInitializer {
  DependencyInitializer._internal();

  static Future<void> init() async {
    await NetworkInjectionContainer.instance.init();
    await NoteInjectionContainer.instance.init();
    await AuthInjectionContainer.instance.init();
  }
}
