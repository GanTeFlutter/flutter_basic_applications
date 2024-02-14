import 'package:flutter/material.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  int _currentPageIndex = 0;

  void _updateIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColor._color7,
      floatingActionButton: pageChangeMethod(),
      appBar: AppBar(
        title: Center(child: Text("PageView $_currentPageIndex")),
      ),
      body: Padding(
        padding: Pagepaddin._edgeInsets,
        child: pageContainerScreen(),
      ),
    );
  }

  PageView pageContainerScreen() {
    return PageView(
      onPageChanged: _updateIndex,
      controller: _pageController,
      children: [
        coustomContainer(ProjectColor._color1, ProjectText.curvestext1),
        coustomContainer(ProjectColor._color2, ProjectText.curvestext2),
        coustomContainer(ProjectColor._color3, ProjectText.curvestext3),
        coustomContainer(ProjectColor._color4, ProjectText.curvestext4),
        coustomContainer(ProjectColor._color5, ProjectText.curvestext5),
        coustomContainer(ProjectColor._color6, ProjectText.curvestext6),
      ],
    );
  }

  Row pageChangeMethod() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        arttirma(Curves.slowMiddle),
        arttirma(Curves.bounceIn),
        arttirma(Curves.linearToEaseOut),
        arttirma(Curves.easeOut),
        arttirma(Curves.easeInOutCubic),
        arttirma(Curves.easeInOutCubicEmphasized),
      ],
    );
  }

  Padding coustomContainer(Color color, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color:ProjectColor._color7),
        )),
      ),
    );
  }

  Padding arttirma(Curve curve) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: FloatingActionButton(
          onPressed: () {
            _pageController.nextPage(
                duration: PageViewDuration._pageviewduration, curve: curve);
          },
          child: const Icon(Icons.chevron_right)),
    );
  }
}

class Pagepaddin {
  static const EdgeInsets _edgeInsets =
      EdgeInsets.only(left: 50, right: 50, bottom: 150, top: 50);
}

class PageViewDuration {
  static const Duration _pageviewduration = Duration(seconds: 2);
}

class ProjectColor {
  static const Color _color1 = Colors.pink;
  static const Color _color2 = Colors.indigo;
  static const Color _color3 = Colors.blue;
  static const Color _color4 = Colors.red;
  static const Color _color5 = Colors.brown;
  static const Color _color6 = Colors.red;
  static const Color _color7 = Colors.white;
}

class ProjectText {
  static const String curvestext1 = "Curves.slowMiddle";
  static const String curvestext2 = "Curves.bounceIn";
  static const String curvestext3 = "Curves.linearToEaseOut";
  static const String curvestext4 = "Curves.easeOut";
  static const String curvestext5 = "Curves.easeInOutCubic";
  static const String curvestext6 = "Curves.easeInOutCubicEmphasized";
}
