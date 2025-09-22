import 'package:baby_vax/core/common/widgets/custom_back_center_title_heading.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';

class BabyCareScreen extends StatelessWidget {
  const BabyCareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          customBackCenterTitleHeading("Baby Care"),

          /// Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: 8.radius,
                      child: Image.asset(ImagePath.babyCareImage, fit: BoxFit.fill, width: double.infinity,)
                  ),
                  16.heightSpace,
                  sectionTitle("🍼 0–6 Months"),
                  bulletText("Exclusive breastfeeding (no water, juice, or food)."),
                  bulletText("Feed on demand (8–12 times/day)."),
                  bulletText("Ensure proper latching and burping after feeds."),
                  tipText("Breast milk provides all nutrition and immunity."),
                  tipText("Monitor urine output (≥6 wet diapers/day) and weight gain."),

                  sectionTitle("🍎 6–12 Months"),
                  bulletText("Continue breastfeeding."),
                  bulletText("Introduce complementary foods at 6 months: mashed fruits, mashed vegetables, soft rice, dal, suji, oats, well-cooked eggs, yogurt, small amounts of ghee/oil."),
                  bulletText("2–3 solid meals + 1–2 snacks + breastmilk."),
                  tipText("Introduce one new food at a time."),
                  tipText("Avoid honey (risk of botulism)."),
                  tipText("No cow’s milk before 1 year."),

                  sectionTitle("🍲 1–2 Years"),
                  bulletText("3 main meals + 2 healthy snacks per day."),
                  bulletText("Include rice/roti/porridge, seasonal fruits, vegetables, dairy, eggs, fish/meat (well-cooked), pulses and legumes."),
                  bulletText("Water is the main drink; limit milk to 400–500 ml/day."),
                  tipText("Encourage eating with family."),
                  tipText("Avoid small hard foods (nuts, grapes) to prevent choking."),

                  sectionTitle("🥗 2–5 Years"),
                  bulletText("Balanced diet with all food groups (carbs, proteins, fats, fruits/veggies, dairy)."),
                  bulletText("5 meals daily: breakfast, mid-morning snack, lunch, evening snack, dinner."),
                  tipText("Limit sugary snacks and junk food."),
                  tipText("Offer water instead of juice or soft drinks."),
                  tipText("Encourage self-feeding and table manners."),
                  tipText("Involve child in choosing and preparing food."),

                  sectionTitle("🚫 Foods to Avoid (Under 5)"),
                  bulletText("Junk food (chips, soda, fast food)."),
                  bulletText("Sugary snacks and processed sweets."),
                  bulletText("Excess salt or spicy food."),
                  bulletText("Raw honey (under 1 year)."),
                  bulletText("Unpasteurized milk or cheese."),
                  bulletText("Whole nuts (choking hazard under 3 years)."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
      child: CustomText(
        text: text,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget bulletText(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: CustomText(
        text: "• $text",
        fontSize: 14.sp,
      ),
    );
  }

  Widget tipText(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w, top: 2.h, bottom: 2.h),
      child: CustomText(
        text: "👉 $text",
        fontSize: 13.sp,
        color: Colors.grey[700],
      ),
    );
  }
}
