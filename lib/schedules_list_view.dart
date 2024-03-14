import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:schedules/scheduled_transactions.dart';

class ScheduleListsView extends StatefulWidget {
  final List<Transaction> transactions;

  const ScheduleListsView({
    super.key,
    required this.transactions,
  });

  @override
  State<StatefulWidget> createState() => _ScheduleListsViewState();
}

class _ScheduleListsViewState extends State<ScheduleListsView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.transactions.length, // Adjust according to your data
      itemBuilder: (context, index) {
        var name = widget.transactions[index].name;
        var currencyCode = widget.transactions[index].currencyCode;
        var amount = widget.transactions[index].amount.toStringAsFixed(2);
        String paymentDate =
            DateFormat.yMMMMd().format(widget.transactions[index].paymentDate);
        return Card(
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 30,
            right: 30,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '$currencyCode $amount',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      widget.transactions[index].status,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                        fontSize: 10.0,
                        color: Colors.red,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        const Text(
                          'PAYMENT DATE',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          paymentDate,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
