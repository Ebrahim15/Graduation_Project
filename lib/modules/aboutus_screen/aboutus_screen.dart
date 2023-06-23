import 'package:flutter/material.dart';

import '../../layout/app_layout/app_layout.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.00,
        centerTitle:true ,
        title:const Text(
          'About Us',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4d4d4d),
          ),
        ) ,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF063C14),
            size: 25,
          ) ,
          onPressed:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AppLayout()),
            );
          } ,
        ) ,

      ) ,
      body:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Our Vision',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 200,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'We envision a future where lawn care is effortless, eco-friendly, and smart. Our commitment to sustainability and innovation drives us to create cutting-edge solutions that not only simplify our customers\' lives but also contribute to a greener planet. By harnessing the power of solar energy and automation, we aim to revolutionize the way people maintain their outdoor spaces.',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 250,
                      width: 150,
                      child: Image.asset(
                        'assets/images/green_energy.jpg',
                        height: 250,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                child: Row(
                  children: [
                    SizedBox(
                      height: 250,
                      width: 150,
                      child: Image.asset(
                        'assets/images/Automower-450X-action-3.webp',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          'Approach',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 200,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Our approach is centered around three core principles: convenience, sustainability, and adaptability. We believe that lawn care should be a hassle-free experience, which is why we\'ve designed our automated grass cutter to be easily controlled through a user-friendly mobile app. By utilizing solar energy, we\'re reducing our carbon footprint and promoting clean energy solutions. Lastly, we continuously strive to improve and adapt our technology to meet the ever-changing needs of our customers and the environment.',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Add your other widgets here
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Process',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 200,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Our process begins with extensive research and development to ensure that our automated grass cutter is both efficient and reliable. We then incorporate state-of-the-art solar technology and smart features, such as GPS navigation and customizable cutting patterns, to provide a seamless user experience. Finally, we rigorously test our product to guarantee its durability and performance under various conditions. By following this meticulous process, we\'re able to deliver a high-quality, eco-friendly solution for lawn care that exceeds our customers\' expectations.',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 250,
                      width: 150,
                      child: Image.asset(
                        'assets/images/solar.webp',
                        height: 250,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
