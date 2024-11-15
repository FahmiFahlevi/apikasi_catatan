import 'package:aplikasi_catatan/catatan_model.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<CatatanModel> _catatan = CatatanModel.dummyData;

  void refreshList() {
    setState(() {
      _catatan = _catatan;
    });
  }

  void updateItem(int index, bool done) {
    setState(() {
      _catatan[index].done = done;
    });
  }

  void deleteItem(int index) {
    _catatan.removeAt(index);
    refreshList();
  }

  void tampilForm(BuildContext context) {
    var alert = AlertDialog(
      insetPadding: const EdgeInsets.all(20),
      title: const Center(
        child: Text("Tambah Catatan"),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {},
          child: const Text("Tutup"),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Tambah"),
        ),
      ],
      content: Column(
        children: [
          TextField(),
          TextField(),
        ],
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            tampilForm(context);
          },
          child: const Icon(Icons.add_box),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Aplikasi Catatan",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: "Cari Catatan",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: ListView.builder(
                  itemCount: _catatan.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 5),
                      child: Row(
                        children: [
                          _catatan[index].done
                              ? IconButton(
                                  onPressed: () {
                                    updateItem(index, !_catatan[index].done);
                                  },
                                  icon: const Icon(Icons.check_circle),
                                )
                              : IconButton(
                                  onPressed: () {
                                    updateItem(index, !_catatan[index].done);
                                  },
                                  icon:
                                      const Icon(Icons.radio_button_unchecked),
                                ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_catatan[index].nama),
                                Text(_catatan[index].deskripsi),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              deleteItem(index);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              // MaterialButton(
              //   onPressed: () {},
              //   color: Colors.deepOrange,
              //   child: const Text(
              //     "Hapus Yang Selesai",
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 18,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
