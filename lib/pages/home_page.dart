import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weincoders_app/config/app_routes.dart';
import 'package:weincoders_app/design/colors.dart';
import 'package:weincoders_app/design/radius.dart';
import 'package:weincoders_app/pages/new_page.dart';
import 'package:weincoders_app/widgets/home_app_bar_title.dart';

class HomePage extends StatefulWidget {
  final String storeName;
  const HomePage({super.key, required this.storeName});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var buttonStyleInactive = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: WeinFluColors.brandSecondaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  var buttonStyleActive = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: WeinFluColors.brandLightColorBorder,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  Widget currentDetailWidget = BottomBodyWidget();

  late ButtonStyle categorieBtnStyle;
  late ButtonStyle recentTransactionBtnStyle;

  @override
  void initState() {
    super.initState();
    categorieBtnStyle = buttonStyleActive;
    recentTransactionBtnStyle = buttonStyleInactive;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WeinFluColors.brandLightColor,
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
          child: HomeAppBarTittle(storeName:widget.storeName),
        ),
      ),
      body: Column(
        children: [
          const TopBodyWidget(),
          MidHomePageBody(
            categoriesBtnAction: () {
              setState(() {
                currentDetailWidget = const BottomBodyWidget();
                categorieBtnStyle = buttonStyleActive;
                recentTransactionBtnStyle = buttonStyleInactive;
              });
            },
            recentBtnAction: () {
              setState(() {
                currentDetailWidget = const RecentTransactions();
                categorieBtnStyle = buttonStyleInactive;
                recentTransactionBtnStyle = buttonStyleActive;
              });
            },
            categorieBtnStyle: categorieBtnStyle,
            recentTransactionBtnStyle: recentTransactionBtnStyle,
          ),
          Expanded(child: currentDetailWidget),
        ],
      ),
    );
  }
}

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Este es el reto",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}

class BottomBodyWidget extends StatelessWidget {
  const BottomBodyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: WeinFluColors.brandLightColorBorder),
        padding: const EdgeInsets.all(16),

        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRouters.transaction);
                  },
                  child: Text(
                    "view all",
                    style: TextStyle(
                      color: WeinFluColors.brandPrimaryColor,
                      fontFamily: 'RobotoMono',

                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            CategoryDetails(
              pathToProductImage: "assets/images/pizza.png",
              color: WeinFluColors.brandOnSuccessColor,
            ),
            SizedBox(height: 20),
            CategoryDetails(
              pathToProductImage: "assets/images/tv.png",
              color: WeinFluColors.brandOnErrorColor,
            ),
            SizedBox(height: 20),
            CategoryDetails(
              pathToProductImage: "assets/images/health.png",
              color: WeinFluColors.brandOnErrorColor,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryDetails extends StatelessWidget {
  final String pathToProductImage;
  final Color color;
  const CategoryDetails({
    super.key,
    required this.pathToProductImage,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          Container(
            height: 79,
            width: 56,
            decoration: const BoxDecoration(
              color: WeinFluColors.brandSecondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(pathToProductImage)),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Foodd & Drink",
                    style: TextStyle(
                      color: WeinFluColors.brandDarkColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: "RobotoMono",
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    " 123.23 Today",
                    style: TextStyle(
                      color: WeinFluColors.brandDarkColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: "RobotoMono",
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    " 123.23",
                    style: TextStyle(
                      color: WeinFluColors.brandDarkColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: "RobotoMono",
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 60,
            margin: const EdgeInsets.only(bottom: 70),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: WeinFluColors.brandSuccessColor,
            ),
            child: ButtomPercentage(number: 12, color: color),
          ),
        ],
      ),
    );
  }
}

enum TypeButtomPercentage { increase, decrease }

class ButtomPercentage extends StatelessWidget {
  final double number;
  final Color color;
  const ButtomPercentage({
    super.key,
    required this.number,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.expand_less, color: color),
        Text(
          "12%",
          style: TextStyle(
            color: color,
            fontFamily: 'RobotoMono',
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class MidHomePageBody extends StatelessWidget {
  final ButtonStyle categorieBtnStyle;
  final ButtonStyle recentTransactionBtnStyle;
  final void Function()? recentBtnAction;
  final void Function()? categoriesBtnAction;
  const MidHomePageBody({
    super.key,
    required this.recentBtnAction,
    required this.categoriesBtnAction,
    required this.categorieBtnStyle,
    required this.recentTransactionBtnStyle,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: WeinFluRadius.large,
          bottomRight: WeinFluRadius.large,
        ),
      ),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: categoriesBtnAction,
            style: categorieBtnStyle,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'categories',
                style: TextStyle(
                  color: WeinFluColors.brandDarkColor,
                  fontFamily: "RobotoMono",
                  fontSize: 14,
                ),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: recentBtnAction,
            style: recentTransactionBtnStyle,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'recent transaction',
                style: TextStyle(
                  color: WeinFluColors.brandDarkColor,
                  fontFamily: "RobotoMono",
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopBodyWidget extends StatelessWidget {
  const TopBodyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(00, -10.0, 0.0),
      width: double.infinity,
      height: 400,

      decoration: const BoxDecoration(
        color: WeinFluColors.brandPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: WeinFluRadius.large,
          bottomRight: WeinFluRadius.large,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Text("Your buget", style: Theme.of(context).textTheme.displaySmall),
          CurrentFormatter(
            amount: 2323232,
            amountStyle: Theme.of(context).textTheme.displayLarge,
            padding: EdgeInsets.only(top: 8, right: 8),
          ),
          SumaryCardTemp(
            typeSummaryCard: TypeSumaryCard.incomes,
            title: "Ingresos",
            amount: 123434.23,
            action: () => {print("hola weincoders")},
          ),
          SizedBox(height: 8),
          SumaryCardTemp(
            typeSummaryCard: TypeSumaryCard.spending,
            title: "Gastos",
            amount: 4334.34,
            action: () => {print("hola weincoders")},
          ),
        ],
      ),
    );
  }
}

enum TypeSumaryCard { incomes, spending }

class SumaryCardTemp extends StatelessWidget {
  final TypeSumaryCard typeSummaryCard;
  final double amount;
  final Function()? action;
  final String title;
  const SumaryCardTemp({
    super.key,
    required this.typeSummaryCard,
    required this.title,
    required this.action,
    required this.amount,
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
        mainAxisAlignment: MainAxisAlignment.center,
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
                  amount: amount,
                  amountStyle: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  "From january 1 to january 32",
                  style: TextStyle(
                    color: WeinFluColors.brandLightColor,
                    fontFamily: 'Roboto',
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(WeinFluRadius.small),
              border: Border.all(color: WeinFluColors.brandSecondaryColor),
            ),
            margin: const EdgeInsets.only(top: 8),
            child: IconButton(
              onPressed: action,
              icon: const Icon(
                Icons.chevron_right,
                color: WeinFluColors.brandLightColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CurrentFormatter extends StatelessWidget {
  final double amount;
  final EdgeInsets? padding;
  final TextStyle? amountStyle;
  const CurrentFormatter({
    super.key,
    required this.amount,
    required this.amountStyle,
    this.padding,
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
          padding: padding ?? const EdgeInsets.only(right: 4, top: 2),
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
