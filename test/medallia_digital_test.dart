import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medallia_digital/medallia_digital.dart';

void main() {
  const MethodChannel channel = MethodChannel('medallia_digital');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await MedalliaDigital.platformVersion, '42');
  });
}
