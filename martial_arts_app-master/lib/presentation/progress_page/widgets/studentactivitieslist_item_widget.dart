import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:martial_art/presentation/progress_page/controller/progress_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../core/app_export.dart';
import '../models/studentactivitieslist_item_model.dart';

class StudentactivitieslistItemWidget extends StatelessWidget {
  StudentactivitieslistItemWidget(
    this.studentactivitieslistItemModelObj, {
    Key? key,
  }) : super(key: key);

  final StudentactivitieslistItemModel studentactivitieslistItemModelObj;

  final ProgressController controller = Get.find<ProgressController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        color: appTheme.whiteA700,
        // elevation: 1.0,
        elevation: 2,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: appTheme.whiteA700,
            borderRadius: BorderRadius.circular(15),
          ),
          // height: 150,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Obx(
                      () => CustomImageView(
                        imagePath:
                            studentactivitieslistItemModelObj.bedImage1!.value,
                        height: 50,
                        width: 50,
                        // height: 40.v,
                        // width: 43.h,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 12, top: 5, bottom: 5),
                  child: Obx(() => RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: studentactivitieslistItemModelObj
                                  .bedText!.value,
                              style: GoogleFonts.montserrat(
                                color: appTheme.gray700,
                                fontSize: 12,
                                // fontFamily: 'Noto Sans',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(text: '\n'),
                            TextSpan(
                              text: studentactivitieslistItemModelObj
                                  .miniText!.value,
                              style: GoogleFonts.poppins(
                                color: appTheme.gray700,
                                fontSize:
                                    12, // This sets the size of the second text to 11.
                                // fontFamily: 'Noto Sans',
                                fontWeight: FontWeight
                                    .w500, // This makes the second text normal.
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 60,
                width: 60,
                child: SFCircularDonutChart(
                  data: [
                    CircularChartModel(
                        'completed',
                        studentactivitieslistItemModelObj.completed!,
                        theme.primaryColor),
                    CircularChartModel(
                        'left',
                        100 - studentactivitieslistItemModelObj.completed!,
                        Colors.transparent),

                    // CircularChartModel('Category 3', 20, Colors.red),
                  ],
                ),
                //   child: SfCircularChart(
                //     tooltipBehavior: TooltipBehavior(enable: true),
                //     series: <CircularSeries<_ChartData, String>>[
                //       DoughnutSeries<_ChartData, String>(
                //           dataSource: data,
                //           xValueMapper: (_ChartData data, _) => data.x,
                //           yValueMapper: (_ChartData data, _) => data.y,
                //           name: 'Gold')
                //     ],
                //   ),
                // ),
                // child: CircularProgressIndicator(
                //   strokeWidth: 2,
                // ),
              ),
              // SizedBox(width: 10,),
            ],
          ),
        ),
      ),
    );
  }
}

class SFCircularDonutChart extends StatelessWidget {
  final List<CircularChartModel> data;

  const SFCircularDonutChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      // title: ChartTitle(text: 'Customized Donut Chart'),
      // legend: Legend(isVisible: true),
      series: <CircularSeries>[
        DoughnutSeries<CircularChartModel, String>(
          dataSource: data,
          pointColorMapper: (CircularChartModel data, _) => data.color,
          xValueMapper: (CircularChartModel data, _) => data.x,
          yValueMapper: (CircularChartModel data, _) => data.y,
          // dataLabelSettings: DataLabelSettings(isVisible: true),
          radius: '80%',
          innerRadius: '50%',
          strokeColor: Colors.black12,
          strokeWidth: 1,
          // startAngle: 15,
          // explode: true,
          // explodeIndex: 0,

          // enableSmartLabels: true,
        ),
      ],
    );
  }
}

class CircularChartModel {
  final String x;
  final double y;
  final Color color;

  CircularChartModel(this.x, this.y, this.color);
}
