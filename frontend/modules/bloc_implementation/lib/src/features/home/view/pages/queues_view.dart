import 'dart:io';
import 'package:bloc_implementation/src/features/home/bloc/home_bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QueuesView extends StatelessWidget {
  const QueuesView({super.key});

  static Route<QueuesView> route({required HomeBloc bloc}) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider.value(
          value: bloc..add(const QueuesDataRequested()),
          child: const QueuesView(),
        );
      },
    );
  }

  Future<AndroidDeviceInfo> getAndroidDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();

    return deviceInfo.androidInfo;
  }

  Future<IosDeviceInfo> getIOSDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();

    return deviceInfo.iosInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Queues',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) =>
              previous != current && current is ViewingQueues,
          builder: (context, state) {
            // Check for state is viewing queues
            if (state is! ViewingQueues) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                if (Platform.isAndroid)
                  FutureBuilder<AndroidDeviceInfo>(
                    future: getAndroidDeviceInfo(),
                    builder: (context, snapshot) {
                      return Text('Android Device ${snapshot.data?.id}');
                    },
                  ),
                if (Platform.isIOS)
                  FutureBuilder<IosDeviceInfo>(
                    future: getIOSDeviceInfo(),
                    builder: (context, snapshot) {
                      return Text(
                        'iOS Device ${snapshot.data?.identifierForVendor}',
                      );
                    },
                  ),
                const SizedBox(height: 24),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.queues.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Queue Id: '
                                  '${state.queues[index].id.hexString}',
                                ),
                                Text(
                                  'Todo Id: '
                                  '${state.queues[index].todoId}',
                                ),
                                Text(
                                  'Operation: '
                                  '${state.queues[index].operationType}',
                                ),
                              ],
                            ),
                            if (state.queues[index].lastSyncedAt != null)
                              const Icon(Icons.check_rounded)
                            else
                              const Icon(Icons.sync),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
