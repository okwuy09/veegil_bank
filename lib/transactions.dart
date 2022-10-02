import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veegil_bank/component/color.dart';
import 'package:veegil_bank/component/date.dart';
import 'package:veegil_bank/component/style.dart';
import 'package:veegil_bank/model/transaction.dart';
import 'package:veegil_bank/service/provider.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Data>(context);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
          backgroundColor: AppColor.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            'Transaction History',
            style: style.copyWith(fontSize: 18),
          )),
      body: StreamBuilder<List<TransactionData>>(
        stream: provider.fetchAllTransaction().asStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(color: AppColor.primaryColor),
            );
          } else {
            var transaction = snapshot.data;
            return ListView.builder(
              itemCount: transaction!.length,
              itemBuilder: (_, index) {
                return Container(
                  height: 69,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 6, left: 20, right: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColor.lightGrey,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(children: [
                    Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          transaction[index].type == 'credit'
                              ? Icons.south_east_rounded
                              : Icons.north_west_rounded,
                          size: 18,
                          color: transaction[index].type == 'credit'
                              ? Colors.green
                              : AppColor.red,
                        )),
                    const SizedBox(width: 6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: screenSize.width / 1.9,
                          child: Text(
                            '${transaction[index].type == 'credit' ? 'Credit Transaction  To' : 'Debit Transaction  From'}  ${transaction[index].phoneNumber}', // 'Withdraw to 08038967322'
                            style: style.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor.withOpacity(0.6),
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Bal:  \$${transaction[index].balance}',
                          style: style.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: transaction[index].type == 'credit'
                                ? Colors.green
                                : AppColor.red.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '${transaction[index].created.day}th, ${months[transaction[index].created.month - 1]} ${transaction[index].created.year}',
                          style: style.copyWith(
                            fontSize: 10,
                            color: AppColor.darkGrey.withOpacity(0.5),
                          ),
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    Text(
                      '\$${transaction[index].amount}',
                      style: style.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: transaction[index].type == 'credit'
                            ? Colors.green
                            : AppColor.red.withOpacity(0.6),
                      ),
                    )
                  ]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
