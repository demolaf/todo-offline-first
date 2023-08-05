import 'package:device_info_plus/device_info_plus.dart';
import 'package:todo_bloc/src/core/global_imports.dart';

class DeviceInfoView extends StatelessWidget {
  const DeviceInfoView({super.key});

  static Route<DeviceInfoView> route() {
    return MaterialPageRoute(
      builder: (context) {
        return const DeviceInfoView();
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
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<AndroidDeviceInfo>(
              future: getAndroidDeviceInfo(),
              builder: (context, snapshot) {
                return Text('Android Device ${snapshot.data?.id}');
              },
            ),
            const SizedBox(height: 24),
            FutureBuilder<IosDeviceInfo>(
              future: getIOSDeviceInfo(),
              builder: (context, snapshot) {
                return Text('iOS Device ${snapshot.data?.identifierForVendor}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
