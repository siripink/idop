import 'package:flutter/material.dart';
import 'navigation.dart';

class FAQ extends StatelessWidget {
  static const String routeName = '/material/two-level-list';

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(title: Text('FAQ')),
        body: new ListView(
            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
            children: <Widget>[
              new ExpansionTile(
                  title: const Text('Is it possible to eat only vegetarian food at Wat Dhammakaya? Can I bring my own food?'),
                  children: <Widget>[
                    buildAnswer( context, 'We do not provide individual vegetarian meals. However, you may remove meat from food that is offered to you at breakfast and lunch. Most of the meat offered is fish, chicken and pork. You are not allowed to keep your own food in storage. However, friends and family are allowed to offer special food to you for breakfast and lunch.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Are there medical requirements for admission?'),
                  children: <Widget>[
                    buildAnswer( context, 'Yes, all applicants must provide a medical certificate to prove that you are healthy and be able to join the program. The medical check list will be sent to you via email by IDOP staff. The result of HIV,Amphetamine & chest X-Ray are also required. You will receive more detail information once your application is approved.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Do I need a physical examination before I arrive?'),
                  children: <Widget>[
                    buildAnswer( context, 'You will need a physical examination prior to acceptance into the ordination program. You are expected to have a professional examination completed upon arrival. There are specific medical requirements for admission. Applicants must be free from: Tuberculosis; Asthma; Boils; Eczema; Leprosy; Epilepsy; Diabetes; Heart Disease and HIV. Please see our “Medical Checklist” web page for information concerning medical requirements. These requirements for ordination are based on the teaching of Lord Buddha concerning eligibility for the Sangha.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Are women allowed to ordain at Wat Phra Dhammakaya?'),
                  children: <Widget>[
                    buildAnswer( context, 'Women do not ordain as monks at Wat Phra Dhammakaya.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Is it necessary to shave my head and eyebrows to become a monk?'),
                  children: <Widget>[
                    buildAnswer( context, 'It is necessary to shave your head and eyebrows for ordination. All ordinands go through a “Hair Clipping Ceremony” to cleanse themselves for ordination. This is a very important ceremony.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('What are Precepts, and how many do I have to follow?'),
                  children: <Widget>[
                    buildAnswer( context, 'Precepts are ethical rules that monks follow in order to develop discipline and purity of mind, speech and body; the most important of which is Mindfulness. As a layman in training, you will follow 8 Precepts and as a monk, 227 Precepts. The 8 Precepts will be e-mailed to you by the IDOP staff.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Will people be available to answer questions and help me get settled?'),
                  children: <Widget>[
                    buildAnswer( context, 'The IDOP staff is eager to help you get settled and answer all your questions, especially keeping the precepts, chanting, meditation, proper behavior and dress code for monks.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('What will I be doing and learning when I am a monk?'),
                  children: <Widget>[
                    buildAnswer( context, 'You will follow a busy daily schedule beginning at 4:30 am and finishing after Evening Chanting and Meditation, about 9 pm. You will receive training in the Precepts of being a monk and attend regular Dhamma lectures. You will experience the life and tradition of a Buddhist monk dating back 2500 years to the time of Lord Buddha and the founding of the Sangha.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('What can I do to prepare myself for ordination before I arrive at Wat Phra Dhammakaya?'),
                  children: <Widget>[
                    buildAnswer( context, 'It is advisable to practice the Pali Ordination Chanting before you arrive. A copy of the required ordination chanting will be sent to you by the IDOP staff. It is also advisable to practice meditation and stretching exercises prior to your arrival. This will better prepare you for the chanting and meditation sessions. These meditation sessions develop gradually in length during the initial training and may last up to three hours. However, the amount of time is optional and not a requirement.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Can my parents and friends mail things to me?'),
                  children: <Widget>[
                    buildAnswer( context, 'You may receive personal items. Always consider the effect of climate on mailed merchandise.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Can I bring a car or other means of transportation with me to Wat Phra Dhammakaya?'),
                  children: <Widget>[
                    buildAnswer( context, 'You may keep a car or other vehicle at Wat Phra Dhammakaya for use only when you are not a monk.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Do I need permission from anyone to ordain?'),
                  children: <Widget>[
                    buildAnswer( context, 'According to your situation, you will need parental, guardian, relative or spouse permission to ordain.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Do I need a visa to enter Thailand?'),
                  children: <Widget>[
                    buildAnswer( context, 'You will need to bring your Passport with a three month visa to enter Thailand. The visa is obtained from a Thai Embassy prior to departure. Please contact your regional Thai Embassy for information. You will also need a photocopy of your Passport and a recent 2” passport photograph of yourself.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Will I be able to speak with someone from Wat Phra Dhammakaya before acceptance?'),
                  children: <Widget>[
                    buildAnswer( context, 'You will be interviewed by the IDOP staff via the internet prior to acceptance. This is a good time to ask important questions. Please do not hesitate to clarify all significant personal concerns.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('What is the cultural mixture of people who ordain with IDOP?'),
                  children: <Widget>[
                    buildAnswer( context, 'It is difficult to predict the international mix of people for each IDOP. Past IDOP participants were mostly from China; Singapore and Malaysia while the remainder came from Mongolia; Korea; Japan; Laos; Australia; New Zealand; Europe; Russia, Great Britain; Canada; America; Africa; India; Bangladesh; Nepal and Tibet.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Do staff members of IDOP speak English? And, will the training be offered in English?'),
                  children: <Widget>[
                    buildAnswer( context, 'Several members of the IDOP staff who work as Mentors and Teaching Monks speak English. Training will be offered in English, as well as other necessary languages. IDOP is a multilingual training program. Most people who attend IDOP use minimal English, and they communicate effectively. English is becoming the primary international language.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('How would you best describe the general goal of IDOP training?'),
                  children: <Widget>[
                    buildAnswer( context, 'We have a motto: Unity brings happiness. We help you eliminate old bad habits and develop new good habits. Most importantly, you will learn to stop the mind from thinking at the center of the body. This is the beginning of true wisdom and eternal happiness.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Do I have to be a Buddhist to attend IDOP ?'),
                  children: <Widget>[
                    buildAnswer( context, 'Buddhism is not really a religion but rather a science of the mind. You do not have to be a card carrying Buddhist to learn the method and benefits of Dhammakaya meditation. People from all walks of life and religion often ordain for the unique experience of being a monk while learning the ancient art of meditation. Dhammakaya meditation is in profound harmony with all the great world religions.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Do I need insurance and specific vaccinations before I arrive at Wat Phra Dhammakaya?'),
                  children: <Widget>[
                    buildAnswer( context, 'You are provided, free of charge, with one month of personal insurance during your initial visit at Wat Phra Dhammakaya. Any extension of your initial visit will not immediately include personal insurance. Please see our “Medical Checklist” web page for information concerning vaccinations.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('What is the climate like and what clothes should I bring?'),
                  children: <Widget>[
                    buildAnswer( context, 'The summer temperature in Bangkok is very hot and humid, sometimes above 35 degrees Celsius. Summer temperature in Chiang Mai is cooler and humid, sometimes below 25 degrees Celsius. All clothing will be provided for you to wear during the ordination program. Bring clothing you expect to wear before and after ordination.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('How many meals will I have each day?'),
                  children: <Widget>[
                    buildAnswer( context, 'There are two complete meals served every day, breakfast and lunch. Monks are not allowed to eat another meal after lunch. Lunch is served at 11 am. Later in the day, monks may eat special food called pana: ice cream, smoothies, yogurt, chocolate, cheese and liquids.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('What time does the day begin and end for monks?'),
                  children: <Widget>[
                    buildAnswer( context, 'Monks wake up everyday at 4:30 am and attend chanting and meditation at 5 am. Monks usually go to bed after evening chanting and meditation, about 9 pm. All lights are out at 10:30 pm.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Will I be allowed to ordain if I am not heterosexual?'),
                  children: <Widget>[
                    buildAnswer( context, 'According to the Vinaya Rules for Ordination, men whose sexual orientation is not heterosexual are not permitted to ordain. This excludes the following people from ordaining: Transvestite; Hermaphrodite; Transgender; Homosexual; and Bisexual. Requirements for ordination are based on the teaching of Lord Buddha concerning eligibility for the Sangha.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Will I be allowed to smoke cigarettes and drink alcohol during my stay at Wat Dhammakaya?'),
                  children: <Widget>[
                    buildAnswer( context, 'No person is permitted to smoke cigarettes and drink alcohol. This is a good time to practice self-denial and develop self-control.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Will I be allowed to wear body piercings and jewelry?'),
                  children: <Widget>[
                    buildAnswer( context, 'No body piercing and jewelry are allowed during the ordination process.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('If I cannot meditate on the floor, may I use a chair?'),
                  children: <Widget>[
                    buildAnswer( context, 'We prefer people sit on the floor, but if it is too difficult, people are welcome to use a chair or large cushion for chanting and meditation.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('What is the accommodation like? And, will I be sleeping on a soft bed?'),
                  children: <Widget>[
                    buildAnswer( context, 'People sleep in large rooms alongside other monks on wood floors using a thin mat and mosquito net. Each Kuti accommodates about 40 monks.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Do I have to pay for my ordination robes?'),
                  children: <Widget>[
                    buildAnswer( context, 'All necessary robes and monk paraphernalia are included in the Registration Fee.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Am I allowed to keep personal items, and will I need to keep money with me?'),
                  children: <Widget>[
                    buildAnswer( context, 'You will not need money and personal items. You will be living with only necessary possessions. Wat Phra Dhammakaya is not responsible for lost or stolen personal items.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Will I need bathroom and personal cleaning items?'),
                  children: <Widget>[
                    buildAnswer( context, 'All bathroom toiletries will be provided with no extra charge.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Will I be allowed to leave Wat Phra Dhammakaya to go shopping, visit people and see tourist sites?'),
                  children: <Widget>[
                    buildAnswer( context, 'You will not be allowed to leave the temple grounds without specific approval. Monks, as a group, make trips into the surrounding area to see Thai temples and release fish. You will travel north by bus to live in the mountains of Chiang Mai for two weeks in a Dhammakaya meditation retreat.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('What is a Fish Release Ceremony?'),
                  children: <Widget>[
                    buildAnswer( context, 'A Fish Release is a ceremony performed by monks to free fish that will be killed. Fish Release is a fun way of making Merit for good karma.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('What is Merit?'),
                  children: <Widget>[
                    buildAnswer( context, 'Merit is also called Boon. It is the effect of doing good deeds. Merit accumulates good karma that dilutes bad karma and alleviates suffering. The power of Merit makes all things possible.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Am I allowed to keep a cell phone, computer, camera, watch, wallet, etc. for personal use?'),
                  children: <Widget>[
                    buildAnswer( context, 'You will not be allowed to keep a cell phone, computer, camera, watch, wallet, money, etc. during your training at Wat Phra Dhammakaya. These items will be held in safe deposit by the IDOP staff. However, you may use a phone and e-mail occasionally with permission from mentor monks.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('How long am I allowed to stay as a monk at Wat Phra Dhammakaya?'),
                  children: <Widget>[
                    buildAnswer( context, 'You are expected to remain in the program for one month. You may apply to extend your stay as a monk with no additional fee. Qualified Men are welcome to stay for as long as they like.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('If I arrive before Registration Day, may I stay at Wat Phra Dhammakaya?'),
                  children: <Widget>[
                    buildAnswer( context, 'It is possible to make arrangements to stay at Wat Phra Dhammakaya for a short period of time before Registration Day. Agreements and reservations are necessary.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('How do I get to Wat Phra Dhammakaya from the international airport in Bangkok?'),
                  children: <Widget>[
                    buildAnswer( context, 'Wat Phra Dhammakaya is one hour north of Bangkok and costs about \$15 dollars by taxi. Arrangements can be made for someone to meet you at the airport. Directions and address for Wat Phra Dhammakaya will be e-mailed to you by the IDOP staff.'),
                  ]
              ),
              new ExpansionTile(
                  title: const Text('Why do people choose to ordain at Wat Phra Dhammakaya?'),
                  children: <Widget>[
                    buildAnswer( context, 'People ordain at Wat Phra Dhammakaya for many different reasons but essentially to have an authentic experience of life as a Buddhist monk in an environment that preserves the 2500 year history of monastic life in the Sangha. "Peace is the essence of happiness, and that essence is the true nature of all beings." The benefit of training as a monk in IDOP is the effect of experiencing this inner peace and essence that exists in all human beings through the practice of Dhammakaya meditation.'),
                  ]
              ),
            ]
        ),
        drawer: Navigation()
    );
  }

  Widget buildAnswer(BuildContext context, String answer) {
    return new ListTile(title: Text(
        answer,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.body1.copyWith(color: Colors.black54),
        softWrap: true,
      )
    );
  }
}