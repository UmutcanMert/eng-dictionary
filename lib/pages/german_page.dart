import 'package:flutter/material.dart';

class GermanPage extends StatefulWidget {
  const GermanPage({super.key});

  @override
  State<GermanPage> createState() => _GermanPageState();
}

class _GermanPageState extends State<GermanPage> {
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
      appBar : AppBar(title: const Text("German Page"),),
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
      )
    );
  }
}

final List<Map<String,dynamic>> termsData = [
    {"term": "der / die / das", "english": "the; (dem. pron.) that, those; (rel. pron) who, that"},
    {"term": "und", "english": "and"},
    {"term": "sein", "english": "to be; (aux./perfect tense)"},
    {"term": "in", "english": "in (variation: im in the)"},
    {"term": "ein", "english": "a, an; (pron.) one (of)"},
    {"term": "zu", "english": "to, at; (adv.) too"},
    {"term": "haben", "english": "to have; (aux./perfect tense)"},
    {"term": "ich", "english": "I"},
    {"term": "werden", "english": "to become; (aux./future tense); (aux./passive voice)"},
    {"term": "sie", "english": "she, her (acc. form of sie [sing.]); they, them (acc. form of sie [pl.]); Sie (pers. pron.) you (formal)"},
    {"term": "von", "english": "from, of"},
    {"term": "nicht", "english": "not"},
    {"term": "mit", "english": "with"},
    {"term": "es", "english": "it"},
    {"term": "sich", "english": "-self"},
    {"term": "auch", "english": "also, too"},
    {"term": "auf", "english": "on, at, in"},
    {"term": "für", "english": "for"},
    {"term": "an", "english": "at, on (variation: am at/on the)"},
    {"term": "er", "english": "he"},
    {"term": "so", "english": "so; thus, this way, such"},
    {"term": "dass", "english": "that"},
    {"term": "können", "english": "can, to be able"},
    {"term": "dies-", "english": "this, that"},
    {"term": "als", "english": "as, when; (adv.) than"},
    {"term": "ihr", "english": "you (pl., familiar), her (dat. form of sie [sing.]); (poss. adj.) her, their, hers, theirs (poss. form of sie [sing.], sie [pl.]); Ihr (poss. adj.) your (formal, poss. form of Sie)"},
    {"term": "ja", "english": "yes; certainly, really"},
    {"term": "wie", "english": "how; as"},
    {"term": "bei", "english": "by, with, at"},
    {"term": "oder", "english": "or"},
    {"term": "wir", "english": "we"},
    {"term": "aber", "english": "but; (adv./flavoring particle)"},
    {"term": "dann", "english": "then"},
    {"term": "man", "english": "one, you"},
    {"term": "da", "english": "there; (conj.) because"},
    {"term": "sein", "english": "his, its (poss. form of er, es)"},
    {"term": "noch", "english": "still, yet"},
    {"term": "nach", "english": "after, toward"},
    {"term": "was", "english": "what"},
    {"term": "also", "english": "so, therefore"},
    {"term": "aus", "english": "out, out of, from"},
    {"term": "all", "english": "all"},
    {"term": "wenn", "english": "if, when"},
    {"term": "nur", "english": "only"},
    {"term": "müssen", "english": "to have to, must"},
    {"term": "sagen", "english": "to say"},
    {"term": "um", "english": "around, at [variation: um … zu in order to]"},
    {"term": "über", "english": "above, over, about"},
    {"term": "machen", "english": "to do, make"},
    {"term": "kein", "english": "no, not a/an"},
    {"term": "Jahr das, -e", "english": "year"},
    {"term": "du", "english": "you (familiar, sing.)"},
    {"term": "mein", "english": "my (poss. form of ich)"},
    {"term": "schon", "english": "already; (adv./flavoring particle)"},
    {"term": "vor", "english": "in front of, before, ago"},
    {"term": "durch", "english": "through"},
    {"term": "geben", "english": "to give"},
    {"term": "mehr", "english": "more"},
    {"term": "andere, anderer, anderes", "english": "other"},
    {"term": "viel", "english": "much, a lot, many"},
    {"term": "kommen", "english": "to come"},
    {"term": "jetzt", "english": "now"},
    {"term": "sollen", "english": "should, ought to"},
    {"term": "mir", "english": "[to/for] me (dat. form of ich)"},
    {"term": "wollen", "english": "to want"},
    {"term": "ganz", "english": "whole, all the; (adv.) quite"},
    {"term": "mich", "english": "me (acc. form of ich)"},
    {"term": "immer", "english": "always"},
    {"term": "gehen", "english": "to go"},
    {"term": "sehr", "english": "very"},
    {"term": "hier", "english": "here"},
    {"term": "doch", "english": "however, still; (adv./flavoring particle)"},
    {"term": "bis", "english": "until"},
    {"term": "groß", "english": "big, large, great"},
    {"term": "wieder", "english": "again"},
    {"term": "Mal das, -e", "english": "time; mal (conj.) times [math]; (part.) time(s); once; just"},
    {"term": "zwei", "english": "two"},
    {"term": "gut", "english": "good"},
    {"term": "wissen", "english": "to know"},
    {"term": "neu", "english": "new"},
    {"term": "sehen", "english": "to see"},
    {"term": "lassen", "english": "to let, allow, have (something) done"},
    {"term": "uns", "english": "us (acc., dat. form of wir)"},
    {"term": "weil", "english": "because"},
    {"term": "unter", "english": "under"},
    {"term": "denn", "english": "because; (part.) (used in questions to tone down bluntness)"},
    {"term": "stehen", "english": "to stand"},
    {"term": "jed-", "english": "every, each"},
    {"term": "Beispiel, das, -e", "english": "example"},
    {"term": "Zeit, die", "english": "time"},
    {"term": "erste, erster, erstes", "english": "first"},
    {"term": "ihm", "english": "him, it (dat. form of er, es)"},
    {"term": "ihn", "english": "him (acc. form of er)"},
    {"term": "wo", "english": "where"},
    {"term": "lang", "english": "long; lange (adv.) for a long time"},
    {"term": "eigentlich", "english": "actually; (adj.) actual, real"},
    {"term": "damit", "english": "with it; (conj.) so that"},
    {"term": "selbst, selber", "english": "-self; (adv.) even"},
    {"term": "unser", "english": "our (poss. of wir)"},
    {"term": "oben", "english": "above, up there"}
  ];