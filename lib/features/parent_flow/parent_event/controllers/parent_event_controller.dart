
import 'package:baby_vax/core/utils/logging/logger.dart';
import 'package:baby_vax/data/hospital_flow/get_events_model.dart';
import 'package:baby_vax/repositories/parent_flow_repositories/parent_repo.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/image_path.dart';

class ParentEventController extends GetxController{

  var vaccineEvents = <GetEventsModel>[].obs;
  List<String> vaccinesType = [
    "All",
    "BCG", "OPV-0", "HepB-0",
    "OPV-1", "Pentavalent-1", "PCV-1", "Rota-1",
    "OPV-2", "Pentavalent-2", "PCV-2", "Rota-2",
    "OPV-3", "IPV", "Pentavalent-3", "PCV-3", "Rota-3",
    "MR-1",
    "MR-2", "DPT Booster-1", "IPV Booster",
    "DPT Booster-2", "Typhoid Vaccine",
    "DPT Booster-2"
  ];

  final selectedVaccineType = 'All'.obs;
  var isLoading = false.obs;
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    await getVaccineEvents();
    isLoading.value = false;
  }

  void search() async{
    isLoading.value = true;
    await getVaccineEvents();
    isLoading.value = false;
  }
  var parentRepo = ParentRepo();
  Future<void> getVaccineEvents() async{
    try{
      vaccineEvents.clear();
      final response = await parentRepo.getVaccineEvents(selectedVaccineType.value);
      AppLoggerHelper.error(response.toString());
      if(response.isNotEmpty){
        vaccineEvents.addAll(response.map((event) => GetEventsModel.fromJson(event)));
      }
    }catch(e){
      AppLoggerHelper.error(e.toString());
    }
  }
}