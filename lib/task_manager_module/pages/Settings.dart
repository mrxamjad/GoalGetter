import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';


import '../newe_entry/PannelPage.dart';

import 'Calendar.dart';


class Settings extends StatefulWidget {

  const Settings({super.key});


  @override

  State<Settings> createState() => _SettingsState();

}


class _SettingsState extends State<Settings> {

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            const Center(child: AvatarCard()),

            const SizedBox(

              height: 10,

            ),

            const Divider(),

            const SizedBox(

              height: 10,

            ),

            Padding(

              padding: EdgeInsets.all(8.0),

              child: Column(

                children: [

                  SettingsDetails(

                    icons: Icons.person,

                    name: "Account Async",

                    iconsBack: CupertinoIcons.chevron_forward,

                    iPressed: () {},

                  ),

                  const SizedBox(

                    height: 10,

                  ),

                  SettingsDetails(

                    icons: Icons.notifications_on,

                    name: "Notifications And Reminder",

                    iconsBack: CupertinoIcons.chevron_forward,

                    iPressed: () {},

                  ),

                  const SizedBox(

                    height: 10,

                  ),

                  SettingsDetails(

                    icons: Icons.speaker_notes,

                    name: "Notes",

                    iconsBack: CupertinoIcons.chevron_forward,

                    iPressed: () {},

                  ),

                  const SizedBox(

                    height: 10,

                  ),

                  SettingsDetails(

                    icons: Icons.stacked_bar_chart_outlined,

                    name: "Statistic",

                    iconsBack: CupertinoIcons.chevron_forward,

                    iPressed: () {},

                  ),

                  const SizedBox(

                    height: 10,

                  ),

                  SettingsDetails(

                    icons: Icons.task_alt,

                    name: "Tasks View",

                    iconsBack: CupertinoIcons.chevron_forward,

                    iPressed: () {

                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>NewEntryPage(),));

                    },

                  ),

                  const SizedBox(

                    height: 10,

                  ),

                  SettingsDetails(

                    icons: Icons.edit_calendar,

                    name: "Calendar",

                    iconsBack: CupertinoIcons.chevron_forward,

                    iPressed: () {

                      Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (context) => CalendarApp(),

                          ));

                    },

                  ),

                  const SizedBox(

                    height: 10,

                  ),

                  SettingsDetails(

                    icons: Icons.feedback,

                    name: "Feedback",

                    iconsBack: CupertinoIcons.chevron_forward,

                    iPressed: () {},

                  ),

                  const SizedBox(

                    height: 10,

                  ),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [

                      Pannel(tittle: "About", isRequired: " *"),

                    ],

                  ),

                  const SizedBox(

                    height: 10,

                  ),

                  SettingsDetails(

                    icons: Icons.verified_user_rounded,

                    name: "Privacy Policy",

                    iconsBack: CupertinoIcons.chevron_forward,

                    iPressed: () {},

                  ),

                  const SizedBox(

                    height: 10,

                  ),

                  SettingsDetails(

                    icons: Icons.privacy_tip_outlined,

                    name: "Disclaimer",

                    iconsBack: CupertinoIcons.chevron_forward,

                    iPressed: () {},

                  ),

                  const SizedBox(

                    height: 10,

                  ),

                  SettingsDetails(

                    icons: Icons.logout,

                    name: "Logout",

                    iconsBack: CupertinoIcons.chevron_forward,

                    iPressed: () {},

                  ),

                ],

              ),

            )

          ],

        ),

      ),

    );

  }

}


class SettingsDetails extends StatelessWidget {

  const SettingsDetails(

      {super.key,

      required this.icons,

      required this.name,

      required this.iconsBack,

      required this.iPressed});


  final VoidCallback iPressed;

  final IconData icons;

  final String name;

  final IconData iconsBack;


  @override

  Widget build(BuildContext context) {

    return SingleChildScrollView(

      child: Row(

        children: [

          Container(

            height: 50,

            width: 50,

            decoration: BoxDecoration(

              color: Colors.teal.shade400,

              borderRadius: BorderRadius.circular(21),

            ),

            child: Icon(

              icons,

              color: Colors.white,

            ),

          ),

          const SizedBox(

            width: 20,

          ),

          Padding(

            padding: const EdgeInsets.all(8.0),

            child: Text(

              name,

              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),

            ),

          ),

          const Spacer(),

          Padding(

            padding: const EdgeInsets.all(8.0),

            child: InkWell(

                onTap: iPressed,

                child: Icon(

                  iconsBack,

                  size: 25,

                )),

          )

        ],

      ),

    );

  }

}


class AvatarCard extends StatelessWidget {

  const AvatarCard({super.key});


  @override

  Widget build(BuildContext context) {

    return Row(

      children: [

        Image.asset(

          "lib/icons/irshad.png",

          width: 100,

          height: 100,

          fit: BoxFit.cover,

        ),

        const SizedBox(

          width: 10,

        ),

        const Column(

          children: [

            Text(

              "Md Irshad Siddique",

              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),

            ),

            Text("Flutter Developer")

          ],

        )

      ],

    );

  }

}

