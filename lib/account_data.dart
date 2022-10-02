import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veegil_bank/component/color.dart';
import 'package:veegil_bank/component/date.dart';
import 'package:veegil_bank/component/style.dart';
import 'package:veegil_bank/service/provider.dart';
import 'model/account_list.dart';

class AccountDataPage extends StatefulWidget {
  const AccountDataPage({Key? key}) : super(key: key);

  @override
  State<AccountDataPage> createState() => _AccountDataPageState();
}

class _AccountDataPageState extends State<AccountDataPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Data>(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Account List',
          style: style.copyWith(fontSize: 18),
        ),
      ),
      body: StreamBuilder<List<AccountData>>(
        stream: provider.fetchAllAccount().asStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(color: AppColor.primaryColor),
            );
          } else {
            var account = snapshot.data;
            return ListView.builder(
              itemCount: account!.length,
              itemBuilder: (_, index) {
                return Container(
                  height: 60,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 6, left: 20, right: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColor.lightGrey,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.account_balance,
                          size: 18,
                          color: AppColor.white.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            account[index]
                                .phoneNumber!, // 'Withdraw to 08038967322'
                            style: style.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor.withOpacity(0.7),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Date: ${account[index].created.day}th, ${months[account[index].created.month - 1]}  ${account[index].created.year}',
                            style: style.copyWith(
                              fontSize: 10,
                              color: AppColor.darkGrey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Text(
                        '\$${account[index].balance}',
                        style: style.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      )
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
