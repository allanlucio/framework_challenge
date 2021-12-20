import 'dart:convert';
import 'dart:io';

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

Map<String, dynamic> fixtureAsJson(String name) => json.decode(fixture(name));
List<dynamic> fixtureAsJsonArray(String name) => json.decode(fixture(name));
