import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../example/main.dart' as example;

void main() {
  setUp(() => bootstrapGridParameters(gutterSize: 0));

  testWidgets('non-fluid containers constrain and center the grid', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BootstrapContainer(
          children: [
            BootstrapRow(
              children: [
                BootstrapCol(
                  child: const SizedBox(key: Key('content'), height: 40),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    expect(tester.getSize(find.byKey(const Key('content'))).width, 720);
    expect(tester.getTopLeft(find.byKey(const Key('content'))).dx, 40);
    expect(tester.takeException(), isNull);
  });

  testWidgets('columns resize and wrap when the viewport changes', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(1000, 800);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: BootstrapContainer(
          fluid: true,
          children: [
            BootstrapRow(
              children: [
                for (var i = 0; i < 2; i++)
                  BootstrapCol(
                    sizes: 'col-12 col-md-6',
                    child: SizedBox(key: ValueKey(i), height: 40),
                  ),
              ],
            ),
          ],
        ),
      ),
    );

    expect(tester.getSize(find.byKey(const ValueKey(0))).width, 500);
    expect(
      tester.getTopLeft(find.byKey(const ValueKey(1))),
      const Offset(500, 0),
    );

    tester.view.physicalSize = const Size(400, 800);
    await tester.pump();

    expect(tester.getSize(find.byKey(const ValueKey(0))).width, 400);
    expect(
      tester.getTopLeft(find.byKey(const ValueKey(1))),
      const Offset(0, 40),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('offsets, gutters and ordering are preserved', (tester) async {
    bootstrapGridParameters(gutterSize: 24);
    await tester.pumpWidget(
      MaterialApp(
        home: BootstrapContainer(
          fluid: true,
          children: [
            BootstrapRow(
              children: [
                BootstrapCol(
                  sizes: 'col-3',
                  orders: 'order-2 order-md-2',
                  child: const SizedBox(key: Key('second'), height: 40),
                ),
                BootstrapCol(
                  sizes: 'col-3',
                  offsets: 'offset-3',
                  orders: 'order-1 order-md-1',
                  child: const SizedBox(key: Key('first'), height: 40),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    expect(tester.getSize(find.byKey(const Key('first'))).width, 176);
    expect(tester.getTopLeft(find.byKey(const Key('first'))).dx, 212);
    expect(tester.getTopLeft(find.byKey(const Key('second'))).dx, 412);
    expect(tester.takeException(), isNull);
  });

  testWidgets('visibility supports extra-small screens', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(400, 800);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: [
            BootstrapVisibility(sizes: 'col-xs', child: const Text('mobile')),
            BootstrapVisibility(sizes: 'col-md', child: const Text('desktop')),
          ],
        ),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(find.text('mobile'), findsOneWidget);
    expect(find.text('desktop'), findsNothing);
  });

  for (final width in [400.0, 1440.0]) {
    testWidgets('Material UI example renders at width $width', (tester) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = Size(width, 1000);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(example.Application());
      await tester.pumpAndSettle();

      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.text('flutter_bootstrap Demo'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
