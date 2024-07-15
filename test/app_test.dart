import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:nasa_pictures/app/home/gallery/items.dart';
import 'package:nasa_pictures/app/home/home.dart';
import 'package:nasa_pictures/app/launch_screen.dart';
import 'package:nasa_pictures/app/pictures/pictures.dart';
import 'package:nasa_pictures/app/widgets/splash.dart';
import 'package:nasa_pictures/configs/config.dart';
import 'package:nasa_pictures/modules/gallery.dart';

import 'package:nasa_pictures/service/gallery.dart';

import 'data/gallery_service.dart';
import 'helpers.dart';

void main() {
  group('Gallery in App with 2 items', () {
    late GalleryService galleryService;
    late Override galleryServiceOverride;

    setUp(() {
      galleryService = FakeGalleryService(GalleryFakeData.twoDifferent);

      galleryServiceOverride = galleryServiceProvider.overrideWithValue(
        galleryService,
      );
      buildConfigurations.isTestMode = true;
    });

    testWidgets('renders LaunchScreen', (tester) async {
      await tester.pumpWidget(
        appWithOverridenProviders(
          overrides: [galleryServiceOverride],
        ),
      );

      expect(
        find.byType(LaunchScreen),
        findsOneWidget,
      );
    });

    testWidgets(
        'renders LaunchScreen (initial route) and then navigates to homescreen',
        (tester) async {
      await tester.pumpWidget(
        appWithOverridenProviders(
          overrides: [galleryServiceOverride],
        ),
      );

      expect(
        find.byType(LaunchScreen),
        findsOneWidget,
      );

      await mockNetworkImages(() async {
        await tester.pumpAndSettle(
          durationOfSplashWithoutAnimations,
        );
        expect(
          find.byType(HomeScreen),
          findsOneWidget,
        );
      });
    });

    testWidgets(
        'displays list of items in a gridview on homescreen with scrollable grid of pictures',
        (tester) async {
      await tester.pumpWidget(
        appWithOverridenProviders(
          overrides: [galleryServiceOverride],
        ),
      );

      expect(
        find.byType(LaunchScreen),
        findsOneWidget,
      );

      await mockNetworkImages(() async {
        await tester.pumpAndSettle(
          durationOfSplashWithoutAnimations,
        );

        expect(
          find.byType(HomeScreen),
          findsOneWidget,
        );

        expect(find.byType(ItemTile), findsNWidgets(2));
        expect(find.byType(Image), findsNWidgets(2));

        final firstItem = GalleryFakeData.twoDifferent.first;

        expect(
          find.descendant(
            of: find.byType(ItemTile).first,
            matching: find.image(
              NetworkImage(firstItem['url']!),
            ),
          ),
          findsOneWidget,
        );

        expect(
          find.image(
            NetworkImage(firstItem['hdurl']!),
          ),
          findsNothing,
        );
      });
    });

    testWidgets(
      'Navigate between pictures screen and home screen',
      (tester) async {
        await tester.pumpWidget(
          appWithOverridenProviders(
            overrides: [galleryServiceOverride],
          ),
        );

        await mockNetworkImages(() async {
          await tester.pumpAndSettle(
            durationOfSplashWithoutAnimations,
          );

          await tester.tap(find.byType(ItemTile).first);
          await tester.pumpAndSettle();

          expect(find.byType(PicturesScreen), findsOneWidget);
          expect(find.byType(HomeScreen), findsNothing);

          await tester.tap(find.byType(BackButton));
          await tester.pumpAndSettle();

          expect(find.byType(HomeScreen), findsOneWidget);
          expect(find.byType(PicturesScreen), findsNothing);
        });
      },
    );

    testWidgets(
      'Navigates to pictures screen and verifies if image is HD, metadata is visible and can be toggled',
      (tester) async {
        await tester.pumpWidget(
          appWithOverridenProviders(
            overrides: [galleryServiceOverride],
          ),
        );

        await mockNetworkImages(() async {
          await tester.pumpAndSettle(
            durationOfSplashWithoutAnimations,
          );

          await tester.tap(find.byType(ItemTile).first);
          await tester.pumpAndSettle();

          expect(find.byType(PicturesScreen), findsOneWidget);

          final metadataWidget = find.byType(ItemMetaData);
          expect(metadataWidget, findsOneWidget);

          final firstItem = GalleryFakeData.twoDifferent.first;

          expect(
            find.descendant(
              of: metadataWidget,
              matching: find.text(
                firstItem['title']!,
              ),
            ),
            findsOneWidget,
          );

          expect(
            find.descendant(
              of: metadataWidget,
              matching: find.text(
                firstItem['explanation']!,
              ),
            ),
            findsOneWidget,
          );

          final metadataButton = find.byType(MetadataToggleButton);
          expect(metadataButton, findsOneWidget);

          expect(
            tester.widget(
              find.descendant(
                of: metadataButton,
                matching: find.byType(Icon),
              ),
            ),
            isA<Icon>().having(
              (s) => s.icon,
              'icon',
              FluentIcons.eye_off_24_regular,
            ),
          );

          await tester.tap(metadataButton);
          await tester.pumpAndSettle();
          expect(find.byType(ItemMetaData), findsNothing);

          await tester.tap(metadataButton);
          await tester.pumpAndSettle();
          expect(find.byType(ItemMetaData), findsOneWidget);

          final picturesPageView = find.byType(PicturesPageView);
          expect(find.byType(PicturesPageView), findsOneWidget);

          final firstPage = find.descendant(
            of: picturesPageView,
            matching: find.byType(PicturePage),
          );

          expect(
            firstPage,
            findsOneWidget,
          );

          expect(
            find.descendant(
              of: firstPage,
              matching: find.image(
                NetworkImage(firstItem['hdurl']!),
              ),
            ),
            findsOneWidget,
          );

          expect(
            find.image(
              NetworkImage(firstItem['url']!),
            ),
            findsNothing,
          );
        });
      },
    );

    testWidgets(
      'Navigates to pictures screen and tries to change pages using arrow buttons',
      (tester) async {
        await tester.pumpWidget(
          appWithOverridenProviders(
            overrides: [galleryServiceOverride],
          ),
        );

        await mockNetworkImages(() async {
          await tester.pumpAndSettle(
            durationOfSplashWithoutAnimations,
          );

          await tester.tap(find.byType(ItemTile).first);
          await tester.pumpAndSettle();

          expect(find.byType(PicturesScreen), findsOneWidget);

          final metadataWidget = find.byType(ItemMetaData);
          expect(metadataWidget, findsOneWidget);

          final firstItem = GalleryFakeData.twoDifferent.first;

          expect(
            find.descendant(
              of: metadataWidget,
              matching: find.text(
                firstItem['title']!,
              ),
            ),
            findsOneWidget,
          );

          expect(
            find.descendant(
              of: metadataWidget,
              matching: find.text(
                firstItem['explanation']!,
              ),
            ),
            findsOneWidget,
          );

          final picturesPageView = find.byType(PicturesPageView);
          expect(find.byType(PicturesPageView), findsOneWidget);

          final page = find.descendant(
            of: picturesPageView,
            matching: find.byType(PicturePage),
          );

          expect(
            page,
            findsOneWidget,
          );

          final metadataButton = find.byType(MetadataToggleButton);
          expect(metadataButton, findsOneWidget);

          await tester.tap(metadataButton);
          await tester.pumpAndSettle();

          expect(find.byType(NextPageButton), findsOneWidget);

          await tester.tap(find.byType(NextPageButton));

          await tester.pumpAndSettle(
            const Duration(milliseconds: 400),
          );

          final pageView = find.byType(PageView);
          expect(
            tester.widget(pageView),
            isA<PageView>().having(
              (c) => c.controller?.page,
              'pageController.page',
              1.0,
            ),
          );

          final secondItem = GalleryFakeData.twoDifferent[1];

          await tester.tap(metadataButton);
          await tester.pumpAndSettle();

          expect(
            find.descendant(
              of: metadataWidget,
              matching: find.text(
                secondItem['title']!,
              ),
            ),
            findsOneWidget,
          );

          expect(
            find.descendant(
              of: metadataWidget,
              matching: find.text(
                secondItem['explanation']!,
              ),
            ),
            findsOneWidget,
          );

          expect(
            find.descendant(
              of: page,
              matching: find.image(
                NetworkImage(secondItem['hdurl']!),
              ),
            ),
            findsOneWidget,
          );
        });
      },
    );

    testWidgets(
      'Navigates to pictures screen and tries to change pages by swiping',
      (tester) async {
        await tester.pumpWidget(
          appWithOverridenProviders(
            overrides: [galleryServiceOverride],
          ),
        );

        await mockNetworkImages(() async {
          await tester.pumpAndSettle(
            durationOfSplashWithoutAnimations,
          );

          await tester.tap(find.byType(ItemTile).first);
          await tester.pumpAndSettle();

          final picturesPageView = find.byType(PicturesPageView);

          final pageView = find.byType(PageView);

          expect(
            tester.widget(pageView),
            isA<PageView>().having(
              (c) => c.controller?.page,
              'pageController.page',
              0.0,
            ),
          );

          await tester.drag(
            picturesPageView,
            const Offset(-600.0, 0.0),
          );
          await tester.pumpAndSettle();

          expect(
            tester.widget(pageView),
            isA<PageView>().having(
              (c) => c.controller?.page,
              'pageController.page',
              1.0,
            ),
          );

          await tester.drag(
            picturesPageView,
            const Offset(-600.0, 0.0),
          );
          await tester.pumpAndSettle();

          expect(
            tester.widget(pageView),
            isA<PageView>().having(
              (c) => c.controller?.page,
              'pageController.page',
              1.0,
            ),
            reason: 'Overscrolled. There should be no next page here.',
          );

          await tester.drag(
            picturesPageView,
            const Offset(600.0, 0.0),
          );
          await tester.pumpAndSettle();

          expect(
            tester.widget(pageView),
            isA<PageView>().having(
              (c) => c.controller?.page,
              'pageController.page',
              0.0,
            ),
          );
        });
      },
    );
  });
}
