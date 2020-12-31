import 'dart:io';

String stringLocator(String name) =>
    File('test/test_jsons/$name').readAsStringSync();
