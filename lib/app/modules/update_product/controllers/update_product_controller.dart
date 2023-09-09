import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNpm;
  late TextEditingController cAlamat;
  late TextEditingController cJk;
  late TextEditingController cProgramstudi;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("mahasiswa").doc(id);

    return docRef.get();
  }

  void updateProduct(String nama, String npm, String alamat, String jk, String programstudi, String id) async {
    DocumentReference productById = firestore.collection("mahasiswa").doc(id);
    try {
      await productById.update({
        "nama": nama,
        "npm": npm,
        "alamat" : alamat,
        "jk" : jk,
        "program_studi" : programstudi,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data product.",
        onConfirm: () {
          cNama.clear();
          cNpm.clear();
          cAlamat.clear();
          cJk.clear();
          cProgramstudi.clear();
          Get.back();
          Get.back();
          Get.back();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );

    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Product.",
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNama = TextEditingController();
    cNpm = TextEditingController();
    cAlamat = TextEditingController();
    cJk = TextEditingController();
    cProgramstudi = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNama.dispose();
    cNpm.dispose();
    cAlamat.dispose();
    cJk.dispose();
    cProgramstudi.dispose();
    super.onClose();
  }
}
