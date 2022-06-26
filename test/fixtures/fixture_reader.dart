import 'dart:io';

String fixture(String name) =>
    File('test/fixtures/note_response/$name').readAsStringSync();
