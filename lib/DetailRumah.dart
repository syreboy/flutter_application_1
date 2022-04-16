import 'package:flutter/material.dart';
import 'package:rumah/DataRumahModel.dart';

class RumahDetail extends StatelessWidget {
  final DataRumahModel dataRumahModel;

  const RumahDetail({Key? key, required this.dataRumahModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                dataRumahModel.nama,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            backgroundColor: Color(0xff9980FA),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: lebar,
                  height: tinggi * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: NetworkImage(dataRumahModel.gambar),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: tinggi * 0.03,
                ),
                Text(
                  dataRumahModel.nama,
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: tinggi * 0.03,
                ),
                Container(
                  width: lebar * 0.9,
                  child: Text(
                    dataRumahModel.deskripsi,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
