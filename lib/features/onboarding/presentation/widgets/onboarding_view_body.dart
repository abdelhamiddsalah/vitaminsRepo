import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vitamins/core/routing/routes.dart';
import 'package:vitamins/core/styles/colorss.dart';
import 'package:vitamins/core/styles/text_styles.dart';
import 'package:vitamins/features/onboarding/presentation/widgets/pageviewitem.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigateToNextPage() {
    if (currentIndex < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      GoRouter.of(context).push(Routes.register);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [
                Pageviewitem(
                  text1: 'Discover trusted medicines at your fingertips',
                  text2: 'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.',
                  currentPage: 0,
                  lottiepath: 'assets/images/Animation - 1737735906821.json',
                ),
                Pageviewitem(
                  text1: 'Fast delivery, right to your doorstep',
                  text2: 'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.',
                  currentPage: 1,
                  lottiepath: 'assets/images/Animation - 1737735861283.json',
                ),
                Pageviewitem(
                  text1: 'Search, compare, and buy medicines instantly',
                  text2: 'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.',
                  currentPage: 2,
                  lottiepath: 'assets/images/Animation - 1737735925851.json',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: currentIndex < 2,
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(Routes.home);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyles.rowtext1.copyWith(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              DotsIndicator(
                dotsCount: 3,
                position: currentIndex,
                decorator: DotsDecorator(
                  color: Colors.grey,
                  activeColor: Colorss.primaryColor,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              GestureDetector(
                onTap: navigateToNextPage,
                child: Text(
                  'Next',
                  style: TextStyles.rowtext1.copyWith(
                    color: Colorss.primaryColor,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
