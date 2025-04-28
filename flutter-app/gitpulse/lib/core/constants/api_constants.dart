class ApiConstants {
  static String url = 'https://api.oneaccord.cc/api';
  static String devUrl = 'https://api.dev.oneaccord.cc/api';
  static String stagingUrl = 'https://api.staging.oneaccord.cc/api';

  static String baseurl = url;

  static const String version1 = '/v1';
  static const String version2 = '/v2';
  static const String login = '$version1/user/auth/login';
  static const String refresh = '$version1/user/auth/refresh';
  static const String signup = '$version1/user/auth/register';
  static String verifyOtpVolunteer({required String otp}) =>
      '$version1/user/auth/register/$otp/verify';

  static const String requestResetPassword =
      '$version1/user/auth/reset-password';

  static String socialAuth(
          {required String provider, required String accessToken}) =>
      '$version1/user/auth/oauth/$provider/$accessToken/verify';
  static const String getMe = '$version1/user/me';
  static const String interest = '$version1/interest';
  static const String nearbyInterest = '$version1/interest/nearby';
  static const String nearbyInterestByArea = '$version1/interest/nearby-map';
  static const String website = '$version1/website';
  static const String websiteById = '$version1/website/id';
  static const String nearby = '$version1/website/nearby';
  static const String tags = '$version1/interest/tags';
  static const String sources = '$version1/interest/source';
  static const String book = '$version1/interest/activity/book';
  static const String series = '$version1/interest/activity/series';
  static const String share = '$version1/interest/activity/share';
  static const String changePassword = '$version1/user/me/password';
  static const String changeUserEmailRequest =
      '$version1/user/auth/change-email';
  static const String verifyRegistration =
      '$version1/content/events/verify-registration';
  static const String prayerRequest = '$version1/content/contact';
  static const String contactSupport = '$version1/content/contact/support';
  static const String surveyFormsList = '$version1/content/form/survey';
  static const String surveyFormById = '$version1/content/form';
  static const String submitSurvey = '$version1/content/form/submit';
  static String studiedLesson(
          {required String interestId, required String seriesId}) =>
      '$version1/interest/activity/$interestId/study/$seriesId';

  static String studyRequest({
    required String interestId,
  }) =>
      '$version1/interest/activity/$interestId/study';

  static String baptismRequest({
    required String interestId,
  }) =>
      '$version1/interest/activity/$interestId/baptism';

  static const String studyTypes = '$version1/interest/disciple/study-types';

  static String addNotes({
    required String interestId,
  }) =>
      '$version1/interest/$interestId/notes';

  static const String getLessonSeries =
      "$version1/interest/disciple/series/study";
  static String attendedStudy({required String interestId}) =>
      "$version1/interest/activity/$interestId/attended/study";

  static String getHistory({required String interestId}) =>
      "$version1/interest/$interestId/history";
  static String getInterestNotes({required String interestId}) =>
      "$version1/interest/$interestId/notes";
  static String getSubmittedSurveyDetailsById({required String submissionId}) =>
      "$version1/content/form/submission/$submissionId";

  static const String clentToken = '$version1/user/client-token';

  static String individualNotes({
    required String noteId,
  }) =>
      '$version1/interest/$noteId/notes';

  static const String notification = "$version1/rts/notify";
  static const String team = "$version1/user/team";
  static String teamById(String memberId) => "$version1/user/$memberId";
  static const String addTeam = "$version1/website/user";
  static const String verifyTeamMemberExists = "$version1/user/email/verify";

  static const String availableRoles = "$version1/user/available-roles";
  static const String availablePositions = "$version1/user/available-positions";

  static String reinvite({required String userId}) =>
      "$version1/user/invite/$userId/reinvite";

  static const String deleteUser = "$version1/user/delete";
  static const String userArchive = "$version1/user/archive";
  static String userById(String id) => "$version1/user/$id";

  static const String uploadImage = "$version2/content/assets/upload";
  static const String members = "$version1/user/team/members";
  static String trainee({required String memberId}) =>
      "$version1/user/team/members/$memberId/trainee";

  static String mentors({required String interestId}) =>
      "$version1/interest/$interestId/mentors";

  static String markNotificationAsRead({required String notificationId}) =>
      "$version1/rts/read/$notificationId";

  static const String markAllAsRead = "$version1/rts/read/all";
  static const String updateNotificationSettings =
      "$version1/user/me/notification/preferences";

  static const String eventCategories = '$version1/content/events';
  static String interestLog({required String interestId}) =>
      '$version1/interest/activity/$interestId/logs';

  static String getAttendance(
          {required String interestId, required String lessonId}) =>
      '$version1/interest/activity/$interestId/attendance/$lessonId';

  static String addAttendance({required String interestId}) =>
      '$version1/interest/activity/$interestId/attendance';

  static String attended(
          {required String interestId, required String attendedOn}) =>
      '$version1/interest/activity/$interestId/attended/$attendedOn';

  static String baptismPreparation({
    required String interestId,
    required String seriesId,
  }) =>
      '$version1/interest/activity/$interestId/baptism-preparation/$seriesId';

  static String addBaptismalPrepartion({required String interestId}) =>
      '$version1/interest/activity/$interestId/baptism-preparation';
}
