

import 'package:baby_vax/data/hospital_flow/get_parent_information_model.dart';
import 'package:baby_vax/repositories/parent_flow_repositories/parent_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../core/common/app_snackber.dart';

class ParentHomeController extends GetxController{
  var profileIsLoading = false.obs;
  var parentRepo = ParentRepo();

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getMyInformation();
  }

  var myInformation = GetParentInformationModel();

  Future<void> getMyInformation() async{
    profileIsLoading.value = true;
    final dataList = await parentRepo.getMeAsParent();
    if(dataList.isNotEmpty){
      myInformation = GetParentInformationModel.fromJson(dataList[0]);
    }
    else{
      AppSnackBar.showError('Failed to fetch data!');
    }
    profileIsLoading.value = false;
  }

}