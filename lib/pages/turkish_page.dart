import 'package:flutter/material.dart';

class TurkishPage extends StatefulWidget {
  const TurkishPage({super.key});

  @override
  State<TurkishPage> createState() => _TurkishPageState();
}

class _TurkishPageState extends State<TurkishPage> {
  //load data
  //store found items
  List<Map<String,dynamic>> _foundItem = [];
  
  @override
  void initState() {
    super.initState();
    _foundItem = termsData;
  }

  //function to search
  void _searchFilter(String enteredKeyword){
    List<Map<String,dynamic>> results = [];
    if (enteredKeyword.isEmpty){
      results = termsData;
    }else {
      results = termsData.where((item) => 
              item["term"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundItem = results;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(title: const Text("Turkish Page"),),
      body: 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [TextField(
            style: const TextStyle(color: Colors.black),
            onChanged: (value) => _searchFilter(value),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 12, 141, 221),
              contentPadding: const EdgeInsets.all(15),
              labelText: "Search Term",
              suffixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1),
                borderSide: BorderSide.none)),
          ),
        
          Expanded(child: 
          ListView.builder(
            itemCount: _foundItem.length,
            itemBuilder: (context, index) => Card(
              key: ValueKey(_foundItem[index]['term']),
              color: Colors.cyanAccent,
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ExpansionTile(
                title: Text(
                  _foundItem[index]["term"].toString(),
                  style: const TextStyle(
                    color: Colors.red),
                ),
                subtitle: Text(
                  _foundItem[index]["english"].toString(),
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ), 
              ),
            )))
          ],
        ),
      ),
    );
  }
}

final List<Map<String,dynamic>> termsData = [
    {"term": "terk etmek, vazgeçmek", "english": "abandon"},
    {"term": "kısaltmak, sadeleştirmek", "english": "abbreviate"},
    {"term": "yıkmak, sona erdirmek", "english": "abolish"},
    {"term": "emmek, içine çekmek", "english": "absorb"},
    {"term": "---den sakınmak, uzak durmak", "english": "abstain from"},
    {"term": "bolluk, bereket", "english": "abundance"},
    {"term": "bol, bereketli", "english": "abundant"},
    {"term": "hızlandırmak", "english": "accelerate"},
    {"term": "kabul etmek, razı olmak", "english": "accept"},
    {"term": "erişmek, ulaşmak", "english": "access"},
    {"term": "ulaşılabilir", "english": "accessible to"},
    {"term": "ağırlamak", "english": "accommodate"},
    {"term": "eşlik etmek, arkadaşlık etmek", "english": "accompany"},
    {"term": "başarmak", "english": "accomplish"},
    {"term": "birikmek, biriktirmek", "english": "accumulate"},
    {"term": "doğruluk, kesinlik", "english": "accuracy"},
    {"term": "doğru, hatasız", "english": "accurate"},
    {"term": "doğru bir şekilde", "english": "accurately"},
    {"term": "suçlamak", "english": "accuse (of)"},
    {"term": "başarmak, yerine getirmek", "english": "achieve"},
    {"term": "--- olarak tanımak, kabul etmek", "english": "acknowledge as"},
    {"term": "aşina olmak", "english": "acquainted with"},
    {"term": "edinmek, kazanmak", "english": "acquire"},
    {"term": "edinim", "english": "acquisition"},
    {"term": "faaliyet, aktivite", "english": "activity"},
    {"term": "uyarlamak, uydurmak", "english": "adapt"},
    {"term": "bağımlı, tiryaki", "english": "addict"},
    {"term": "bağımlılık", "english": "addiction to"},
    {"term": "ilave, ek", "english": "addition"},
    {"term": "bunun yanı sıra", "english": "additionally"}
];