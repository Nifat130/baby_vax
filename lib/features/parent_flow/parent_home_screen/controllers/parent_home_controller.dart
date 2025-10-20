

import 'package:baby_vax/core/services/Auth_service.dart';
import 'package:baby_vax/core/utils/logging/logger.dart';
import 'package:baby_vax/data/hospital_flow/get_parent_information_model.dart';
import 'package:baby_vax/data/parent_flow/get_my_children_model.dart';
import 'package:baby_vax/repositories/parent_flow_repositories/parent_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../core/common/app_snackber.dart';

class ParentHomeController extends GetxController{
  var profileIsLoading = false.obs;
  var childrenListIsLoading = true.obs;
  var parentRepo = ParentRepo();

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getMyInformation();
    await getMyChildren();
  }

  var myInformation = GetParentInformationModel();

  Future<void> getMyInformation() async{
    profileIsLoading.value = true;
    final dataList = await parentRepo.getMeAsParent();
    AppLoggerHelper.info(dataList.toString());
    if(dataList.isNotEmpty){
      myInformation = GetParentInformationModel.fromJson(dataList[0]);
    }
    else{
      AppSnackBar.showError('Failed to fetch data!');
    }
    profileIsLoading.value = false;
  }

  var children = <GetMyChildrenModel>[];
  Future<void> getMyChildren() async{
    AppLoggerHelper.info("I am here");
    childrenListIsLoading.value = true;
    final childDataList = await parentRepo.getMyChildren();
    if(childDataList.isNotEmpty){
      children.clear();
      children.addAll(childDataList.map((child) => GetMyChildrenModel.fromJson(child)));
    }
    // else{
    //   AppSnackBar.showError('No child data found!');
    // }
    childrenListIsLoading.value = false;
  }

}