import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String? selctedItem;
  final List<String> _item = [
    'food',
    "Transfer",
    "Transportation",
    "Education"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            background_container(context),
            Positioned(top: 120, child: main_container())
          ],
        ),
      ),
    );
  }

  Container main_container() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      width: 340,
      height: 550,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          name(),
          
        ],
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: 300,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 2, color: const Color(0xffC5C5C5))),
        child: DropdownButton(
            value: selctedItem,
            items: _item
                .map((e) => DropdownMenuItem(
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            child: Image.asset("images/${e}.png"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            e,
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                      value: e,
                    ))
                .toList(),
            selectedItemBuilder: (BuildContext context) => _item
                .map((e) => Row(
                      children: [
                        Container(
                          width: 42,
                          child: Image.asset('images/${e}.png'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          e,
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ))
                .toList(),
            hint: const Text("Name"),
            dropdownColor: Colors.white,
            isExpanded: true,
            underline: Container(),
            onChanged: ((value) {
              setState(() {
                selctedItem = value!;
              });
            })),
      ),
    );
  }
}

Column background_container(BuildContext context) {
  return Column(
    children: [
      Container(
        width: double.infinity,
        height: 240,
        decoration: const BoxDecoration(
            color: Color(0xff368983),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back, color: Colors.white)),
                  const Text(
                    "Adding",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.attach_file_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}
