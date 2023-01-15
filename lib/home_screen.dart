import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:jobs_noti/model/data_model.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  final formKey = GlobalKey<FormState>();
  final DataModel _dataModel = DataModel('', '', '', '', '', '');
  final _firbase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          toolbarHeight: 75,
          centerTitle: true,
          title: const Text(
            'หน้าจอการนัดหมาย',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 0, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                      Expanded(child: Text('รหัสวิชา')),
                      Expanded(child: Text('เลือกรายวิชา')),
                      Expanded(child: Text('เลือกอาจารย์ผู้สอน')),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: TextFormField(
                      onChanged: (subjectId) {
                        _dataModel.subjectId = subjectId;
                      },
                      validator:
                          RequiredValidator(errorText: "กรุณาป้อนข้อมูล"),
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )),
                    Expanded(
                        child: TextFormField(
                      onChanged: (subjectName) {
                        _dataModel.subjectName = subjectName;
                      },
                      validator:
                          RequiredValidator(errorText: "กรุณาป้อนข้อมูล"),
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )),
                    Expanded(
                        child: TextFormField(
                      onChanged: (teacherName) {
                        _dataModel.teacherName = teacherName;
                      },
                      validator:
                          RequiredValidator(errorText: "กรุณาป้อนข้อมูล"),
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )),
                  ],
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 0, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                      Expanded(child: Text('เวลา')),
                      Expanded(child: Text('วันเดือนปี')),
                      Expanded(child: Text('รายละเอียด')),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: TextFormField(
                      onChanged: (time) {
                        _dataModel.time = time;
                      },
                      validator:
                          RequiredValidator(errorText: "กรุณาป้อนข้อมูล"),
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )),
                    Expanded(
                        child: TextFormField(
                      onChanged: (date) {
                        _dataModel.date = date;
                      },
                      validator:
                          RequiredValidator(errorText: "กรุณาป้อนข้อมูล"),
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )),
                    Expanded(
                        child: TextFormField(
                      onChanged: (detailData) {
                        _dataModel.detailData = detailData;
                      },
                      validator:
                          RequiredValidator(errorText: "กรุณาป้อนข้อมูล"),
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        height: 45,
                        width: 100,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                print('object :${_dataModel.subjectName}');
                                await _firbase
                                    .collection('DataJobsDetail')
                                    .doc()
                                    .set({
                                  'subjectId': _dataModel.subjectId,
                                  'subjectName': _dataModel.subjectName,
                                  'teacherName': _dataModel.teacherName,
                                  'date': _dataModel.date,
                                  'time': _dataModel.time,
                                  'detailData': _dataModel.detailData,
                                });
                              }
                            },
                            child: const Text('ยืนยัน'))),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        height: 45,
                        width: 100,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {},
                            child: const Text('ยกเลิก')))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
