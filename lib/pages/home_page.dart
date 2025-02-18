import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weincoders_app/design/colors.dart';
import 'package:weincoders_app/design/radius.dart';
import 'package:weincoders_app/widgets/home_app_bar_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 97,
        backgroundColor: WeinFluColors.brandLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: WeinFluRadius.small,
            bottomRight: WeinFluRadius.small,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.fromLTRB(16, 45, 16, 12),
          child: HomeAppBarTittle(),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: WeinFluColors.brandPrimaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SumaryCardTemp(
              typeSummaryCard: TypeSumaryCard.spending,
              title: "Ingresos",
            ),
          ],
        ),
      ),
    );
  }
}

enum TypeSumaryCard { incomes, spending }

class SumaryCardTemp extends StatelessWidget {
  final TypeSumaryCard typeSummaryCard;
  final String title;
  const SumaryCardTemp({
    super.key,
    required this.typeSummaryCard,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var incomesIcon = const Icon(
      Icons.arrow_upward,
      color: WeinFluColors.brandOnSuccessColor,
    );

    var spendingIcon = const Icon(
      Icons.arrow_downward,
      color: WeinFluColors.brandOnErrorColor,
    );

    return Container(
      height: 92,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: WeinFluColors.brandLightColorOpacity,
        borderRadius: BorderRadius.all(WeinFluRadius.small),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: WeinFluColors.brandLightColor,
              borderRadius: BorderRadius.all(WeinFluRadius.xs),
            ),
            child:
                typeSummaryCard == TypeSumaryCard.incomes
                    ? incomesIcon
                    : spendingIcon,
          ),
          Expanded(
            child: Text(title, style: Theme.of(context).textTheme.displaySmall),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CurrentFormatter(
                  amount: 13434.20,
                  amountStyle: Theme.of(context).textTheme.displayMedium,
                ),
                Text("Hoy", style: Theme.of(context).textTheme.displaySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CurrentFormatter extends StatelessWidget {
  final double amount;
  final TextStyle? amountStyle;
  const CurrentFormatter({
    super.key,
    required this.amount,
    required this.amountStyle,
  });
  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(
      customPattern: "#,### \u00a4",
      symbol: "",
      decimalDigits: 2,
      locale: "es",
    );
    final String convertedMOneyToString = formatter.format(amount);
    final splitConvertedValues = convertedMOneyToString.split(",");
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(right: 4, top: 2),
          child: Text('\$', style: Theme.of(context).textTheme.displaySmall),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: splitConvertedValues[0], style: amountStyle),
              TextSpan(
                text: ",${splitConvertedValues[1]}",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
