import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocarchitecture/data/model/PostModel.dart';
import 'package:flutterblocarchitecture/data/repository/user_repository.dart';
import 'package:flutterblocarchitecture/features/users/pagination/posts_bloc.dart';
import 'package:flutterblocarchitecture/features/users/pagination/posts_event.dart';
import 'package:flutterblocarchitecture/features/users/pagination/posts_state.dart';


class PagingPage extends StatelessWidget {
  const PagingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: RepositoryProvider(
        create: (context) => UserRepository(),
        child: BlocProvider(
          create: (context) => PostsBloc(context.read<UserRepository>())
            ..add(PostsLoadedEvent()),
          child: BlocBuilder<PostsBloc, PostsState>(
            builder: (context, state) {
              if (state is PostsInitial) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (state is PostsLoadedState) {
                final List<PostModel> posts = state.posts;
                return ListView.builder(
                  controller: context.read<PostsBloc>().scrollController,
                  itemCount: context.read<PostsBloc>().isLoadMore
                      ? posts.length + 1
                      : posts.length,
                  itemBuilder: (context, index) {
                    if (index >= posts.length) {
                      return Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        child: const CircularProgressIndicator.adaptive(),
                      );
                    } else {
                      final post = posts[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0).copyWith(
                          bottom: 0,
                        ),
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(post.id.toString()),
                            ),
                            title: Text(post.title!),
                            subtitle: Text(post.body!),
                          ),
                        ),
                      );
                    }
                  },
                );
              }
              if (state is PostsErrorState) {
                return Center(
                  child: SelectableText(state.error),
                );
              } else {
                return const Center(child: Text("No Posts"));
              }
            },
          ),
        ),
      ),
    );
  }
}
