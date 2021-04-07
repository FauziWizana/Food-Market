import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  final SerializableFinder emailTextField = find.byValueKey('emailfield');
  final SerializableFinder passTextField = find.byValueKey('passfield');
  final SerializableFinder loginButton = find.byValueKey('LoginButton');
  final SerializableFinder singInPage = find.byValueKey('SignIn');
  final SerializableFinder mainPage = find.byValueKey('MainPage');
  final SerializableFinder listView = find.byValueKey('listViewX');
  final SerializableFinder spageti = find.byValueKey('foodshorizontal1');
  final SerializableFinder menuHome = find.byValueKey('menuHome');
  final SerializableFinder menuOrder = find.byValueKey('menuOrder');
  final SerializableFinder btnTambah = find.byValueKey('btnTambah');
  final SerializableFinder btnKurang = find.byValueKey('btnKurang');
  final SerializableFinder btnOrder = find.byValueKey('btnOrder');
  final SerializableFinder btnCheckout = find.byValueKey('btnCheckout');

  group('Flutter Test', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      print('setUp');
    });
    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });
    test(
      'Login Failed',
      () async {
        await driver.tap(emailTextField);
        await driver.enterText('wasd');
        await driver.tap(passTextField);
        // await driver.enterText('');
        await driver.tap(loginButton);
        assert(mainPage == null);
      },
    );
    test('Login Success', () async {
      await driver.tap(emailTextField);
      await driver.enterText('ikim@gmail.com');
      await driver.tap(passTextField);
      await driver.enterText('password');
      await driver.tap(loginButton);
      await driver.waitFor(find.text('Food Market'));
      assert(mainPage != null);

      // expect(await driver.getText(emailTextField), "wizana@gmail.com");
    });

    test(
      'Check Order',
      () async {
        await driver.tap(menuOrder);
        await driver.tap(find.text('Find Foods'));
        await driver.waitFor(find.text('Food Market'));
        await driver.scrollUntilVisible(listView, spageti);
        await driver.tap(spageti);
        await driver.waitForAbsent(spageti);
        await driver.tap(btnTambah);
        await driver.tap(btnTambah);
        await driver.tap(btnKurang);
        // await driver.enterText('');
        await driver.tap(btnOrder);
        await driver.waitForAbsent(btnOrder);
        await driver.tap(btnCheckout);
        await driver.waitFor(find.text('Finish Your Payment'));
        await driver.tap(find.text('Continue'));
        await driver.tap(find.text('View My Order'));
        await driver.waitFor(find.text('Spageti'));
      },
    );
  });

  // NOTE: Bikin Test Order
}
