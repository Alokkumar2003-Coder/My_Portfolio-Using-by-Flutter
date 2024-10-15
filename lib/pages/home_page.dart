import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/widgets/contact_section.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
import 'package:my_portfolio/widgets/projects_section.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';
import '../constants/size.dart';
import '../widgets/drawer_mobile.dart';
import '../widgets/footer.dart';
import '../widgets/header_desktop.dart';
import '../widgets/header_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : DrawerMobile(onNavItemTap: (int navIndex) {
                scaffoldKey.currentState?.closeEndDrawer();
                scrollToSection(navIndex);
              }),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(key: navbarKeys.first),

              // MAIN
              if (constraints.maxWidth >= kMinDesktopWidth)
                HeaderDesktop(onNavMenuTap: (int navIndex) {
                  scrollToSection(navIndex);
                })
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),

              if (constraints.maxWidth >= kMinDesktopWidth)
                const MainDesktop()
              else
                const MainMobile(),

              // EDUCATION AND SKILLS SECTION
              Container(
                key: navbarKeys[1],
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Education section title and details
                    const Text(
                      "EDUCATION",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const EducationSection(),

                    const SizedBox(height: 50),

                    // Skills section title and details
                    const Text(
                      "SKILLS",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 50),

                    // Display Skills for Desktop or Mobile
                    if (constraints.maxWidth >= kMedDesktopWidth)
                      const SkillsDesktop()
                    else
                      const SkillsMobile(),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // PROJECTS
              ProjectsSection(
                key: navbarKeys[2],
              ),

              const SizedBox(height: 30),

              // CONTACT
              ContactSection(
                key: navbarKeys[3],
              ),
              const SizedBox(height: 30),

              // FOOTER
              const Footer(),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

// Widget for the Education Section
class EducationSection extends StatelessWidget {
  const EducationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Center align the items
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center align the row
          children: [
            const CircleAvatar(
              radius: 5,
              backgroundColor: CustomColor.whiteSecondary, // Color of the dot
            ),
            const SizedBox(width: 10), // Spacing between dot and text
            const Text(
              "Bachelor of Computer Applications",
              style: TextStyle(
                fontSize: 18,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ],
        ),
        Text(
          "Mahatma Gandhi Jyotibhai Phule Rohilkhand University, 2022-2025",
          style: TextStyle(
            fontSize: 16,
            color: CustomColor.whiteTertiary,
          ),
          textAlign: TextAlign.center, // Center align the text
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center align the row
          children: [
            const CircleAvatar(
              radius: 5,
              backgroundColor: CustomColor.whiteSecondary, // Color of the dot
            ),
            const SizedBox(width: 10), // Spacing between dot and text
            const Text(
              "Intermediate",
              style: TextStyle(
                fontSize: 18,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ],
        ),
        Text(
          "Kendriya Vidyalaya Air Force Bareilly, 2021-2022",
          style: TextStyle(
            fontSize: 16,
            color: CustomColor.whiteTertiary,
          ),
          textAlign: TextAlign.center, // Center align the text
        ),
      ],
    );
  }
}
