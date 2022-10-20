import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;


class NewsTile extends StatelessWidget {
  final String? imgUrl, title, desc, sourceName, publishedat;

  NewsTile(
      {this.imgUrl, this.desc, this.title, this.sourceName, this.publishedat});

  @override
  Widget build(BuildContext context) {
    // DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(publishedat!);
     final Ago = DateTime.now().subtract(Duration(minutes: 15));
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top:6.0,bottom: 6.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.all(Radius.circular(20)
        ),
        child: Container(
          // height: size.height * 0.3,
          // width: size.width * 0.8,
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          decoration: const BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: timeago.format(Ago),
                        // text: publishedat,
                        style: TextStyle(color: Colors.red),
                        children: [TextSpan(text: " "+sourceName!,style: TextStyle(color: Colors.red))]),
                  ),
                  Text(title!.substring(0,30) + "...",maxLines: 1,style: TextStyle(color: Colors.blue,fontSize: 14,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            SizedBox(height: 80,width: 80, child: Image.network(imgUrl!))
          ]),
        ),
      ),
    );
  }
}



//  return GestureDetector(
//       onTap: () {
//       },
//       child: Container(
//           margin: const  EdgeInsets.only(bottom: 28),
//           width: MediaQuery.of(context).size.width*0.8,
//           child: Material(
        
//             borderRadius:const BorderRadius.all(Radius.circular(10)),
//             elevation: 10.0,
//             child: Container(
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
//                 alignment: Alignment.bottomCenter,
//                 decoration: const BoxDecoration(
//                   // color: Colors.blue,
//                     borderRadius: BorderRadius.only(
//                         bottomRight: Radius.circular(6),
//                         bottomLeft: Radius.circular(6))),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   // mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     ClipRRect(
//                         borderRadius: BorderRadius.circular(6),
//                         child: Image.network(
//                           imgUrl!,
//                           height: 200,
//                           width: MediaQuery.of(context).size.width,
//                           fit: BoxFit.cover,
//                         )),
//                    const SizedBox(
//                       height: 12,
//                     ),
//                     Text(
//                       title!,
//                       maxLines: 2,
//                       style: const  TextStyle(
//                           color: Colors.black87,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     const SizedBox(
//                       height: 4,
//                     ),
//                     Text(
//                       desc!,
//                       maxLines: 2,
//                       style:  const TextStyle(color: Colors.black54, fontSize: 14),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           )),
//     );