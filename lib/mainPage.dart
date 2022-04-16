import 'package:flutter/material.dart';
import 'package:rumah/DataRumahModel.dart';
import 'package:rumah/DetailRumah.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPage();
}

class _mainPage extends State<mainPage> {
  int idRumah = 0;

  static List<String> namaRumah = [
    'Rumah Aceh',
    'Rumah Gadang',
    'Rumah Panggung',
    'Rumah Kebaya',
    'Rumah Joglo',
    'Rumah Panjang',
    'Rumah Baileo'
  ];

  static List gambar = [
    'image/aceh.jpg',
    'image/gadang.jpg',
    'image/panggung.jpg',
    'image/kebaya.jpg',
    'image/joglo.jpg',
    'image/panjang.jpg',
    'image/baileo.jpg'
  ];

  static List<String> deskripsi = [
    'Rumah adat Aceh berbentuk persegi panjang dan memanjang dari timur ke barat. Rumah ini memiliki tangga di depan rumah yang berfungsi untuk masuk ke bagian dalam. Tinggi tangga tersebut sekitar 2,5–3 m dari permukaan tanah. Pada umumnya, anak tangga rumah krong bade berjumlah ganjil sekitar 7-9 anak tangga.',
    'Rumah Gadang disebut juga rumah adat bagonjong atau Rumah Baanjuang. Hal ini lantaran bagian atapnya berbentuk runcing menjulang (bergonjong). Terbuat dari ijuk serta memiliki bentuk menyerupai tanduk kerbau, melambangkan kemenangan suku Minang dalam perlombaan adu kerbau di Pulau Jawa.',
    'Secara garis besar, Provinsi Jambi memiliki 3 jenis rumah adat yaitu Rumah Adat Kajang Leko, Rumah Batu Pangeran Wirokusumo, dan Rumah Adat Merangin. Rumah Adat Kajang Leko merupakan jenis Rumah Adat Jambi yang paling populer di antara yang lainnya. Rumah adat ini menjadi ikon budaya Jambi seiring dengan diresmikannya replika Rumah Adat Kajang Leko di Taman Mini Indonesia Indah pada tahun 1970.',
    'Disebut sebagai rumah kebaya karena bentuk atapnya yang menyerupai pelana. Jika dilipat dan dilihat dari samping, lipatan-lipatan tersebut terlihat seperti lipatan kebaya. Ciri khas dari rumah ini adalah teras luas yang berguna untuk menjamu tamu dan menjadi tempat bersantai keluarga. Bagian depan rumah bersifat semi publik, sementara bagian belakang bersifat pribadi.',
    'Di Jawa Tengah sebenarnya terdapat 4 jenis rumah adat, yaitu Panggangpe, bentuk Kampung, Limasan, dan Joglo. Joglo adalah bangunan rumah tradisional yang paling dikenal luas, kemudian disusul oleh Limasan. Rumah Joglo adalah bangunan berbentuk persegi dengan 4 tiang pokok di bagian tengah yang dinamakan Saka Guru dan terbuat dari kayu. Untuk menopang tiang menggunakan blandar bersusun yang dinamakan Tumpang Sari.',
    'Rumah panjang dari Kalimantan Barat mempunyai tinggi 5 sampai 8 meter dan panjang sekitar 180 meter serta lebar 6 meter. Rumah panjang memiliki sekita 50 ruangan yang dihuni oleh banyak keluarga, termasuk keluarga inti.',
    'Rumah adat ini tidak dilengkapi dengan dinding dan berbentuk rumah panggung. Terdapat 9 tiang penyangga dalam rumah ini yang juga dilengkapi dengan batu pamali. Apa itu batu pamali? Itu merupakan batu yang digunakan sebagai tempat sesaji untuk para roh leluhur.'
  ];

  final List<DataRumahModel> DataRumah = List.generate(
      namaRumah.length,
      (index) => DataRumahModel(
          '${namaRumah[index]}', '${gambar[index]}', '${deskripsi[index]}'));

  @override
  void initState() {
    super.initState();
    idRumah = 0;
  }

  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;

    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(
                  "Katalog Rumah Adat",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              backgroundColor: Color(0xff9980FA),
            ),
            body: (isLandscape)
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: lebar * 0.5,
                          child: ListView.builder(
                            itemCount: DataRumah.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  title: Text(DataRumah[index].nama),
                                  leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          DataRumah[index].gambar)),
                                  onTap: () => setState(() => idRumah = index),
                                ),
                              );
                            },
                          )),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: tinggi * 0.4,
                              width: lebar * 0.5,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(gambar[idRumah]),
                                      fit: BoxFit.cover)),
                            ),
                            Text(
                              namaRumah[idRumah],
                              style: TextStyle(fontSize: 20),
                            ),
                            Container(
                              width: lebar * 0.5,
                              child: Text(
                                deskripsi[idRumah],
                                textAlign: TextAlign.justify,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                : ListView.builder(
                    itemCount: DataRumah.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                            title: Text(DataRumah[index].nama),
                            leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(DataRumah[index].gambar)),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => RumahDetail(
                                      dataRumahModel: DataRumah[index]))));
                            }),
                      );
                    },
                  )));
  }
}
