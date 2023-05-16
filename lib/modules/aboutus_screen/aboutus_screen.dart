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
                           child: Column(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.all(10.0),
                                 child: Text(
                                   'At [Your Company Name], we envision a future where lawn care is effortless, eco-friendly, and smart. Our commitment to sustainability and innovation drives us to create cutting-edge solutions that not only simplify our customers\' lives but also contribute to a greener planet\. By harnessing the power of solar energy and automation, we aim to revolutionize the way people maintain their outdoor spaces',
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
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 250,
                      width: 150,
                        child: Image(
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1527118732049-c88155f2107c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z2lhbnQlMjBwYW5kYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
                             // 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                          ),
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
                      child: Image(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1527118732049-c88155f2107c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z2lhbnQlMjBwYW5kYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
                          // 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
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
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'At [Your Company Name], we envision a future where lawn care is effortless, eco-friendly, and smart. Our commitment to sustainability and innovation drives us to create cutting-edge solutions that not only simplify our customers\' lives but also contribute to a greener planet\. By harnessing the power of solar energy and automation, we aim to revolutionize the way people maintain their outdoor spaces',
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
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'At [Your Company Name], we envision a future where lawn care is effortless, eco-friendly, and smart. Our commitment to sustainability and innovation drives us to create cutting-edge solutions that not only simplify our customers\' lives but also contribute to a greener planet\. By harnessing the power of solar energy and automation, we aim to revolutionize the way people maintain their outdoor spaces',
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
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 250,
                      width: 150,
                      child: Image(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1527118732049-c88155f2107c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z2lhbnQlMjBwYW5kYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
                          // 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                        ),
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
