import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:task/config/extensions/spacing_extensions.dart';
import 'package:task/core/shared/transaction_model.dart';

class TransactionWithDate extends HookWidget {
  TransactionWithDate(
    this.timestamp,
    this.tModel, {
    super.key,
  });
  final String timestamp;
  final List<TransactionModel> tModel;

  num totalTimeStampAmount = 0;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      for (var element in tModel) {
        totalTimeStampAmount += element.amount;
      }
      return () {
        debugPrint("Dispose");
      };
    }, []);
    return Column(
      children: [
        Container(
          height: 30,
          color: Color(0xFFF5F8F9),
          // alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                timestamp,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF596F7C),
                ),
              ).addPadding(vertical: 5, horizontal: 15),
              Text(
                "-£$totalTimeStampAmount",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF596F7C),
                ),
              ).addPadding(vertical: 5, horizontal: 15),
            ],
          ),
        ),
        8.height,
        SizedBox(
          child: Column(
            children: tModel.map((toElement) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xFFE0FFE0),
                        child: Icon(
                          Icons.food_bank_outlined,
                          color: Colors.black,
                        ),
                      ),
                      7.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            toElement.description,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2C404B),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFE3ECF1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              toElement.label,
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF657A86),
                              ),
                            ).addPadding(overall: 4),
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesome.cash_register_solid,
                                size: 10,
                              ),
                              2.width,
                              Text(
                                "Cash Wallet",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF657A86),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "-£${toElement.amount}",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Colors.red,
                      // color: Color(0xFF596F7C),
                    ),
                  ),
                ],
              ).addPadding(horizontal: 12, vertical: 8);
            }).toList(),
          ),
        ),
      ],
    );
  }
}
