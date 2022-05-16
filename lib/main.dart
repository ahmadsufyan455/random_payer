import 'package:doa/doa.dart';
import 'package:doa/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoaPage(),
    );
  }
}

class DoaPage extends StatefulWidget {
  const DoaPage({Key? key}) : super(key: key);

  @override
  State<DoaPage> createState() => _DoaPageState();
}

class _DoaPageState extends State<DoaPage> {
  Doa doa = Doa();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kumpulan doa sehari-hari')),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: doa.id != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          doa.doa!,
                          style: GoogleFonts.nunito(fontSize: 18.0),
                        ),
                        const SizedBox(height: 16.0),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 2.0),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            doa.ayat!,
                            style: GoogleFonts.notoSansArabic(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          doa.latin!,
                          style: GoogleFonts.nunito(
                            fontSize: 16.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          doa.artinya!,
                          style: GoogleFonts.nunito(fontSize: 16.0),
                        ),
                        const SizedBox(height: 34.0),
                      ],
                    )
                  : Text(
                      'Klik acak untuk memunculkan doa',
                      style: GoogleFonts.nunito(fontSize: 18.0),
                    ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shuffle),
        onPressed: () async {
          Doa? result = await Services.getRandomDoa();
          setState(() {
            if (result != null) {
              doa = result;
            }
          });
        },
      ),
    );
  }
}
