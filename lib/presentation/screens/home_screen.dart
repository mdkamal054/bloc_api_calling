import 'package:bloc_api/data/model/post_model.dart';
import 'package:bloc_api/logic/cubit/post_cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/post_cubit/post_state.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test API"),
      ),
      body: SafeArea(

        // so when we have to show some widgets on screen like snakcbar or move to next screen we have to use blockconsumer for that
        // block Builder
        child: BlocConsumer<PostCubit,PostState> (
          listener: (context , state){
            // here we can show snackbar or go to next screen
            
            if(state is PostErrorState){
              
              SnackBar snackBar = SnackBar(content: Text(state.error),
              backgroundColor: Colors.red,);

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              
            }
            
          },
          builder: (context,state){

            if(state is PostLoadingState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if(state is PostLoadedState){

              return buildPostListView(state.posts);

            }
            return Center(
              child: Text("An Error Occured"),
            );

          }
        ),
      ),
    );
  }

  Widget buildPostListView(List<PostModel> posts){
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context,index){

        PostModel post = posts[index];

        return ListTile(
          title: Text(post.id.toString(),style: const TextStyle(color: Colors.black,fontSize: 14),),
          subtitle: Text(post.title.toString()),
        );
      },
    );
  }
}
