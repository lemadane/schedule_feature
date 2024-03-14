// Import libraries
import 'package:flutter/material.dart';
import 'package:schedules/schedules_list_view.dart';
import 'package:schedules/schedules_menu_bar.dart';
import 'package:schedules/scheduled_transactions.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schedules',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SchedulesPage(transactions: scheduledTransactions),
    );
  }
}

// ignore: must_be_immutable
class SchedulesPage extends StatefulWidget {
  final List<Transaction> transactions;
  List<Transaction>? _transactions;

  SchedulesPage({Key? key, required this.transactions}) : super(key: key);

  @override
  State<SchedulesPage> createState() => _SchadulesPage();
}

class _SchadulesPage extends State<SchedulesPage> {
  @override
  Widget build(BuildContext context) {
    if (widget._transactions == null) {
      widget._transactions = [];
      widget._transactions?.addAll(
        widget.transactions,
      );
    }
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Schedules'),
          bottom: const TabBar(tabs: [
            Tab(text: 'Send Money'),
            Tab(text: 'Pay Bills'),
          ]),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                SchedulesMenuBar(
                  onSelectedFilterChanged: (int value) {
                    switch (value) {
                      case 1:
                        setState(() {
                          widget._transactions?.clear();
                          widget._transactions?.addAll(
                            widget.transactions.where(
                              (t) => t.status == 'PENDING',
                            ),
                          );
                        });
                        break;

                      case 2:
                        setState(() {
                          widget._transactions?.clear();
                          widget._transactions?.addAll(
                            widget.transactions.where(
                              (t) => t.status == 'IN PROGRESS',
                            ),
                          );
                        });
                        break;

                      case 3:
                        setState(() {
                          widget._transactions?.clear();
                          widget._transactions?.addAll(
                            widget.transactions.where(
                              (t) => t.status == 'COMPLETED',
                            ),
                          );
                        });
                        break;

                      case 4:
                        setState(() {
                          widget._transactions?.clear();
                          widget._transactions?.addAll(
                            widget.transactions.where(
                              (t) => t.status == 'CANCELLED',
                            ),
                          );
                        });
                        break;

                      case 5:
                        setState(() {
                          widget._transactions?.clear();
                          widget._transactions?.addAll(
                            widget.transactions.where(
                              (t) => t.status == 'FAILED',
                            ),
                          );
                        });
                        break;

                      case 0:
                      default:
                        setState(() {
                          widget._transactions?.clear();
                          widget._transactions?.addAll(widget.transactions);
                        });
                        break;
                    }
                  },
                  onSelectedSortChanged: (int value) {
                    switch (value) {
                      case 1:
                        setState(() {
                          widget._transactions?.sort(
                            (a, b) => a.paymentDate.compareTo(b.paymentDate),
                          );
                        });
                        break;

                      case 2:
                        setState(() {
                          widget._transactions?.sort(
                            (a, b) => a.name
                                .toUpperCase()
                                .compareTo(b.name.toUpperCase()),
                          );
                        });
                        break;

                      case 3:
                        setState(() {
                          widget._transactions?.sort(
                            (a, b) => a.name
                                .toUpperCase()
                                .compareTo(b.name.toUpperCase()),
                          );
                          final temp = <Transaction>[];
                          temp.addAll(widget._transactions!.reversed);
                          widget._transactions?.clear();
                          widget._transactions?.addAll(temp);
                        });
                        break;

                      case 0:
                      default:
                        setState(() {
                          widget._transactions?.sort(
                            (a, b) => a.paymentDate.compareTo(b.paymentDate),
                          );
                          final temp = <Transaction>[];
                          temp.addAll(widget._transactions!.reversed);
                          debugPrint('temp= ${temp.length}');
                          widget._transactions?.clear();
                          widget._transactions?.addAll(temp);
                        });
                    }
                  },
                ),
                Expanded(
                  child: ScheduleListsView(
                    transactions: widget._transactions!,
                  ),
                ),
                //ScheduleListsView(transactions: transactions),
              ],
            ),
            const Column(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
