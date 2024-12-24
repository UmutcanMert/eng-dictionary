import 'package:flutter/material.dart';

void main(){
  runApp(const InitialHomePage());
}
class InitialHomePage extends StatelessWidget {
  const InitialHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: CardFlipPage(),
    );
  }
}

class CardFlipPage extends StatefulWidget {
  const CardFlipPage({super.key});

  @override
  State<CardFlipPage> createState() => _CardFlipPageState();
}

class _CardFlipPageState extends State<CardFlipPage> {
  int _currentIndex = 0; // Geçerli kartın indexi
  bool _isFront = true; // Kartın ön yüzü mü arka yüzü mü olduğunu kontrol eder

  void _nextCard() {
    setState(() {
      // Bir sonraki karta git
      if (_currentIndex < termsData.length - 1) {
        _currentIndex++;
      }
    });
  }

  void _previousCard() {
    setState(() {
      // Bir önceki karta git
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final term = termsData[_currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text("Card Flip")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isFront = !_isFront; // Kartın yüzünü değiştir
                });
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  width: 300,
                  height: 400,
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(seconds: 0),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return RotationYTransition(
                          turns: animation,
                          child: child,
                        );
                      },
                      child: _isFront
                          ? Column(
                              key: const ValueKey('front'),
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  term["term"],
                                  style: const TextStyle(fontSize: 40),
                                ),
                                const SizedBox(height: 20),
                                
                              ],
                            )
                          : Column(
                              key: const ValueKey('back'),
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  term["turkish"],
                                  style: const TextStyle(fontSize: 30),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  term["example"],
                                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _previousCard,
                  icon: const Icon(Icons.arrow_back),
                  tooltip: "Previous",
                ),
                Text(
                  "Card ${_currentIndex + 1} of ${termsData.length}",
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: _nextCard,
                  icon: const Icon(Icons.arrow_forward),
                  tooltip: "Next",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// RotationYTransition widget'ı kartın dönme animasyonunu sağlar
class RotationYTransition extends AnimatedWidget {
  final Widget child;
  final Animation<double> turns;

  const RotationYTransition({super.key, required this.turns, required this.child}) : super(listenable: turns);

  @override
  Widget build(BuildContext context) {
    final turnsValue = turns.value;
    return Transform(
      transform: Matrix4.rotationY(turnsValue),
      alignment: Alignment.center,
      child: child,
    );
  }
}



final List<Map<String,dynamic>> termsData = [
    {"term": "abandon", "turkish": "terk etmek, vazgeçmek", "example": "She decided to abandon the project due to lack of funding."},
    {"term": "abbreviate", "turkish": "kısaltmak, sadeleştirmek", "example": "The word 'doctor' is often abbreviated to 'Dr.'."},
    {"term": "abolish", "turkish": "yıkmak, sona erdirmek", "example": "The government plans to abolish outdated laws."},
    {"term": "absorb", "turkish": "emmek, içine çekmek", "example": "This sponge can absorb a lot of water."},
    {"term": "abstain from", "turkish": "sakınmak, uzak durmak", "example": "He decided to abstain from smoking for his health."},
    {"term": "abundance", "turkish": "bolluk, bereket", "example": "The garden was filled with an abundance of colorful flowers."},
    {"term": "abundant", "turkish": "bol, bereketli", "example": "The region is abundant in natural resources."},
    {"term": "accelerate", "turkish": "hızlandırmak", "example": "The car began to accelerate as it entered the highway."},
    {"term": "accept", "turkish": "kabul etmek", "example": "She was happy to accept the invitation."},
    {"term": "access", "turkish": "erişmek, ulaşmak", "example": "You need a password to access the system."},
    {"term": "accessible to", "turkish": "erişilebilir", "example": "The library is easily accessible to everyone."},
    {"term": "accommodate", "turkish": "ağırlamak", "example": "The hotel can accommodate up to 500 guests."},
    {"term": "accompany", "turkish": "eşlik etmek", "example": "He will accompany her to the concert."},
    {"term": "accomplish", "turkish": "başarmak", "example": "She managed to accomplish her goals despite the challenges."},
    {"term": "accumulate", "turkish": "biriktirmek, yığmak", "example": "Over the years, he managed to accumulate a large fortune."},
    {"term": "accuracy", "turkish": "doğruluk, kesinlik", "example": "The accuracy of this measurement is crucial for the experiment."},
    {"term": "accurate", "turkish": "doğru, hatasız", "example": "The weather forecast was surprisingly accurate today."},
    {"term": "accurately", "turkish": "doğru şekilde", "example": "She answered all the questions accurately."},
    {"term": "accuse", "turkish": "suçlamak", "example": "He was accused of stealing the money."},
    {"term": "achieve", "turkish": "başarmak", "example": "You can achieve your dreams with hard work."},
    {"term": "acknowledge as", "turkish": "kabul etmek", "example": "He is widely acknowledged as an expert in his field."},
    {"term": "acquainted with", "turkish": "aşina olmak", "example": "She is well acquainted with the company's policies."},
    {"term": "acquire", "turkish": "edinmek, kazanmak", "example": "He managed to acquire several new skills during the training."},
    {"term": "acquisition", "turkish": "edinim", "example": "The acquisition of the new company boosted their profits."},
    {"term": "activity", "turkish": "aktivite", "example": "Outdoor activities are great for children."},
    {"term": "adapt", "turkish": "uyarlamak, uydurmak", "example": "He quickly adapted to the new working environment."},
    {"term": "addict", "turkish": "bağımlı, tiryaki", "example": "She is a coffee addict and can't start her day without it."},
    {"term": "addiction to", "turkish": "bağımlılık", "example": "His addiction to video games affected his studies."},
    {"term": "addition", "turkish": "ilave, ek", "example": "In addition to his job, he also volunteers at the shelter."},
    {"term": "additionally", "turkish": "ayrıca", "example": "Additionally, she offered to help with the paperwork."},
    {"term": "adequately", "turkish": "yeterli şekilde", "example": "The problem was adequately addressed during the meeting."},
    {"term": "adjust", "turkish": "uyarlamak, alışmak", "example": "He had to adjust to the new climate quickly."},
    {"term": "adjustment", "turkish": "düzeltme, uyum", "example": "Small adjustments were made to improve the design."},
    {"term": "administer", "turkish": "yönetmek, sağlamak", "example": "The nurse will administer the medication to the patient."},
    {"term": "admire", "turkish": "hayran olmak", "example": "She admires his dedication to his work."},
    {"term": "admit", "turkish": "kabullenmek, itiraf etmek", "example": "He admitted his mistake and apologized."},
    {"term": "adopt", "turkish": "evlat edinmek, benimsemek", "example": "They decided to adopt a child from the orphanage."},
    {"term": "adore", "turkish": "çok sevmek", "example": "She adores her little puppy."},
    {"term": "adverse", "turkish": "zıt, kötü", "example": "The project was canceled due to adverse weather conditions."},
    {"term": "advocate", "turkish": "savunmak, desteklemek", "example": "She advocates for equal rights for all."},
    {"term": "affect", "turkish": "etkilemek", "example": "The new policy will affect thousands of workers."},
    {"term": "aggravate", "turkish": "kötüleştirmek", "example": "His comments only aggravated the situation."},
    {"term": "aggressive", "turkish": "saldırgan", "example": "The dog became aggressive when it felt threatened."},
    {"term": "aid", "turkish": "yardım etmek", "example": "International organizations sent aid to the earthquake victims."},
    {"term": "alien to", "turkish": "yabancı", "example": "The concept of fairness was alien to him."},
    {"term": "alongside", "turkish": "yanında", "example": "He worked alongside his father on the farm."},
    {"term": "alter", "turkish": "değiştirmek", "example": "She had to alter her dress for the party."},
    {"term": "alteration", "turkish": "değişiklik", "example": "The plan required several alterations before approval."},
    {"term": "amazing", "turkish": "şaşırtıcı", "example": "The view from the mountain was absolutely amazing."},
    {"term": "amend", "turkish": "düzeltmek, değiştirmek", "example": "The proposal was amended to include new information."},
    {"term": "amendment", "turkish": "değişiklik", "example": "The amendment to the law was passed yesterday."},
    {"term": "amusing", "turkish": "eğlenceli", "example": "His jokes were very amusing."},
    {"term": "announce", "turkish": "ilan etmek", "example": "The company announced its new CEO this morning."},
    {"term": "anticipate", "turkish": "beklemek, ummak", "example": "We anticipate that the event will be a great success."},
    {"term": "apologize", "turkish": "özür dilemek", "example": "He apologized for being late to the meeting."},
    {"term": "appalling", "turkish": "korkunç", "example": "The living conditions in the camp were appalling."},
    {"term": "appointment", "turkish": "atama, randevu", "example": "I have an appointment with the doctor at 10 AM."},
    {"term": "appreciate", "turkish": "takdir etmek", "example": "I really appreciate your help with the project."},
    {"term": "approach", "turkish": "yaklaşmak", "example": "The train is approaching the station."},
    {"term": "appropriately", "turkish": "uygun şekilde", "example": "He was dressed appropriately for the formal event."},
    {"term": "approve of", "turkish": "onaylamak", "example": "Her parents approve of her career choice."},
    {"term": "arrange", "turkish": "düzenlemek", "example": "She arranged the books neatly on the shelf."},
    {"term": "arrogant", "turkish": "kibirli", "example": "His arrogant behavior annoyed everyone at the meeting."},
    {"term": "artificial", "turkish": "yapay", "example": "The flowers in the vase were artificial but looked real."},
    {"term": "ascend", "turkish": "yükselmek", "example": "The balloon slowly ascended into the sky."}
];
