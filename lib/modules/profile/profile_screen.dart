import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     appBar: AppBar(
       backgroundColor: Colors.white,
       elevation: 0.00,
       centerTitle:true ,
       title:Text(
           'My Profile',
         style: TextStyle(
           fontSize: 16,
           fontWeight: FontWeight.bold,
           color: Color(0xFF4d4d4d),
         ),
       ) ,
     ) ,
     body: Column(
       children: [
         Container(
           width: 300,
           height: 1.0,
           color:Color(0xFFcacdcb),
         ),
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: Row(
             children: [
               const CircleAvatar(
                 radius: 70,
                 backgroundImage:AssetImage ('assets/images/profile2.jpg'),
               ),
               const SizedBox(
                 width: 20.0,
               ),
               Flexible(
                 child: Column(
                   children: [
                     Text(
                       'khaled,hashim23@gmail.com',
                       maxLines: 1,
                       overflow:TextOverflow.ellipsis ,
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 16,
                         color: Color(0xFF667069),
                       ),
                     ),
                     Text(
                       'Khaled.M.H',
                       maxLines: 2,
                       overflow:TextOverflow.ellipsis ,
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 16,
                         color: Color(0xFF474747),
                       ),
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     defaultLogInOutButton(
                         wid: 130,
                         high: 40,
                         buttonText: 'Edit Profile',
                         onPressed: () {  }
                     ),
                   ],
                 ),
               ),
               // Stack(
               //   alignment: AlignmentDirectional.bottomEnd,
               //   children: const [
               //     CircleAvatar(
               //       radius: 140.0,
               //       backgroundImage: NetworkImage('https://scontent.fcai22-1.fna.fbcdn.net/v/t39.30808-1/275071295_662218618161041_2481124221236884396_n.jpg?stp=dst-jpg_p160x160&_nc_cat=102&ccb=1-7&_nc_sid=dbb9e7&_nc_ohc=n23x8kiTq3IAX8-l7jX&_nc_ht=scontent.fcai22-1.fna&oh=00_AfAb7gvBY_RxaVOZf7eDDEPTYcmog7YoIV2j0WQz37WrxQ&oe=63974CA9'),
               //     ),
               //     Padding(
               //       padding: EdgeInsetsDirectional.only(
               //         bottom: 3.0,
               //         end: 3.0,
               //       ),
               //       child: CircleAvatar(
               //         radius: 7.0,
               //        // backgroundImage: ,
               //       ),
               //     ),
               //   ],
               // ),
             ],
           ),
         ),
         SizedBox(
           height: 20.0,
         ),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   'Name',
                   style: TextStyle(
                     fontWeight:FontWeight.bold,
                     color: Color(0xFF87888f),

                   ),
                 ),
                 Text(
                   'khaled mohamed abou hashim',
                   style: TextStyle(
                     fontSize:20 ,
                     color: Colors.black,
                   ),
                 ),
                 Container(
                   width: 250,
                   height: 1.0,
                   color:Color(0xFFcacdcb),
                 ),
               ],
             ),
             SizedBox(
               height: 20.0,
             ),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   'Email',
                   style: TextStyle(
                     fontWeight:FontWeight.bold,
                     color: Color(0xFF87888f),

                   ),
                 ),
                 Text(
                   'khale.hashim23@gmail.com',
                   style: TextStyle(
                     fontSize:20 ,
                     color: Colors.black,
                   ),
                 ),
                 Container(
                   width: 250,
                   height: 1.0,
                   color:Color(0xFFcacdcb),
                 ),
               ],
             ),
             SizedBox(
               height: 20.0,
             ),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   'Phone',
                   style: TextStyle(
                     fontWeight:FontWeight.bold,
                     color: Color(0xFF87888f),

                   ),
                 ),
                 Text(
                   '01097010260',
                   style: TextStyle(
                     fontSize:20 ,
                     color: Colors.black,
                   ),
                 ),
                 Container(
                   width: 250,
                   height: 1.0,
                   color:Color(0xFFcacdcb),
                 ),
               ],
             ),
             SizedBox(
               height: 20.0,
             ),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   'Address',
                   style: TextStyle(
                     fontWeight:FontWeight.bold,
                     color: Color(0xFF87888f),

                   ),
                 ),
                 Text(
                   '************8',
                   style: TextStyle(
                     fontSize:20 ,
                     color: Colors.black,
                   ),
                 ),
                 Container(
                   width: 250,
                   height: 1.0,
                   color:Color(0xFFcacdcb),
                 ),
               ],
             ),

           ],
         ),

       ],
     ),
     // body:,
    );
  }
}