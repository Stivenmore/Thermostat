import 'package:control/half_circular_progress.dart';
import 'package:flutter/material.dart';

class ControlTherScreen extends StatefulWidget {
  const ControlTherScreen({super.key});
  @override
  State<ControlTherScreen> createState() => _ControlTherScreenState();
}

class _ControlTherScreenState extends State<ControlTherScreen> {
  double progress = 0.0;
  double maxProgress = 0.0;
  Color blue = const Color.fromARGB(255, 45, 113, 182);
  Color orange = const Color.fromARGB(255, 246, 138, 92);

  Color colorByState(double progress) {
    if (progress == 0.0 || progress < 0.10) {
      return const Color.fromARGB(0, 60, 145, 230);
    } else if (progress == 0.10 || progress < 0.30) {
      return const Color.fromARGB(50, 60, 145, 230);
    } else if (progress == 0.20 || progress < 0.28) {
      return const Color.fromARGB(100, 60, 145, 230);
    } else if (progress == 0.30 || progress < 0.50) {
      return const Color.fromARGB(80, 246, 138, 92);
    } else if (progress == 0.50 || progress < 0.70) {
      return const Color.fromARGB(137, 246, 138, 92);
    } else {
      return const Color.fromARGB(255, 246, 138, 92);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Colors.black,
        ),
        actions: const [
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.rocket_launch_outlined,
            color: Colors.black,
            size: 20,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.miscellaneous_services_sharp,
            color: Colors.black,
            size: 20,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.drag_indicator_rounded,
            color: Colors.black,
            size: 20,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Thermostat',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const Text(
              'Entryway',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 70,
            ),
            SizedBox(
              height: 250,
              width: 250,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          colorByState(progress),
                          const Color.fromARGB(130, 252, 252, 252),
                        ],
                      ),
                    ),
                    height: 230,
                    width: 230,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                            'Cooling',
                            style: TextStyle(
                                color: progress < 0.3 ? blue : orange,
                                fontSize: 14),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          child: Text('${(progress * 100).toInt()}',
                              style: TextStyle(
                                fontSize: 50,
                                color: progress < 0.3 ? blue : orange,
                              )),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                            'Under 100%',
                            style: TextStyle(
                                color: progress < 0.3 ? blue : orange,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  HalfCircularProgress(
                    color: progress < 0.3 ? blue : orange,
                    arcColor: progress < 0.3 ? blue : orange,
                    maxProgress: maxProgress,
                    progress: progress,
                    onMaxProgressChanged: (value) {
                      setState(() {
                        maxProgress = value;
                        progress = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (progress > 0) {
                        setState(() {
                          progress -= 0.01;
                          maxProgress -= 0.01;
                        });
                      }
                    },
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(24),
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Icon(
                          Icons.remove,
                          color: progress < 0.30 ? Colors.indigo[600] : orange,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (progress < 1) {
                        setState(() {
                          progress += 0.01;
                          maxProgress += 0.01;
                        });
                      }
                    },
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(24),
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Icon(
                          Icons.add,
                          color: progress < 0.30 ? Colors.indigo[600] : orange,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}
