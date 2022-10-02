import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veegil_bank/component/color.dart';
import 'package:veegil_bank/component/style.dart';
import 'package:veegil_bank/component/success_sheet.dart';
import 'package:veegil_bank/widget/button.dart';
import 'package:veegil_bank/widget/popover.dart';
import 'package:veegil_bank/widget/textform.dart';
import '../service/provider.dart';

class TransferMoney extends StatefulWidget {
  final BuildContext ctx;
  const TransferMoney({
    Key? key,
    required this.ctx,
  }) : super(key: key);

  @override
  State<TransferMoney> createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _account = TextEditingController();
  final TextEditingController _amount = TextEditingController();

  bool onclick = false;
  final List _isHovering = [false, false, false, false];
  List<Widget> rowElements = [];
  List<String> items = ['2000', '5000', '10000', '20000'];
  List<IconData> icons = [
    Icons.location_on,
    Icons.date_range,
    Icons.people,
    Icons.wb_sunny,
  ];

  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < items.length; i++) {
      Widget elementTile = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () {
          setState(() {
            _isHovering.replaceRange(0, _isHovering.length,
                [for (int i = 0; i < _isHovering.length; i++) false]);
            _isHovering[i] = true;
            _amount.text = items[i];
          });
        },
        onHighlightChanged: (value) {},
        child: Container(
          height: 40,
          width: 70,
          decoration: BoxDecoration(
            color: _isHovering[i] ? AppColor.orange : AppColor.primaryColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text('\$${items[i]}',
                style: style.copyWith(
                  fontSize: 12,
                  color:
                      _isHovering[i] ? AppColor.lightGrey : AppColor.lightGrey,
                )),
          ),
        ),
      );
      rowElements.add(elementTile);
    }
    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Data>(context);
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Popover(
            mainAxisSize: MainAxisSize.min,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Money Transfer',
                        style: style.copyWith(
                          fontSize: 17,
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: generateRowElements(),
                ),
                const SizedBox(height: 30),
                MyTextForm(
                  controller: _account,
                  obscureText: false,
                  hintText: 'Account',
                  validatior: (value) =>
                      (value!.isEmpty) ? "Enter correct account no" : null,
                ),
                //
                const SizedBox(height: 20),
                MyTextForm(
                  controller: _amount,
                  obscureText: false,
                  hintText: 'Amount',
                  validatior: (value) =>
                      (value!.isEmpty) ? "Enter amount" : null,
                ),
                //

                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                  ),
                  child: MainButton(
                    text: provider.isTransfer
                        ? buttonCircularIndicator
                        : Text(
                            'Transfer',
                            style: style.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: AppColor.white,
                            ),
                          ),
                    backgroundColor: AppColor.primaryColor,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        var res = await provider.transfer(
                          _account.text.trim(),
                          _amount.text.trim(),
                        );
                        if (res.statusCode == 200) {
                          if (!mounted) return;
                          Navigator.pop(context);
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            isDismissible: true,
                            context: context,
                            builder: (_) => SuccessSheet(
                              message:
                                  'You Successfully Transfer  \$${_amount.text}',
                            ),
                          );
                        } else {
                          if (!mounted) return;
                          failedOperation(context);
                          Navigator.pop(context);
                        }
                        _account.clear();
                        _account.clear();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
