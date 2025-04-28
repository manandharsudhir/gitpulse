import 'package:gitpulse/features/dashboard/model/log_model.dart';
import 'package:gitpulse/features/dashboard/repo/dashboard_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gitpulse/core/models/response/response_status.dart';
import 'package:uuid/uuid.dart';

final logsProvider =
    StateNotifierProvider<LogsProvider, ResponseStatus<List<LogModel>>>((ref) {
  return LogsProvider(ref);
});

class LogsProvider extends StateNotifier<ResponseStatus<List<LogModel>>> {
  LogsProvider(this.ref) : super(const ResponseStatus.initial());
  final Ref ref;
  List<LogModel> logs = [];

  Future<void> getLogs() async {
    try {
      if ((state is! ResponseStatusSuccess)) {
        state = const ResponseStatus.progress();
      }
      final response = await DashboardRepo.instance.getLogs();
      logs = response;
      state = ResponseStatus.success(data: logs);
    } catch (e) {
      state = ResponseStatus.error(e.toString());
    }
  }

  Future<void> addLogs({
    required String projectName,
    required String subtitle,
    required int hour,
  }) async {
    try {
      state = const ResponseStatus.progress();
      logs.add(LogModel(
        id: Uuid().v4(),
        description: subtitle,
        hoursLogged: hour,
      ));
      state = ResponseStatus.success(data: logs);
    } catch (e) {
      state = ResponseStatus.error(e.toString());
    }
  }

  Future<void> deleteLog({
    required String uuid,
  }) async {
    try {
      state = const ResponseStatus.progress();
      logs.removeWhere((e) => e.id == uuid);
      state = ResponseStatus.success(data: logs);
    } catch (e) {
      state = ResponseStatus.error(e.toString());
    }
  }

  Future<void> editLog({
    required String uuid,
    required String projectName,
    required String subtitle,
    required int hour,
  }) async {
    try {
      state = const ResponseStatus.progress();
      logs.map((e) {
        if (e.id == uuid) {
          return e.copyWith(
            description: subtitle,
            hoursLogged: hour,
          );
        } else {
          return e;
        }
      });

      state = ResponseStatus.success(data: logs);
    } catch (e) {
      state = ResponseStatus.error(e.toString());
    }
  }
}
