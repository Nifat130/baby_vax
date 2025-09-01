

import 'package:get/get.dart';

class ChildDetailsScreenController extends GetxController{
  var isLoading = false.obs;

  var toShow = [].obs;
  var takenVaccines = [].obs;

  final List<Map<String, dynamic>> vaccineList = [
    {
      "time": "At Birth",
      "vaccineNames": [
        {"name": "BCG", "taken": false},
        {"name": "OPV-0", "taken": false},
        {"name": "HepB-0", "taken": false},
      ]
    },
    {
      "time": "6 Weeks",
      "vaccineNames": [
        {"name": "OPV-1", "taken": false},
        {"name": "Pentavalent-1", "taken": false},
        {"name": "PCV-1", "taken": false},
        {"name": "Rota-1", "taken": false},
      ]
    },
    {
      "time": "10 Weeks",
      "vaccineNames": [
        {"name": "OPV-2", "taken": false},
        {"name": "Pentavalent-2", "taken": false},
        {"name": "PCV-2", "taken": false},
        {"name": "Rota-2", "taken": false},
      ]
    },
    {
      "time": "14 Weeks",
      "vaccineNames": [
        {"name": "OPV-3", "taken": false},
        {"name": "IPV", "taken": false},
        {"name": "Pentavalent-3", "taken": false},
        {"name": "PCV-3", "taken": false},
        {"name": "Rota-3", "taken": false}, // if 3-dose schedule used
      ]
    },
    {
      "time": "9 Months",
      "vaccineNames": [
        {"name": "MR-1", "taken": false}, // Measles-Rubella 1st dose
      ]
    },
    {
      "time": "15 Months",
      "vaccineNames": [
        {"name": "MR-2", "taken": false}, // Measles-Rubella 2nd dose
        {"name": "DPT Booster-1", "taken": false},
        {"name": "IPV Booster", "taken": false},
      ]
    },
    {
      "time": "18 Months",
      "vaccineNames": [
        {"name": "DPT Booster-2", "taken": false},
        {"name": "Typhoid Vaccine", "taken": false}, // if included in program
      ]
    },
    {
      "time": "4–5 Years",
      "vaccineNames": [
        {"name": "DPT Booster-2", "taken": false}, // 2nd booster if not already
      ]
    },
  ];


}