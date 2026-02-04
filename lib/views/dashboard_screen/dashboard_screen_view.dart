import 'package:algolab/algorithms/algorithm.dart';
import 'package:algolab/algorithms/sorting/bubble_sort.dart';
import 'package:algolab/algorithms/sorting/selection_sort.dart';
import 'package:algolab/algorithms/sorting/sort_algorithm.dart';
import 'package:algolab/app_router.gr.dart';
import 'package:algolab/extensions/build_context_extension.dart';
import 'package:algolab/main.dart';
import 'package:algolab/views/base/dialog_helper.dart';
import 'package:algolab/views/base/screen_view_base.dart';
import 'package:algolab/views/components/algo_lab_scaffold.dart';
import 'package:algolab/views/dashboard_screen/components/algorithm_card.dart';
import 'package:algolab/views/dashboard_screen/components/dashboard_section.dart';
import 'package:algolab/views/dashboard_screen/components/link_card.dart';
import 'package:algolab/views/dashboard_screen/dashboard_screen_controller.dart';
import 'package:algolab/views/dashboard_screen/dashboard_screen_view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DashboardScreenView extends ScreenViewBase<DashboardScreenViewModel, DashboardScreenController> {

  const DashboardScreenView({
    required super.viewModel,
    required super.controller,
    required super.contextAccessor,
  });

  @override
  Widget get body {
    return AlgoLabScaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 72, 0, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome!', style: theme.textTheme.headlineSmall),
            const SizedBox(height: 32),
            DashboardSection(
              icon: Icons.sort,
              title: 'Sorting algorithms',
              bodyCards: [
                AlgorithmCard(algorithm: const BubbleSort(), onTap: () => onCardTapped(const BubbleSort())),
                AlgorithmCard(algorithm: const SelectionSort(), onTap: () => onCardTapped(const SelectionSort())),
              ],
            ),
            const SizedBox(height: 64),
            DashboardSection(
              icon: Icons.link,
              title: 'Other awesome interactive learning tools',
              bodyCards: [
                LinkCard(icon: Icons.camera, title: 'Cameras and Lenses', description: 'Learn about cameras, lenses, aperture, focus and more.', externalUrl: 'https://ciechanow.ski/cameras-and-lenses/'),
                LinkCard(icon: Icons.web, title: 'Load Balancing', description: 'Learn how incoming HTTP requests are distributed.', externalUrl: 'https://samwho.dev/load-balancing/'),
                LinkCard(icon: Icons.navigation, title: 'GPS', description: 'Learn how GPS helps you find out where you are.', externalUrl: 'https://ciechanow.ski/gps/'),
                LinkCard(icon: Icons.style, title: 'CSS Selectors', description: 'Learn how to use CSS Selectors to improve your web dev skills.', externalUrl: 'https://flukeout.github.io/'),
                LinkCard(icon: Icons.airplanemode_active, title: 'Airfoil', description: 'Learn about the forces that make airplanes fly.', externalUrl: 'https://ciechanow.ski/airfoil/'),
                LinkCard(icon: Icons.remove_red_eye, title: 'Optical Illusions', description: 'Learn about optical illusions and how they trick your brain.', externalUrl: 'https://optical.toys/'),
              ],
            ),
          ],
        ),
      ),
      bottomBarLeading: Text('AlgoLab v${getIt<PackageInfo>().version}'),
      bottomBarTrailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(LucideIcons.github),
            onPressed: onGitHubButtonPressed,
          ),
          if (context.isMobile)
            IconButton(
              onPressed: onAboutButtonPressed,
              icon: Icon(Icons.info_outline),
            )
          else
            TextButton.icon(
              onPressed: onAboutButtonPressed,
              label: Text('About AlgoLab'),
              icon: Icon(Icons.info_outline),
            ),
        ],
      ),
      bottomBarPadding: context.isMobile ? EdgeInsets.fromLTRB(16, 0, 8, 0) : EdgeInsets.zero,
    );
  }

  void onCardTapped(Algorithm algorithm) {
    switch (algorithm) {
      case SortAlgorithm _:
        context.pushRoute(SortingPracticeRoute(numberCount: 10, allowDuplicateNumbers: false, algorithm: algorithm));
    }
  }

  void onGitHubButtonPressed() {
    launchUrlString('https://github.com/h3x4d3c1m4l/algolab');
  }

  void onAboutButtonPressed() {
    showAlgoLabDialog(
      context: context,
      builder: (_) => AboutDialog(),
    );
  }

}
