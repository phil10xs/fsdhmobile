import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fsdh_mobile/view-model/report.dart';
import 'package:fsdh_mobile/views/screens/addexpense.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class ReportView extends StatefulWidget {
  static const String routeName = '/report';
  const ReportView({Key? key}) : super(key: key);

  @override
  _ReportViewState createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  Future<dynamic> addNewExpenses(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return const AddNewExpense();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          addNewExpenses(context);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/img/avatar.webp'),
            maxRadius: 20,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              App.pop();
            },
            child: Image.asset(
              'assets/img/slidebar.png',
              scale: 3.4,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Consumer<ReportNotifier>(
          builder: (_, value, __) => ListView(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Hello Phillip,',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: DropdownButton<int>(
                          value: value.current,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: const SizedBox(),
                          onChanged: (int? i) {
                            value.currentt = i!;
                          },
                          items: [
                            for (var j = 0; j < value.labels.length; j++)
                              DropdownMenuItem<int>(
                                value: j,
                                child: Text(value.labels[j]),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      FutureBuilder(
                        future: value.current == 0
                            ? Provider.of<ReportNotifier>(
                                context,
                              ).calcMonthlyExpsense()
                            : Provider.of<ReportNotifier>(
                                context,
                              ).calcMonthlyCategory(),
                        builder: (context, snapshot) => SizedBox(
                          width: double.infinity,
                          height: 350,
                          child: Consumer<ReportNotifier>(
                            builder: (_, value, __) => BarChart(
                              BarChartData(
                                alignment: BarChartAlignment.spaceBetween,
                                barTouchData: BarTouchData(
                                  enabled: true,
                                ),
                                titlesData: FlTitlesData(
                                  show: true,
                                  bottomTitles: SideTitles(
                                    showTitles: true,
                                    rotateAngle: 0,
                                    margin: 8,
                                    reservedSize: 10,
                                    getTitles: (double i) {
                                      return value.expense[i.toInt()]['label'];
                                    },
                                  ),
                                  topTitles: SideTitles(
                                    showTitles: true,
                                    rotateAngle: 0,
                                    margin: 8,
                                    getTitles: (_) {
                                      return '';
                                    },
                                  ),
                                ),
                                groupsSpace: 200,
                                borderData: FlBorderData(show: false),
                                barGroups: [
                                  for (var i = 0; i < value.expense.length; i++)
                                    BarChartGroupData(
                                      x: i,
                                      barRods: [
                                        BarChartRodData(
                                          y: value.expense[i]['total']
                                              .toDouble(),
                                          colors: [
                                            Colors.red.shade300,
                                            Colors.red.shade500,
                                            Colors.red.shade700,
                                            Colors.red.shade900,
                                          ],
                                          width: 10,
                                          backDrawRodData:
                                              BackgroundBarChartRodData(
                                            show: true,
                                            y: 500000,
                                            colors: [
                                              Colors.white,
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
