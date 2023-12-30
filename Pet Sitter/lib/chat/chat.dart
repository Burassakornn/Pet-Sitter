import 'chatdetail.dart';
import "package:badges/badges.dart" as badges;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'chat_model.dart';



class Store extends ChangeNotifier {
  //=== var: cats

  List<Cat> get cats => _cats;
  void setCats(List<Cat> cats) {
    _cats = cats;
    notifyListeners();
  } //ef

  List<Cat> _cats = [
    Cat(
        name: "Albury PetSitter",
        pic: "images/man1.jpg",
        description: "cat1 store",
        date: "17/09/2023 10:10",
        notifications: [
          Noti(id: 1, message: "message1"),
          Noti(id: 2, message: "message2")
        ]),
    Cat(
        name: "Lane PetSitter",
        pic: "images/man2.jpg",
        description: "cat2 store",
        date: "22/08/2023 10:10",
        notifications: [
          Noti(id: 1, message: "message3"),
        ]),
    Cat(
        name: "Marshall PetSitter",
        pic: "images/man3.jpg",
        description: "cat3 store",
        date: "15/07/2023 10:10",
        notifications: []),
    Cat(
        name: "Bella PetSitter",
        pic: "images/man4.jpg",
        description: "cat4 store",
        date: "8/05/2023 10:10",
        notifications: []),
    Cat(
        name: "Smith PetSitter",
        pic: "images/man5.jpg",
        description: "cat5 store",
        date: "6/04/2023 12:10",
        notifications: []),
    Cat(
        name: "PetSitClick",
        pic:"images/man6.jpg",
        description: "cat6 store",
        date: "8/03/2023 20:10",
        notifications: []),
    Cat(
        name: "Penn Vet",
        pic: "images/man7.jpg",
        description: "cat7 store",
        date: "18/01/2023 10:10",
        notifications: [])
  ];

  int getTotalNoti() {
    int total = 0;
    for (Cat cat in _cats) {
      total += cat.notifications.length;
    }
    return total;
  }
//======
} //ec

//===> class: NotificationScreen
class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store1 = Provider.of<Store>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Let's Talk!",
          style: TextStyle(color: Colors.white),
        ),
      ),
 body: ListView.builder(
  itemCount: store1.cats.length,
  itemBuilder: (BuildContext context, int index) {
    Cat cat = store1.cats[index];
    String dateString = cat.date;
    int numNoti = cat.notifications.length;
    DateTime dateTime = DateFormat("dd/MM/yyyy HH:mm").parse(dateString);
    DateTime now = DateTime.now();
    Duration difference = now.difference(dateTime);
    String timeAgo = formatTimeAgo(difference);

    TextStyle nameTextStyle = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 15,
    );

    if (cat.name == "Albury PetSitter" || cat.name == "Lane PetSitter") {
      nameTextStyle = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      );
    }

 return GestureDetector(
  onTap: () {
    // Handle the click action by navigating to CatDetailsScreen
   Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) {
      // Find the index of the selected chat based on its name
      int selectedChatIndex = store1.cats.indexWhere((cat) => cat.name == store1.cats[index].name);

      return ChatDetailsScreen(chatIndex: selectedChatIndex);
    },
  ),
);

  },
  child: Card(
    // Wrap the Card with ClipRRect here
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    elevation: 2,
    margin: EdgeInsets.fromLTRB(100, 5, 100, 5),
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: numNoti > 0
                ? badges.Badge(
                    position: badges.BadgePosition(start: 45,top: 2),
                    badgeContent: Text(
                      numNoti.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Color.fromARGB(255, 255, 62, 62),
                        child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: ClipOval(
                            child: Image.asset(
                              store1._cats[index].pic,
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Color.fromARGB(0, 103, 10, 117),
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: ClipOval(
                          child: Image.asset(
                            store1._cats[index].pic,
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              store1.cats[index].name,
              style: nameTextStyle,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(timeAgo),
          ),
          Expanded(
            flex: 1,
            child: Text(dateString),
          ),
        ],
      ),
    ),
  ),
);

  },
),
    );
  }

  String formatTimeAgo(Duration difference) {
    if (difference.inDays > 0) {
      return "${difference.inDays} days ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} Hrs ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} mins ago";
    } else {
      return "${difference.inSeconds} secs ago";
    }
  }
}


