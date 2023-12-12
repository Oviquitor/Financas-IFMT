import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Payments",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05), blurRadius: 20)
                  ],
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 10,
                      color: Colors.lightBlueAccent,
                    ),
                    Text(
                      "ADD",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.lightBlueAccent,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.warning,
                        size: 15,
                        color: Colors.white,
                      ),
                      Text(
                        "\$2000",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        "OVERDUE",
                        style: TextStyle(fontSize: 7, color: Colors.white),
                      )
                    ],
                  )),
              Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.pink[400],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.money_off,
                        size: 15,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Text(
                          "\$2000",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Text(
                          "UNPAID",
                          style: TextStyle(fontSize: 7, color: Colors.white),
                        ),
                      )
                    ],
                  )),
            ],
          ),
          Container(
              width: 400,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Column(
                        children: [
                          Text(
                            "\$4,000",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "Monthly Rent(Main Street)",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      Container(
                          width: 50,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.lightGreenAccent[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.paid_outlined,
                                size: 10,
                                color: Colors.lightGreenAccent[500],
                              ),
                              Text(
                                "PAID",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.lightGreenAccent[500]),
                              )
                            ],
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Column(
                        children: [
                          Text(
                            "02-02-2019",
                            style:
                            TextStyle(color: Colors.black45, fontSize: 8),
                          ),
                          Text(
                            "DUE DATE",
                            style: TextStyle(color: Colors.grey, fontSize: 5),
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          Text(
                            "0 days",
                            style:
                            TextStyle(color: Colors.black45, fontSize: 8),
                          ),
                          Text(
                            "DAYS OVERDUE",
                            style: TextStyle(color: Colors.grey, fontSize: 5),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ClipOval(
                              child: Image.asset(
                                "assets/images/_3b3ztop.jpg",
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ))
                        ],
                      )
                    ],
                  )
                ],
              )),
          Container(
              width: 400,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Column(
                        children: [
                          Text(
                            "\$2,000",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Monthly Rent(joanne Park)",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      Container(
                          width: 50,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.lightGreenAccent[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.paid_outlined,
                                size: 10,
                                color: Colors.lightGreenAccent[500],
                              ),
                              Text(
                                "PAID",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.lightGreenAccent[500]),
                              )
                            ],
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Column(
                        children: [
                          Text(
                            "02-02-2019",
                            style:
                            TextStyle(color: Colors.black45, fontSize: 8),
                          ),
                          Text(
                            "DUE DATE",
                            style: TextStyle(color: Colors.grey, fontSize: 5),
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          Text(
                            "0 days",
                            style:
                            TextStyle(color: Colors.black45, fontSize: 8),
                          ),
                          Text(
                            "DAYS OVERDUE",
                            style: TextStyle(color: Colors.grey, fontSize: 5),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ClipOval(
                              child: Image.asset(
                                "assets/images/aycabron.jpeg",
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ))
                        ],
                      )
                    ],
                  )
                ],
              )),
          Container(
            width: 400,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      size: 20,
                      color: Colors.black45,
                    )
                  ],
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.message,
                      size: 20,
                      color: Colors.black45,
                    )
                  ],
                ),
                Container(
                  width: 30, // Adjust the size as needed
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue, // Background color of the circle
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.import_export_outlined,
                      size: 20,
                      color: Colors.black45,
                    )
                  ],
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.widgets,
                      size: 20,
                      color: Colors.black45,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}