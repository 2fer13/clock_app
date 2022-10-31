import 'package:clock_app/ui/style.dart';
import 'package:clock_app/utils/time_model.dart';
import 'package:clock_app/widgets/clock_widget.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              TimerBuilder.periodic(
                const Duration(seconds: 1),
                builder: (context) {
                  var currentTime = DateTime.now();
                  String seconds = currentTime.second < 10
                      ? "0${currentTime.second}"
                      : "${currentTime.second}";
                  String minutes = currentTime.minute < 10
                      ? "0${currentTime.minute}"
                      : "${currentTime.minute}";
                  String hours = currentTime.hour < 10
                      ? "0${currentTime.hour}"
                      : "${currentTime.hour}";
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bugün",
                            style: AppStyle.mainTextThin,
                          ),
                          Text(
                            "$hours:$minutes:$seconds",
                            style: AppStyle.mainText,
                          ),
                        ],
                      ),
                      Center(
                        child: ClockWidget(
                          TimeModel(currentTime.hour, currentTime.minute,
                              currentTime.second),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 60.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Başka bir zaman dilimi seç",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const Divider(
                    color: Colors.black45,
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 24.0),
                      width: MediaQuery.of(context).size.width - 52,
                      height: 100.0,
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: AppStyle.primaryColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bei Jin",
                                style: AppStyle.mainTextWhite,
                              ),
                              Text(
                                "${DateTime.now().hour}:${DateTime.now().minute}",
                                style: AppStyle.mainTextWhite,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "Bugün",
                            style: AppStyle.mainTextThinWhite,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 52,
                      height: 100.0,
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: AppStyle.primaryColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bei Jin",
                                style: AppStyle.mainTextWhite,
                              ),
                              Text(
                                "${DateTime.now().hour}:${DateTime.now().minute}",
                                style: AppStyle.mainTextWhite,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "Bugün",
                            style: AppStyle.mainTextThinWhite,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
