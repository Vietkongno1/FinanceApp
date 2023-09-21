import 'package:financeapp/src/data/top.dart';
import 'package:financeapp/widget/chart.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List day = ['Day', 'Week', 'Month', 'Year'];

  int index_color = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Statistics",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(4, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            index_color = index;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index_color == index
                                ? const Color.fromARGB(255, 47, 125, 121)
                                : Colors.white,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            day[index],
                            style: TextStyle(
                                color: index_color == index
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 120,
                    height: 40,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Expense ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_downward_sharp,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Chart(),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Spending",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.swap_vert,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ListTile(
                  leading: Image.asset(
                    "images/${geter_top()[index].image}",
                    height: 40,
                  ),
                  title: Text('${geter_top()[index].name!}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17
                  ),),
                  subtitle: Text('${geter_top()[index].time!}',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17
                    ),),
                  trailing: Text('${geter_top()[index].fee!}',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.red,
                        fontSize: 17
                    ),),
                );
              },
              childCount: geter_top().length,
            ))
      ],
    )));
  }
}
