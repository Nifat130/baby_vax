import 'package:baby_vax/core/common/widgets/custom_back_center_title_heading.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';

class VaccineProsAndConsScreen extends StatelessWidget {
  const VaccineProsAndConsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          customBackCenterTitleHeading("Vaccine Pros & Cons"),

          /// Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vaccineSection(
                    "BCG – Bacillus Calmette-Guérin (Tuberculosis)",
                    image: ImagePath.bcgImage,
                    given: [
                      "Protects against severe forms of childhood TB.",
                      "Reduces risk of TB meningitis and miliary TB.",
                      "Strengthens early immune response to TB bacteria.",
                    ],
                    notGiven: [
                      "Higher risk of severe TB in infants.",
                      "TB may spread rapidly to lungs and brain.",
                      "Increased risk of TB-related death.",
                    ],
                  ),
                  vaccineSection(
                    "OPV-0 – Oral Polio Vaccine (Birth dose)",
                    image: ImagePath.opvImage,
                    given: [
                      "Provides early protection against poliovirus.",
                      "Helps prevent paralysis from polio.",
                      "Reduces virus transmission in the community.",
                    ],
                    notGiven: [
                      "Child remains vulnerable to polio infection.",
                      "Risk of permanent paralysis.",
                      "May spread the virus to others.",
                    ],
                  ),
                  vaccineSection(
                    "HepB-0 – Hepatitis B (Birth dose)",
                    image: ImagePath.hepatitisImage,
                    given: [
                      "Prevents mother-to-child transmission of hepatitis B.",
                      "Reduces risk of chronic liver disease and cancer.",
                      "Builds lifelong protection when followed by full schedule.",
                    ],
                    notGiven: [
                      "High risk of lifelong hepatitis B infection.",
                      "Possibility of liver failure or liver cancer.",
                      "Can unknowingly transmit to others later in life.",
                    ],
                  ),
                  vaccineSection(
                    "OPV-1 / OPV-2 / OPV-3 – Oral Polio Vaccine",
                    image: ImagePath.opvOneThreeImage,
                    given: [
                      "Boosts immunity with each dose.",
                      "Prevents poliovirus infection and transmission.",
                      "Strengthens intestinal immunity.",
                    ],
                    notGiven: [
                      "Weak or no immunity against polio.",
                      "High risk of paralytic polio.",
                      "Contributes to community outbreaks.",
                    ],
                  ),
                  vaccineSection(
                    "Pentavalent-1 / 2 / 3 – (DPT + HepB + Hib)",
                    image: ImagePath.pentabioImage,
                    given: [
                      "Protects against 5 deadly diseases (diphtheria, pertussis, tetanus, hepatitis B, Hib).",
                      "Prevents serious complications like brain swelling, liver damage, pneumonia.",
                      "Provides broad protection with fewer injections.",
                    ],
                    notGiven: [
                      "Risk of multiple infections at once.",
                      "High chance of hospitalization or death.",
                      "May lead to long-term disabilities or chronic illness.",
                    ],
                  ),
                  vaccineSection(
                    "PCV-1 / 2 / 3 – Pneumococcal Conjugate Vaccine",
                    image: ImagePath.pneumoImage,
                    given: [
                      "Prevents pneumonia, meningitis, and ear infections.",
                      "Reduces antibiotic resistance by preventing infections.",
                      "Protects against severe bacterial complications.",
                    ],
                    notGiven: [
                      "Increased risk of deadly bacterial infections.",
                      "Possible hearing loss from ear infections.",
                      "Risk of brain damage or death from meningitis.",
                    ],
                  ),
                  vaccineSection(
                    "Rota-1 / 2 / 3 – Rotavirus Vaccine",
                    image: ImagePath.rotaImage,
                    given: [
                      "Prevents severe diarrhea in infants.",
                      "Reduces risk of dehydration and hospitalization.",
                      "Saves from life-threatening complications in early years.",
                    ],
                    notGiven: [
                      "High risk of severe rotavirus diarrhea.",
                      "Possibility of death from dehydration.",
                      "Burden on family due to frequent hospital visits.",
                    ],
                  ),
                  vaccineSection(
                    "IPV – Inactivated Polio Vaccine (Injection)",
                    image: ImagePath.inactivatedImage,
                    given: [
                      "Provides extra polio protection along with OPV.",
                      "Builds strong systemic immunity.",
                      "Helps in global polio eradication efforts.",
                    ],
                    notGiven: [
                      "Incomplete protection against polio.",
                      "Child may still be vulnerable despite OPV.",
                      "Risk of carrying and spreading virus.",
                    ],
                  ),
                  vaccineSection(
                    "MR-1 & MR-2 – Measles-Rubella Vaccine",
                    image: ImagePath.mmrImage,
                    given: [
                      "Prevents measles and rubella (German measles).",
                      "Avoids severe complications like pneumonia, brain damage, miscarriage (rubella in pregnancy).",
                      "Protects public through herd immunity.",
                    ],
                    notGiven: [
                      "Child can get measles or rubella.",
                      "Risk of blindness, brain swelling, or death from measles.",
                      "Pregnant women exposed to rubella can have miscarriages or babies with birth defects.",
                    ],
                  ),
                  vaccineSection(
                    "DPT Booster-1 & Booster-2",
                    image: ImagePath.dtpImage,
                    given: [
                      "Maintains long-term immunity from diphtheria, tetanus, and whooping cough.",
                      "Prevents severe coughing illness and muscle spasms.",
                      "Keeps protection into school-age years.",
                    ],
                    notGiven: [
                      "Immunity fades with time.",
                      "Risk of reinfection or complications in older children.",
                      "Can unknowingly spread pertussis to infants.",
                    ],
                  ),
                  vaccineSection(
                    "IPV Booster",
                    image: ImagePath.ipvImage,
                    given: [
                      "Strengthens protection against all 3 types of polio virus.",
                      "Ensures lasting immunity through childhood.",
                      "Helps prevent resurgence of polio.",
                    ],
                    notGiven: [
                      "Immunity may weaken with age.",
                      "Higher chance of infection in future outbreaks.",
                      "May contribute to polio re-emergence.",
                    ],
                  ),
                  vaccineSection(
                    "Typhoid Vaccine",
                    image: ImagePath.typhoidImage,
                    given: [
                      "Protects against typhoid fever, especially in high-risk areas.",
                      "Prevents severe illness, intestinal damage, or death.",
                      "Reduces need for antibiotics and hospitalization.",
                    ],
                    notGiven: [
                      "Risk of typhoid infection through contaminated food/water.",
                      "Can lead to serious complications like intestinal perforation.",
                      "Spreads easily to others in unsanitary conditions.",
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

/// Vaccine Section Widget
Widget vaccineSection(
    String title, {
      required String image,
      required List<String> given,
      required List<String> notGiven,
    }) {
  return Padding(
    padding: EdgeInsets.only(bottom: 24.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Image
        ClipRRect(
          borderRadius: 8.radius,
          child: Image.asset(
            image,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        ),
        SizedBox(height: 10.h),

        /// Title
        CustomText(
          text: title,
          fontSize: 16.sp,
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 8.h),

        /// If Given
        CustomText(
          text: "✅ If given:",
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        ...given.map((e) => bulletText(e)),

        SizedBox(height: 6.h),

        /// If Not Given
        CustomText(
          text: "❌ If not given:",
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        ...notGiven.map((e) => bulletText(e)),
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
