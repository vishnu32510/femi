import 'dart:math';

import 'package:femi/core/utils/extentions/app_media_query_extensions.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'Monthly';

    var items = [
      'Monthly',
      'Yerly',
    ];
    String dropdownvalue2 = 'SelectOne';

    var items2 = [
      'SelectOne',
      'One',
      'Two',
    ];

    List itemslist = [
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun',
      'Avg',
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Statistics',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            ),
            Expanded(child: SizedBox()),
            DropdownButton(
                padding: EdgeInsets.all(5),
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Container(padding: EdgeInsets.all(10), child: Text(items)),
                  );
                }).toList(),
                onChanged: (value) {})
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
            'Excess sugar consumption is a cause of many diseases inclusing obesity, diabetes, cardiovascular conditions, harmonal imbalances and other life-threatening illnesses',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
        SizedBox(
          height: 20,
        ),
        Text(
          'Search Statistics',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            DropdownButton(
                padding: EdgeInsets.all(5),
                value: dropdownvalue2,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items2.map((String items2) {
                  return DropdownMenuItem(
                    value: items2,
                    child: Container(padding: EdgeInsets.all(10), child: Text(items2)),
                  );
                }).toList(),
                onChanged: (value) {}),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 200,
              height: 40,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 37, 148, 40),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                'Search',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        ListView.builder(
          primary: false,
          itemBuilder: (context, index) { 
            int progress = Random().nextInt(100);
            return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Eat Slowly',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      'Status: Habit',
                      style: TextStyle(color: const Color.fromARGB(255, 53, 136, 96)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      '$progress%',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 37, 148, 40),
                          borderRadius: BorderRadius.circular(20)),
                          width: context.width * 0.7,
                      height: 8,
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(20),
                        value: progress / 100,
                        backgroundColor: const Color.fromARGB(255, 240, 242, 243),
                        valueColor: 
                        progress < 75 ?AlwaysStoppedAnimation<Color>(const Color.fromARGB(255, 226, 127, 14)):AlwaysStoppedAnimation<Color>(const Color.fromARGB(255, 37, 148, 40)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: context.height * 0.1,
                  child: ListView.builder(
                    primary: false,
                      itemBuilder: (context, index) {
                        return DayAndProgress(day: itemslist[index],progress: 2,);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: itemslist.length,
                      shrinkWrap: true,),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '*average time',
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
              ],
            ),
          );},
          itemCount: 5,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        )
      ],
    );
  }
}

class DayAndProgress extends StatelessWidget {
  final String day;
  final int progress;
  const DayAndProgress({
    super.key,
    required this.day,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Text(day),
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
            child: Text(
              progress.toString(),
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
