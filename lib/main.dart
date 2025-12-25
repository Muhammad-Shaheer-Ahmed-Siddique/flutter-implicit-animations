import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: const DashBoardScreen(),
    );
  }
}

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  static const Duration animationDuration = Duration(milliseconds: 800);

  bool isBoxVisible = true;
  double opacityValue = 1.0;

  void toggleVisibility() {
    setState(() {
      isBoxVisible = !isBoxVisible;
      opacityValue = isBoxVisible ? 1.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Screen"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: isBoxVisible ? 1.0 : 0.8,
              duration: animationDuration,
              curve: Curves.easeInOut,
              child: AnimatedOpacity(
                opacity: opacityValue,
                duration: animationDuration,
                curve: Curves.easeInOut,
                child: Semantics(
                  label: "Animated purple square",
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: Icon(
                isBoxVisible ? Icons.visibility_off : Icons.visibility,
              ),
              label: Text(isBoxVisible ? "Hide Box" : "Show Box"),
              onPressed: toggleVisibility,
            ),
          ],
        ),
      ),
    );
  }
}
