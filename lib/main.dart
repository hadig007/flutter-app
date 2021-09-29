import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Transaction> transaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 250.000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'House Rent',
      amount: 400.000,
      date: DateTime.now(),
    ),
  ];

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
        ),
        body: ListView(children: [
          Column(
            children: [
              // chart
              Card(
                elevation: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.purple),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "CHART",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              // textfield
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: "title"),
                        controller: titleController,
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: "amount"),
                        controller: amountController,
                      ),
                      FlatButton(
                        onPressed: () {
                          print(titleController.text);
                          print(amountController.text);
                          print(DateTime.now());
                          setState(() {
                            transaction.add(
                              Transaction(
                                id: 't3',
                                title: titleController.text,
                                amount: double.parse(amountController.text),
                                date: DateTime.now(),
                              ),
                            );
                          });
                        },
                        child: Text(
                          "add transaction",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.purple,
                      )
                    ],
                  ),
                ),
              ),
              // list of transaction
              Column(
                children: transaction.map((tx) {
                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            margin: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 7),
                            decoration:
                                BoxDecoration(border: Border.all(width: 2)),
                            child: Text(
                              "Rp" + tx.amount.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tx.title,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                tx.date.toString(),
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

class Transaction {
  String id;
  String title;
  double amount;
  DateTime date;

  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});
}
