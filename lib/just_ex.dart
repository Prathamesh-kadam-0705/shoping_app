import 'package:flutter/material.dart';

class JustEx extends StatefulWidget{

  JustEx({super.key});
  State<JustEx> createState() => JustExState();
}

class JustExState extends State<JustEx>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,        // stays visible
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Title'),
              background: Column(
                children: [
                  SizedBox(height: 60),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        10,
                            (i) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Chip(label: Text('Item $i')),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(title: Text('Item $index')),
              childCount: 50,
            ),
          ),
        ],
      ),
    );

  }
}