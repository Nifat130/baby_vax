import 'package:baby_vax/core/common/widgets/custom_back_center_title_heading.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';

class LegalAndPoliciesScreen extends StatelessWidget {
  const LegalAndPoliciesScreen({super.key});

  Widget buildSection(String title, List<String> items) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
          8.heightSpace,
          ...items.map((e) => Padding(
            padding: EdgeInsets.only(bottom: 6.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "• ",
                  fontSize: 13.sp,
                  color: AppColors.textSecondary,
                ),
                Expanded(
                  child: CustomText(
                    text: e,
                    fontSize: 13.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customBackCenterTitleHeading("Legal and Policies"),
                24.heightSpace,

                /// Terms of Service
                CustomText(
                  text:
                  "Defines how users can use the app, their responsibilities, and rules for profiles, events, and payments. Here is the Terms of service-",
                  fontSize: 13.sp,
                  color: AppColors.textSecondary,
                ),
                12.heightSpace,
                buildSection("Terms of Service", [
                  "Acceptance of Terms",
                  "User Eligibility & Account Registration",
                  "User Responsibilities & Code of Conduct",
                  "Membership Types & Subscription Plans",
                  "Content Ownership & Usage Rights",
                  "Event Hosting & Participation",
                  "Payment Terms & Refund Policy",
                  "Limitations of Liability",
                  "Termination of Account",
                  "Modifications to the Service",
                  "Governing Law & Dispute Resolution",
                ]),

                /// Privacy Policy
                CustomText(
                  text:
                  "Explains what personal data we collect, how we use it, share it, and how users can control their privacy. Here is the Privacy Policy-",
                  fontSize: 13.sp,
                  color: AppColors.textSecondary,
                ),
                12.heightSpace,
                buildSection("Privacy Policy", [
                  "Information We Collect (Personal Data, Usage Data)",
                  "How We Use Your Information",
                  "Data Sharing & Third-Party Integrations (Google APIs, HMRC API, etc.)",
                  "User Control & Privacy Settings",
                  "Data Security Measures",
                  "Data Retention Policy",
                  "Cookies & Tracking Technologies",
                  "Your Data Rights (Access, Correction, Deletion)",
                  "International Data Transfers",
                  "Contact Information for Privacy Inquiries",
                ]),

                /// Community Guidelines
                CustomText(
                  text:
                  "Sets the rules for respectful behavior, safe content sharing, and how we handle violations and moderation. Here is the Community Guidelines-",
                  fontSize: 13.sp,
                  color: AppColors.textSecondary,
                ),
                12.heightSpace,
                buildSection("Community Guidelines", [
                  "Respectful & Professional Communication",
                  "No Harassment, Abuse, or Hate Speech",
                  "Authentic & Accurate Profile Information",
                  "Prohibited Content (Spam, Misinformation, Inappropriate Media)",
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
