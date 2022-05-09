import 'package:flutter/material.dart';



class TeslaNewsMorePage extends StatelessWidget {
  final int selectedItemIndex;
  int count = 0;

  TeslaNewsMorePage(this.selectedItemIndex, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/backgroundImage.png'),
        ),
      ),
      // child: details(TeslaNews[selectedItemIndex]),
    );
  }
//
//
//   Widget details(TeslaNews  results) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 12, right: 12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 140),
//           Text(
//             results.articles![0].author!,
//             style: TextStyle(
//               fontSize: 26,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Image.asset(
//                     'assets/icons/ic_oven.png',
//                     height: 20,
//                     width: 20,
//                   ),
//                   const SizedBox(width: 4),
//                   Text(
//                     results.status.toString(),
//                     style: const TextStyle(
//                         color: Color(0xff52616B), fontWeight: FontWeight.w600),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Image.asset(
//                     'assets/icons/ic_fire.png',
//                     height: 20,
//                     width: 20,
//                   ),
//                   const SizedBox(width: 4),
//                   Text(
//                     results.status.toString(),
//                     style: TextStyle(
//                         color: Color(0xff52616B), fontWeight: FontWeight.w600),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Image.asset(
//                     'assets/icons/ic_call.png',
//                     height: 20,
//                     width: 20,
//                   ),
//                   const SizedBox(width: 4),
//                   Text(
//                     '438 кал',
//                     style: TextStyle(
//                         color: Color(0xff52616B), fontWeight: FontWeight.w600),
//                   ),
//                 ],
//               ),
//             ],
//       ),
//     ),
//     );
//   }
}