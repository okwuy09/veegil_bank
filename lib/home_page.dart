import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veegil_bank/account_data.dart';
import 'package:veegil_bank/component/color.dart';
import 'package:veegil_bank/component/date.dart';
import 'package:veegil_bank/component/style.dart';
import 'package:veegil_bank/model/transaction.dart';
import 'package:veegil_bank/service/provider.dart';
import 'package:veegil_bank/transactions.dart';
import 'package:veegil_bank/users.dart';
import 'package:veegil_bank/widget/home_tras_container.dart';
import 'package:veegil_bank/widget/transfer_money.dart';
import 'package:veegil_bank/widget/withdraw_money.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Data>(context);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                right: 20,
                left: 20,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: style.copyWith(
                          fontWeight: FontWeight.normal,
                          color: AppColor.darkGrey.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Maduka Okwuchukwu',
                        style: style.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: AppColor.lightGrey,
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage('assets/person.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 150,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Balance',
                      style: style.copyWith(
                        color: Colors.white.withOpacity(0.5),
                      )),
                  const SizedBox(height: 8),
                  Container(
                    height: 32,
                    //width: double.infinity,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '\$103,000',
                      style: style.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColor.orange.withOpacity(0.8),
                      ),
                    ),
                  ),
                  //const SizedBox(height: 35),
                  Expanded(child: Container()),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: 35,
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Account No.',
                              style: style.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              '080654678945',
                              style: style.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.white.withOpacity(0.6),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //
            const SizedBox(height: 15),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TransactionContainer(
                      icon: Icon(
                        Icons.moving,
                        color: AppColor.white.withOpacity(0.8),
                      ),
                      text: 'Transfer',
                      onTap: () => showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => TransferMoney(ctx: context),
                      ),
                    ),
                    const SizedBox(width: 8),
                    TransactionContainer(
                      icon: Icon(
                        Icons.keyboard_double_arrow_down_outlined,
                        color: AppColor.white.withOpacity(0.8),
                      ),
                      text: 'Withdraw',
                      onTap: () => showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => const WithdrewMoney()),
                    ),
                    const SizedBox(width: 8),
                    TransactionContainer(
                      icon: Icon(
                        Icons.account_balance,
                        color: AppColor.white.withOpacity(0.8),
                      ),
                      text: 'A/c List',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AccountDataPage(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    TransactionContainer(
                      icon: Icon(
                        Icons.person,
                        color: AppColor.white.withOpacity(0.8),
                      ),
                      text: 'Auth Users',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const UsersPage(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    TransactionContainer(
                      icon: Icon(
                        Icons.swap_vert,
                        color: AppColor.white.withOpacity(0.8),
                      ),
                      text: 'Transactions',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TransactionPage(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                ),
                child: Text(
                  'Recent Transaction',
                  style: style.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
            ),
            StreamBuilder<List<TransactionData>>(
              stream: provider.fetchAllTransaction().asStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SizedBox(
                    height: 300,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primaryColor,
                      ),
                    ),
                  );
                } else {
                  var transaction = snapshot.data;

                  return ListView.builder(
                    itemCount: transaction!.take(4).length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding:
                        const EdgeInsets.only(top: 15, right: 20, left: 20),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 69,
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                          bottom: 6,
                        ),
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
                                    '${transaction[index].type == 'credit' ? 'Credit transaction to' : 'Debit transaction from'}   ${transaction[index].phoneNumber}', // 'Withdraw to 08038967322'
                                    style: style.copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.primaryColor
                                          .withOpacity(0.6),
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
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
