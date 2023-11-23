import 'package:flutter/material.dart';

class ItemDeletes extends StatefulWidget {
  const ItemDeletes({super.key});

  @override
  State<ItemDeletes> createState() => _ItemDeletesState();
}

class _ItemDeletesState extends State<ItemDeletes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Details",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            MainInfo(),
            SizedBox(
              height: 20,
            ),
            DetailsScheduals(),
          ],
        ),
      ),
    );
  }
}

class DetailsScheduals extends StatelessWidget {
  const DetailsScheduals({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const WorkoutDetails(workoutName: "Workout Type", workoutType: "Cycling"),
        const WorkoutDetails(
            workoutName: "Workout Interval", workoutType: "Everyday 1 hour"),
        const WorkoutDetails(workoutName: "Start Timing", workoutType: "00"),
        const SizedBox(
          height: 120,
        ),
        Container(
          height: 60,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            color: Colors.teal,
          ),
          child: Center(
              child: InkWell(
                  onTap: () {
                    openAlertBox(context);
                  },
                  child: const Text(
                    "Delete",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ))),
        )
      ],
    );
  }

  openAlertBox(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),topRight: Radius.circular(30))
            ),
            backgroundColor: Colors.white,
            title: const Text(
              "Delete The Task?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.black),
                  )),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Ok",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          );
        });
  }
}

class WorkoutDetails extends StatelessWidget {
  const WorkoutDetails(
      {super.key, required this.workoutName, required this.workoutType});

  final String workoutName;
  final String workoutType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              workoutName,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Text(
            workoutType,
            style: TextStyle(fontSize: 17, color: Colors.teal),
          ),
        ],
      ),
    );
  }
}

class MainInfo extends StatelessWidget {
  const MainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.teal.shade200,
          ),
          child: Image.asset(
            "lib/icons/cycling.png",
            scale: 4,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const Column(
          children: [
            Details(fieldTitle: "Workout Name", FieldInfo: "Cycling"),
            SizedBox(
              height: 15,
            ),
            Details(fieldTitle: "Timing", FieldInfo: "K/m"),
          ],
        ),
      ],
    );
  }
}

class Details extends StatelessWidget {
  const Details({super.key, required this.fieldTitle, required this.FieldInfo});
  final String fieldTitle;
  final String FieldInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          fieldTitle,
          style: TextStyle(fontSize: 17, color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          FieldInfo,
          style: const TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
