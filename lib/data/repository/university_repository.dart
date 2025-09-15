// lib/data/repositories/university_repository.dart


import 'package:bloc_statemanagement/data/model/university_model.dart';
import 'package:bloc_statemanagement/data/web_servies/web_servies.dart';

class UniversityRepository {
  final UniversityWebServices webServices;

  // لازم نستقبل نسخة من UniversityWebServices
  UniversityRepository(this.webServices);

  // الدالة دي بتجيب الجامعات لدولة معينة
  Future<List<University>> fetchUniversitiesByCountry(String country) async {
    // استدعاء الـ API
    final rawData = await webServices.getUniversitiesByCountry(country);

    // تحويل البيانات من JSON -> University Model
    return rawData
        .map((e) => University.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
