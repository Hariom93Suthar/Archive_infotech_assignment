import 'package:flutter/material.dart';

import '../../Utils/userdata.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0C1446), Color(0xFF0F1E35)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0C1446), Color(0xFF0F1E35)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 30),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white12,
                      ),
                      child: Center(child: Icon(Icons.arrow_back,color: Colors.white,),),
                    ),
                  ),
                  SizedBox(width: 80,),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text("Leaderboard",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                  Spacer()
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // 🥉 3rd Place - Willium
                Column(
                  children: [
                    _buildCircle(borderColor: Colors.lightBlue, rank: 3, isCenter: false),
                    const SizedBox(height: 10),
                    Container(
                      width: 120,
                      height: 120,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: const [
                          Text(
                            "Willium",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "340",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "@username",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // 🥇 1st Place - Center with Crown and Podium
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 240,
                          width: 180,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF343434), Color(0xFF2E2E2E)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 190),
                          child: _buildCircle(borderColor: Colors.amber, rank: 1, isCenter: true),
                        ),
                      ],
                    ),
                  ],
                ),

                // 🥈 2nd Place - Smith
                Column(
                  children: [
                    _buildCircle(borderColor: Colors.green, rank: 2, isCenter: false),
                    const SizedBox(height: 10),
                    Container(
                      width: 120,
                      height: 120,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: const [
                          Text(
                            "Smith",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "340",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "@username",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return _buildUserTile(
                    user['name'].toString(),
                    user['points'] as int,
                    user['rank'] as int,
                    up: user['up'] as bool? ?? true,
                    imagePath: user['image'].toString(),
                  );

                },
              ),
            )
          ],
        ),
      ),
    );

  }
}

Widget _buildCircle({required Color borderColor, required int rank, required bool isCenter}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: isCenter ? 120 : 85,
        height: isCenter ? 120 : 85,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: 3),
        ),
      ),
      Positioned(
        bottom: -1,
        child: Transform.rotate(
          angle: 0.785398,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: borderColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Transform.rotate(
                angle: -0.785398,
                child: Text(
                  '$rank',
                  style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
      if (isCenter)
        const Positioned(
          top: -13,
          child: Icon(Icons.emoji_events, color: Colors.amber, size: 35),
        ),
    ],
  );
}


Widget _buildUserTile(String name, int points, int rank,
    {bool up = true, String imagePath = 'assets/user.png'}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white.withOpacity(0.1)),
      borderRadius: BorderRadius.circular(12),
      color: Colors.transparent,
    ),
    child: ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Rank circle
          Container(
            width: 26,
            height: 26,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF1F2A40), // dark background
            ),
            alignment: Alignment.center,
            child: Text(
              '$rank',
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(width: 10),

          // Profile image with circular border
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.amber, width: 2),
            ),
            child: ClipOval(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      subtitle: Row(
        children: [
          Text(
            "$points",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(width: 5,),
          Text(
            "Points",
            style: const TextStyle(
              color: Colors.amber,
              fontSize: 13,
            ),
          ),
        ],
      ),
      trailing: Icon(
        up ? Icons.arrow_drop_up : Icons.arrow_drop_down,
        color: up ? Colors.green : Colors.red,
        size: 30,
      ),
    ),
  );
}
