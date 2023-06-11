import 'package:flutter/material.dart';
import 'package:woo_f/widgets/button.dart';
import 'package:woo_f/widgets/currency_card.dart';

void main() {
  runApp(const App());
}

// flutter SDK에 있는 3개의 core Widget 중 하나를 상속(extend)받아야 한다.
// 가장 기초적인 위젯을 하나 상속 받았다.
// 이 때 StatelessWidget이 정해놓은 계약을 이행해야 한다.
// 이는 위젯을 만들고 싶다면 build 메소드를 구현해야한다.
// build 메소드는 flutter가 실행하게 될 메소드인데 이 메소드가 뭘 return하던지 이를 화면에 띄워줄 것이다.
// 이 클래스는 루트 위젯이다.
class App extends StatelessWidget {
  const App({super.key});

  // 부모 class에 이미 있는 메소드를 override 한다는 것이다.
  @override
  Widget build(BuildContext context) {
    // material or cupertino -> 구글 or ios형식으로 반환
    return MaterialApp(
      // 화면이 scaffold라고 하는 것을 가져야하는데 이는 구조를 제공한다.
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Hey, Wooyoung',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Total Balacne',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                '\$5 194 482',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                      text: 'Transfer',
                      bgColor: Color(0xfff1b33b),
                      textColor: Colors.black),
                  Button(
                      text: 'Required',
                      bgColor: Color(0xff1f2123),
                      textColor: Colors.white),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Wallets',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CurrencyCard(
                name: 'Euro',
                code: 'EUR',
                amount: '6 428',
                icon: Icons.euro_rounded,
                isInverted: false,
              ),
              Transform.translate(
                offset: const Offset(0, -30),
                child: const CurrencyCard(
                  name: 'Bitcoin',
                  code: 'BTC',
                  amount: '9 785',
                  icon: Icons.currency_bitcoin,
                  isInverted: true,
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -60),
                child: const CurrencyCard(
                  name: 'Dollar',
                  code: 'USD',
                  amount: '428',
                  icon: Icons.money_off_csred_outlined,
                  isInverted: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
