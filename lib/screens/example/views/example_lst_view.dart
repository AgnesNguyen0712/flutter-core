import 'package:flutter_core/core/error/exceptions.dart';
import 'package:flutter_core/core/widgets/bottom_loader_widget.dart';
import 'package:flutter_core/core/widgets/shimmer_widget.dart';
import 'package:flutter_core/domain/entities/example.dart';
import 'package:flutter_core/screens/example/blocs/example_lst_view_bloc.dart';
import 'package:flutter_core/screens/example/blocs/example_lst_view_event.dart';
import 'package:flutter_core/screens/example/blocs/example_lst_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExampleLstView extends StatefulWidget {
  @override
  _ExampleLstViewState createState() => _ExampleLstViewState();
}

class _ExampleLstViewState extends State<ExampleLstView> {
  final scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  late ExampleLstViewBloc _exampleLstViewBloc;

  @override
  void initState() {
    super.initState();
    this.scrollController.addListener(onScroll);
    this._exampleLstViewBloc = BlocProvider.of<ExampleLstViewBloc>(context);
    if (!(this._exampleLstViewBloc.state is ExampleLstViewLoaded)) {
      this._exampleLstViewBloc.add(LoadExampleLstView()); 
    }
  }

  @override
  void dispose() {
    this.scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    final maxScroll = this.scrollController.position.maxScrollExtent;
    final currentScroll = this.scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      this._exampleLstViewBloc.add(LoadMoreExampleLstView());
    }
  }

  void _refreshExamples() {
    this._exampleLstViewBloc.add(RefreshExampleLstView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          this._refreshExamples();
        },
        child: BlocBuilder<ExampleLstViewBloc, ExampleLstViewState>(
          builder: (context, state) {
            if (state is ExampleLstViewLoaded) {
              return ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.examples.length
                      ? BottomLoaderWidget()
                      : this._buildExampleItem(state.examples[index]);
                },
                separatorBuilder: (context, index) {
                  return Divider(color: Theme.of(context).colorScheme.secondary);
                },
                itemCount: state.hasReachedMax
                    ? state.examples.length
                    : state.examples.length + 1,
                controller: scrollController,
              );
            } else if (state is ExampleLstViewFailure) {
              return Center(
                child: Text(state.message),
              );
            }
            else if (state is ExampleLstViewLoading) {
              return ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return this._buildExampleItemShimmer();
                  },
                  separatorBuilder: (context, index) {
                    return Divider(color: Theme.of(context).colorScheme.secondary);
                  },
                  itemCount: 12
              );
            }
            else {
              throw new InvalidStateException();
            }
          },
        ),
      ) ,
    )
     ;
  }

  Widget _buildExampleItemShimmer() {
    return ListTile(
      leading: ShimmerWidget.rectangular(height: 16, width: 64,),
      title: ShimmerWidget.rectangular(height: 16, width: 128,),
      subtitle: ShimmerWidget.rectangular(height: 16,),
    );
  }

  Widget _buildExampleItem(Example example) {
    return ListTile(
      leading: Text(
        '${example.id}',
      ),
      title: Text(example.title),
      isThreeLine: true,
      subtitle: Text(example.body),
      dense: true,
    );
  }
}
