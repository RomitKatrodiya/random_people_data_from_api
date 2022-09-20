import 'package:flutter/material.dart';

import '../helpers/user_api_helper.dart';
import '../modals/user_modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          )
        ],
        leading: const Icon(Icons.menu, color: Colors.black),
        centerTitle: true,
        title: const Text(
          "User Details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          setState(() {});
        },
        backgroundColor: Colors.grey.shade400,
        child: const Icon(Icons.refresh, color: Colors.black),
      ),
      body: FutureBuilder(
        future: UserAPI.userAPI.fetchUserAPI(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User? data = snapshot.data;
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                          )
                        ]),
                    margin: const EdgeInsets.only(top: 100),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey.shade400,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                data!.image,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "${data.title} ${data.firstName} ${data.lastName}",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        customRow("Username", data.userName),
                        customRow("Email", data.email),
                        customRow("Phone", data.phone),
                        customRow("Gender", data.gender),
                        customRow("Age", data.age),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            "- Address - \n\n${data.address}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  customRow(name, data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "$name",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.withOpacity(0.7),
                ),
              ),
              const Spacer(),
              Text(
                "$data",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Divider(),
        ],
      ),
    );
  }
}
