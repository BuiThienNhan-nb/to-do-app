import 'package:to_do_app/core/injection/network_injection_container.dart';
import 'package:to_do_app/features/note/domain/usecases/injection/note_injection_container.dart';

class DependencyInitializer {
  DependencyInitializer._internal();

  static Future<void> init() async {
    await NetworkInjectionContainer.instance.init();
    await NoteInjectionContainer.instance.init();
  }
}
