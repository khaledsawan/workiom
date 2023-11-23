import 'package:clean_architecture_flutter/core/base/base_cache.dart';
import 'package:clean_architecture_flutter/core/base/base_dio.dart';
import 'package:clean_architecture_flutter/core/network/network_info.dart';
import 'package:clean_architecture_flutter/di.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';
import '../shared_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GetIt getIt;
  late FakeSharedPreferencesStore store;
  late SharedPreferences preferences;

  const String testString = 'hello world';
  const bool testBool = true;
  const int testInt = 42;
  const double testDouble = 3.14159;
  const List<String> testList = <String>['foo', 'bar'];
  const Map<String, Object> testValues = <String, Object>{
    'flutter.String': testString,
    'flutter.bool': testBool,
    'flutter.int': testInt,
    'flutter.double': testDouble,
    'flutter.List': testList,
  };

  setUp(() async {
    store = FakeSharedPreferencesStore(testValues);
    SharedPreferencesStorePlatform.instance = store;
    preferences = await SharedPreferences.getInstance();
    getIt = GetIt.instance;
  });

  tearDown(() {
    getIt.reset();
  });

  test('Test dependency registration', () async {
    await AppDependencies().initialize();
    expect(getIt<NetworkInfo>(), isNotNull);
    expect(getIt<TheHttpExecuter>(), isNotNull);
    expect(getIt<Memento>(), isNotNull);
    expect(getIt<SharedPreferences>(), equals(preferences));
    expect(getIt<InternetConnectionChecker>(),
    equals(InternetConnectionChecker()));
  });
}
