// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:real_estate/utilits/app_config.dart';

// class BuildSearchWidget extends StatelessWidget {
//   const BuildSearchWidget({Key? key, required this.onTap}) : super(key: key);
//   final Function() onTap;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Padding(
//       padding: const EdgeInsets.all(0.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 color: Colors.grey[100],
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.grey.shade100)),
//             height: 50,
//             width: size.width * .9,
//             child: TextField(
//               // controller: widget.searchlist,
//               onSubmitted: (String v) {
//                 //  widget.onSearch();
//               },
//               textInputAction: TextInputAction.search,
//               decoration: InputDecoration(
//                 // focusColor: Colors.black,
//                 // fillColor: Colors.black,
//                 disabledBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                       color: Color.fromARGB(255, 31, 30, 30), width: 1.0),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                       color: Color.fromARGB(255, 31, 30, 30), width: 1.0),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 suffixIcon: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Icon(
//                     Icons.filter_list,
//                     // width: 1,
//                     // height: 1,
//                   ),
//                 ),

//                 prefixIcon: IconButton(
//                   alignment: Alignment.topCenter,
//                   onPressed: () {
//                     //   widget.onSearch();
//                   },
//                   icon: const Icon(
//                     CupertinoIcons.search,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 hintText: AppConfig.search.tr,
//                 hintStyle: const TextStyle(color: Colors.grey),
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide.none,

//                   borderRadius: BorderRadius.circular(5),
//                   // borderSide: const BorderSide(color: Colors.black),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
