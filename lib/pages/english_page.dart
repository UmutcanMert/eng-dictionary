import 'package:flutter/material.dart';

class EnglishPage extends StatefulWidget {
  const EnglishPage({super.key});

  @override
  State<EnglishPage> createState() => _EnglishPageState();
}

class _EnglishPageState extends State<EnglishPage> {
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
      appBar : AppBar(title: const Text("English Page"),),
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
                  _foundItem[index]["turkish"].toString(),
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ), 
                children: [
                  ListTile(
                    title: Text(
                      _foundItem[index]["example"].toString(),
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            )))
          ],
        ),
      ),
    );
  }
}

final List<Map<String,dynamic>> termsData = [
  {"term": "abandon", "turkish": "terk etmek, vazgeçmek", "example": "She decided to abandon the project due to lack of funding."},
  {"term": "abbreviate", "turkish": "kısaltmak, sadeleştirmek", "example": "The word 'example' is often abbreviated to 'ex.'"},
  {"term": "abolish", "turkish": "yıkmak, sona erdirmek", "example": "The law was abolished after many protests."},
  {"term": "absorb", "turkish": "emmek, içine çekmek", "example": "The sponge can absorb a lot of water."},
  {"term": "abstain from", "turkish": "sakınmak, uzak durmak", "example": "He decided to abstain from drinking alcohol for a month."},
  {"term": "abundance", "turkish": "bolluk, bereket", "example": "The region is known for its abundance of natural resources."},
  {"term": "abundant", "turkish": "bol, bereketli", "example": "The harvest this year was abundant."},
  {"term": "accelerate", "turkish": "hızlandırmak", "example": "The car began to accelerate as it reached the open road."},
  {"term": "accept", "turkish": "kabul etmek", "example": "She accepted the invitation to the party."},
  {"term": "access", "turkish": "erişmek, ulaşmak", "example": "You need a password to access the secure files."},
  {"term": "accessible to", "turkish": "erişilebilir", "example": "The museum is accessible to visitors with disabilities."},
  {"term": "accommodate", "turkish": "ağırlamak", "example": "The hotel can accommodate 200 guests."},
  {"term": "accompany", "turkish": "eşlik etmek", "example": "She will accompany me to the meeting tomorrow."},
  {"term": "accomplish", "turkish": "başarmak", "example": "They worked hard and accomplished their goals."},
  {"term": "accumulate", "turkish": "biriktirmek, yığmak", "example": "He managed to accumulate a large collection of books."},
  {"term": "accuracy", "turkish": "doğruluk, kesinlik", "example": "The accuracy of the measurements was crucial for the experiment."},
  {"term": "accurate", "turkish": "doğru, hatasız", "example": "The information provided was accurate and reliable."},
  {"term": "accurately", "turkish": "doğru şekilde", "example": "She calculated the figures accurately."},
  {"term": "accuse", "turkish": "suçlamak", "example": "The police accused him of committing the crime."},
  {"term": "achieve", "turkish": "başarmak", "example": "He achieved great success in his career."},
  {"term": "acknowledge as", "turkish": "kabul etmek", "example": "He was acknowledged as a leading expert in the field."},
  {"term": "acquainted with", "turkish": "aşina olmak", "example": "I am acquainted with her work, but we've never met personally."},
  {"term": "acquire", "turkish": "edinmek, kazanmak", "example": "She acquired a new skill after completing the course."},
  {"term": "acquisition", "turkish": "edinim", "example": "The company's acquisition of new technologies has improved efficiency."},
  {"term": "activity", "turkish": "aktivite", "example": "Outdoor activities are popular during the summer months."},
  {"term": "adapt", "turkish": "uyarlamak, uydurmak", "example": "They had to adapt the software to meet local needs."},
  {"term": "addict", "turkish": "bağımlı, tiryaki", "example": "He was a cigarette addict for many years."},
  {"term": "addiction to", "turkish": "bağımlılık", "example": "Her addiction to social media affected her productivity."},
  {"term": "addition", "turkish": "ilave, ek", "example": "In addition to the book, she also bought a notebook."},
  {"term": "additionally", "turkish": "ayrıca", "example": "Additionally, the project will require a budget increase."},
  {"term": "adequately", "turkish": "yeterli şekilde", "example": "The team performed adequately during the match."},
  {"term": "adjust", "turkish": "uyarlamak, alışmak", "example": "You need to adjust the settings before using the machine."},
  {"term": "adjustment", "turkish": "düzeltme, uyum", "example": "The adjustment in the policy improved the situation."},
  {"term": "administer", "turkish": "yönetmek, sağlamak", "example": "He was appointed to administer the new healthcare program."},
  {"term": "admire", "turkish": "hayran olmak", "example": "I admire her dedication to the cause."},
  {"term": "admit", "turkish": "kabullenmek, itiraf etmek", "example": "He admitted to making a mistake during the interview."},
  {"term": "adopt", "turkish": "evlat edinmek, benimsemek", "example": "They decided to adopt a child from an orphanage."},
  {"term": "adore", "turkish": "çok sevmek", "example": "She adores her pet cat and takes care of it every day."},
  {"term": "adverse", "turkish": "zıt, kötü", "example": "The adverse weather conditions delayed the flight."},
  {"term": "advocate", "turkish": "savunmak, desteklemek", "example": "She advocates for the rights of children in her community."},
  {"term": "affect", "turkish": "etkilemek", "example": "The new policy will affect all employees."},
  {"term": "aggravate", "turkish": "kötüleştirmek", "example": "His actions only aggravated the situation."},
  {"term": "aggressive", "turkish": "saldırgan", "example": "The dog became aggressive when it was provoked."},
  {"term": "aid", "turkish": "yardım etmek", "example": "They provided aid to the earthquake victims."},
  {"term": "alien to", "turkish": "yabancı", "example": "His behavior was alien to our cultural norms."},
  {"term": "alongside", "turkish": "yanında", "example": "She worked alongside her colleagues to complete the project."},
  {"term": "alter", "turkish": "değiştirmek", "example": "They decided to alter the design of the product."},
  {"term": "alteration", "turkish": "değişiklik", "example": "An alteration in the schedule caused confusion."},
  {"term": "amazing", "turkish": "şaşırtıcı", "example": "The view from the top of the mountain was absolutely amazing."},
  {"term": "amend", "turkish": "düzeltmek, değiştirmek", "example": "The law was amended to include new provisions."},
  {"term": "amendment", "turkish": "değişiklik", "example": "The amendment to the constitution was passed last week."},
  {"term": "amusing", "turkish": "eğlenceli", "example": "The comedian's performance was truly amusing."},
  {"term": "announce", "turkish": "ilan etmek", "example": "The company announced a new product launch."},
  {"term": "anticipate", "turkish": "beklemek, ummak", "example": "We anticipate a rise in sales during the holiday season."},
  {"term": "apologize", "turkish": "özür dilemek", "example": "I apologize for the misunderstanding earlier."},
  {"term": "appalling", "turkish": "korkunç", "example": "The conditions in the refugee camp were appalling."},
  {"term": "appointment", "turkish": "atama, randevu", "example": "He had an appointment with the doctor this afternoon."},
  {"term": "appreciate", "turkish": "takdir etmek", "example": "I really appreciate your help with the project."},
  {"term": "approach", "turkish": "yaklaşmak", "example": "They approached the problem from a different angle."},
  {"term": "appropriately", "turkish": "uygun şekilde", "example": "The manager responded appropriately to the customer's complaint."},
  {"term": "approve of", "turkish": "onaylamak", "example": "The committee approved of the new budget proposal."},
  {"term": "arrange", "turkish": "düzenlemek", "example": "She arranged the books on the shelf in alphabetical order."},
  {"term": "artefact", "turkish": "sanat eseri", "example": "The museum displayed a rare ancient artefact."},
  {"term": "ascend", "turkish": "yükselmek", "example": "He watched the balloon slowly ascend into the sky."},
  {"term": "ask for", "turkish": "istemek", "example": "I need to ask for permission before making any changes."},
  {"term": "aspire", "turkish": "arzu etmek", "example": "She aspires to become a successful entrepreneur."},
  {"term": "assemble", "turkish": "toplamak, monte etmek", "example": "The workers assembled the parts of the car in the factory."},
  {"term": "assess", "turkish": "değerlendirmek", "example": "We need to assess the situation before making any decisions."},
  {"term": "assign", "turkish": "atamak", "example": "The teacher assigned homework to the class."},
  {"term": "assist somebody in something", "turkish": "yardım etmek", "example": "He assisted me in preparing the report."},
  {"term": "associate", "turkish": "çağrıştırmak, arkadaşlık etmek", "example": "I associate his name with innovation and creativity."},
  {"term": "assume", "turkish": "farz etmek, üstlenmek", "example": "I assume you are familiar with the process."},
  {"term": "assure", "turkish": "garanti vermek", "example": "She assured me that everything would be ready on time."},
  {"term": "astonishment", "turkish": "şaşkınlık", "example": "His sudden arrival filled everyone with astonishment."},
  {"term": "attach", "turkish": "eklemek", "example": "Please attach the document to your email."},
  {"term": "attack", "turkish": "saldırmak", "example": "The army launched a surprise attack on the enemy's camp."},
  {"term": "attain", "turkish": "ulaşmak, elde etmek", "example": "She worked hard to attain her professional goals."},
  {"term": "attainment", "turkish": "erişim, kazanım", "example": "The attainment of independence was a significant milestone."},
  {"term": "attend", "turkish": "katılmak", "example": "He was unable to attend the meeting due to a prior commitment."},
  {"term": "attribute", "turkish": "dayandırmak", "example": "The team's success can be attributed to their hard work."},
  {"term": "auditorium", "turkish": "izleme salonu", "example": "The concert was held in a large auditorium."},
  {"term": "available", "turkish": "mevcut", "example": "The product is available in stores starting next week."},
  {"term": "avert", "turkish": "önlemek", "example": "Quick action helped avert a major disaster."},
  {"term": "avoidable", "turkish": "kaçınılabilir", "example": "The accident was avoidable with more caution."},
  {"term": "award", "turkish": "ödül", "example": "She won an award for her outstanding contribution to the community."},
  {"term": "backward", "turkish": "geri kalmış", "example": "The village was backward in terms of modern amenities."},
  {"term": "badly in need of", "turkish": "çok muhtaç olmak", "example": "The region is badly in need of medical supplies."},
  {"term": "barely", "turkish": "güçlükle", "example": "She barely finished the project before the deadline."},
  {"term": "bargain", "turkish": "pazarlık", "example": "He got a good bargain on the new laptop."},
  {"term": "barren", "turkish": "kurak, verimsiz", "example": "The desert landscape is barren and lacks vegetation."},
  {"term": "basic", "turkish": "temel", "example": "They provided basic training for new employees."},
  {"term": "bazaar", "turkish": "pazar", "example": "The bazaar was filled with colorful goods and lively music."},
  {"term": "behave", "turkish": "davranmak", "example": "Children should be taught how to behave properly in public."},
  {"term": "believe", "turkish": "inanmak", "example": "I believe that hard work leads to success."},
  {"term": "belongings", "turkish": "eşyalar", "example": "She packed her belongings into a suitcase."},
  {"term": "beloved", "turkish": "sevgili", "example": "She said goodbye to her beloved dog before leaving for college."},
  {"term": "bitingly satirical", "turkish": "aşırı alaycı", "example": "His bitingly satirical comments often offended people."},
  {"term": "bizarre", "turkish": "tuhaf", "example": "The story took a bizarre turn in the final chapter."},
  {"term": "blanket", "turkish": "battaniye", "example": "She wrapped herself in a warm blanket to stay cozy."},
  {"term": "blaze", "turkish": "alev, parlamak", "example": "The campfire blazed brightly in the dark night."}
];
