import 'package:baby_vax/core/common/widgets/custom_back_center_title_heading.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';

class VaccineEffectsScreen extends StatelessWidget {
  const VaccineEffectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          customBackCenterTitleHeading("Vaccine After Effects"),

          /// Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: 8.radius,
                    child: Image.asset(ImagePath.afterEffectImage, fit: BoxFit.fill, width: double.infinity,),
                  ),
                  16.heightSpace,
                  effectSection(
                    "BCG (Tuberculosis Vaccine)",
                    common: [
                      "Redness or small swelling at injection site.",
                      "Small ulcer that may leave a scar (normal).",
                      "Mild fever.",
                    ],
                    hospital: [
                      "High fever that lasts more than 3 days.",
                      "Pus-filled swelling in lymph nodes.",
                      "Wound becomes excessively large, painful, or oozing for weeks.",
                    ],
                  ),
                  effectSection(
                    "OPV (Oral Polio Vaccine – 0, 1, 2, 3 doses)",
                    common: [
                      "No major side effects in most children.",
                      "Mild diarrhea or upset stomach sometimes.",
                    ],
                    hospital: [
                      "Vomiting that doesn't stop.",
                      "Signs of dehydration (dry mouth, no tears, no urination).",
                      "Sudden weakness in arms/legs (very rare – polio-like symptoms).",
                    ],
                  ),
                  effectSection(
                    "HepB-0 (Hepatitis B – Birth dose)",
                    common: [
                      "Mild fever.",
                      "Pain or redness at injection site.",
                      "Irritability or sleepiness.",
                    ],
                    hospital: [
                      "High fever (above 102°F / 39°C).",
                      "Severe allergic reaction (swelling of face/lips, difficulty breathing).",
                      "Seizures (very rare).",
                    ],
                  ),
                  effectSection(
                    "Pentavalent-1, 2, 3 (DPT + HepB + Hib)",
                    common: [
                      "Fever (mild to moderate).",
                      "Pain or swelling at injection site.",
                      "Fussiness, drowsiness, poor appetite.",
                    ],
                    hospital: [
                      "Fever above 102°F (39°C) not coming down.",
                      "Continuous crying for more than 3 hours.",
                      "Convulsions or seizures.",
                      "Floppy or unresponsive baby.",
                    ],
                  ),
                  effectSection(
                    "PCV-1, 2, 3 (Pneumococcal Vaccine)",
                    common: [
                      "Mild fever.",
                      "Redness or swelling at injection site.",
                      "Decreased appetite or sleepiness.",
                    ],
                    hospital: [
                      "Difficulty breathing.",
                      "High fever not controlled by medicine.",
                      "Rash or swelling of face/tongue (sign of allergy).",
                    ],
                  ),
                  effectSection(
                    "Rota-1, 2, 3 (Rotavirus Vaccine – oral)",
                    common: [
                      "Mild diarrhea or vomiting.",
                      "Temporary stomach upset.",
                    ],
                    hospital: [
                      "Persistent vomiting or diarrhea causing dehydration.",
                      "Blood in stool.",
                      "Severe abdominal bloating (may indicate rare condition called intussusception).",
                    ],
                  ),
                  effectSection(
                    "IPV (Inactivated Polio – injection)",
                    common: [
                      "Mild fever.",
                      "Swelling or soreness at injection site.",
                    ],
                    hospital: [
                      "High fever.",
                      "Severe allergic reaction (rash, breathing difficulty).",
                      "Unusual weakness in arms or legs.",
                    ],
                  ),
                  effectSection(
                    "MR-1 & MR-2 (Measles-Rubella Vaccine)",
                    common: [
                      "Mild fever or rash (may appear 5–10 days after vaccination).",
                      "Swelling at injection site.",
                      "Sore throat or cold-like symptoms.",
                    ],
                    hospital: [
                      "High fever with rash and convulsions.",
                      "Difficulty breathing or swelling of lips/tongue.",
                      "Lethargy or child not waking up normally.",
                    ],
                  ),
                  effectSection(
                    "DPT Booster-1 & 2",
                    common: [
                      "Pain, swelling, or redness at injection site.",
                      "Mild fever.",
                      "Irritability or drowsiness.",
                    ],
                    hospital: [
                      "High fever or persistent crying.",
                      "Convulsions or fainting.",
                      "Signs of allergic reaction.",
                    ],
                  ),
                  effectSection(
                    "IPV Booster",
                    common: [
                      "Soreness at injection site.",
                      "Mild fever.",
                      "Tiredness or fussiness.",
                    ],
                    hospital: [
                      "Unusual weakness.",
                      "High, persistent fever.",
                      "Signs of allergy (hives, swelling, difficulty breathing).",
                    ],
                  ),
                  effectSection(
                    "Typhoid Vaccine",
                    common: [
                      "Pain at injection site.",
                      "Mild fever or headache.",
                      "Nausea or tiredness.",
                    ],
                    hospital: [
                      "High fever for more than 2 days.",
                      "Severe allergic reaction.",
                      "Severe vomiting or diarrhea.",
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Vaccine Effect Section
Widget effectSection(
    String title, {
      required List<String> common,
      required List<String> hospital,
    }) {
  return Padding(
    padding: EdgeInsets.only(bottom: 24.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),

        /// Title
        CustomText(
          text: title,
          fontSize: 16.sp,
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 8.h),

        /// Common Effects
        CustomText(
          text: "😊 Common Effects:",
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        ...common.map((e) => bulletText(e)),

        SizedBox(height: 6.h),

        /// Hospital Cases
        CustomText(
          text: "🚨 Go to hospital if:",
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        ...hospital.map((e) => bulletText(e)),
      ],
    ),
  );
}

/// Reusable bullet text widget
Widget bulletText(String text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 2.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("• ", style: TextStyle(fontSize: 14.sp)),
        Expanded(
          child: CustomText(
            text: text,
            fontSize: 14.sp,
          ),
        ),
      ],
    ),
  );
}

///
