import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:parakanm_uni/utils/colors.dart';
import 'package:parakanm_uni/widgets/indicator.dart';
import 'package:parakanm_uni/utils/data.dart';

class PieTransactionChart extends StatefulWidget {
  const PieTransactionChart({super.key});

  @override
  State<StatefulWidget> createState() => PieTransactionChartState();
}

class PieTransactionChartState extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final incomePercentage = getIncomePercentage();
    final expensePercentage = getExpensePercentage();

    return AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Indicator(
                color: greenColor100,
                text: 'Incomes',
                isSquare: false,
                size: touchedIndex == 0 ? 18 : 16,
                textColor: touchedIndex == 0 ? darkGreyColor : darkGreyColor,
              ),
              Indicator(
                color: redColor100,
                text: 'Expenses',
                isSquare: false,
                size: touchedIndex == 1 ? 18 : 16,
                textColor: touchedIndex == 1 ? darkGreyColor : darkGreyColor,
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  startDegreeOffset: 180,
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 1,
                  centerSpaceRadius: 0,
                  sections:
                      showingSections(incomePercentage, expensePercentage),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(
      double incomePercentage, double expensePercentage) {
    return List.generate(
      2,
      (i) {
        final isTouched = i == touchedIndex;
        const incomes = greenColor100;
        const expenses = redColor100;

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: incomes,
              value: incomePercentage,
              title: '${incomePercentage.toStringAsFixed(1)}%',
              radius: isTouched ? 120 : 100,
              titleStyle: TextStyle(
                // Add title style
                fontSize: isTouched ? 18 : 16,
                fontWeight: FontWeight.bold,
                color: whiteColor,
              ),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(color: whiteColor, width: 6)
                  : BorderSide(color: whiteColor.withOpacity(0)),
            );
          case 1:
            return PieChartSectionData(
              color: expenses,
              value: expensePercentage,
              title: '${expensePercentage.toStringAsFixed(1)}%',
              radius: isTouched ? 120 : 100,
              titleStyle: TextStyle(
                // Add title style
                fontSize: isTouched ? 18 : 16,
                fontWeight: FontWeight.bold,
                color: whiteColor,
              ),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(color: whiteColor, width: 6)
                  : BorderSide(color: whiteColor.withOpacity(0)),
            );
          default:
            throw Error();
        }
      },
    );
  }
}
