// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Padel Platform';

  @override
  String get navHome => 'Home';

  @override
  String get navTournaments => 'Tournaments';

  @override
  String get navRankings => 'Rankings';

  @override
  String get navCasual => 'Casual';

  @override
  String get navProfile => 'Profile';

  @override
  String get actionRetry => 'Retry';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get actionSend => 'Send';

  @override
  String get actionCreate => 'Create';

  @override
  String get actionCreateOne => 'Create one';

  @override
  String get filterAll => 'All';

  @override
  String get premiumLabel => 'Premium';

  @override
  String get tieBreakLabel => 'TIE-BREAK';

  @override
  String get ptsLabel => 'pts';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsLanguageArabic => 'Arabic';

  @override
  String get settingsLanguageEnglish => 'English';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get themeSystem => 'System default';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get settingsLogOut => 'Log out';

  @override
  String get deleteAccountTitle => 'Delete Account';

  @override
  String get deleteAccountConfirm =>
      'Are you sure you want to permanently delete your account? This action is immediate and cannot be undone, and all your data and matches will be deleted.';

  @override
  String get deleteAccountSuccess =>
      'Your account has been deleted successfully.';

  @override
  String get deleteAccountLoading => 'Deleting account...';

  @override
  String homeWelcomeBack(String name) {
    return 'Welcome back, $name';
  }

  @override
  String get homeUnranked => 'Unranked';

  @override
  String homeLevelPoints(String level, int points) {
    return '$level • $points season pts';
  }

  @override
  String get homeLiveNow => 'Live now';

  @override
  String get homeSeeAll => 'See all';

  @override
  String get homeNoLiveTournaments => 'No tournaments live right now.';

  @override
  String get fieldPassword => 'Password';

  @override
  String get errorPasswordRequired => 'Password is required';

  @override
  String get actionLogIn => 'Log in';

  @override
  String get fieldFullName => 'Full name';

  @override
  String get errorNameRequired => 'Name is required';

  @override
  String get fieldPhoneOptional => 'Phone (optional)';

  @override
  String get errorPasswordLength => 'At least 8 characters';

  @override
  String get fieldConfirmPassword => 'Confirm password';

  @override
  String get errorPasswordsMismatch => 'Passwords do not match';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get emptyNotificationsTitle => 'No notifications yet';

  @override
  String get emptyNotificationsMessage =>
      'You\'re all caught up — new notifications will show up here.';

  @override
  String get casualMatchesTitle => 'Casual matches';

  @override
  String get casualFilterLookingForMatch => 'Looking for a match';

  @override
  String get casualFilterLookingForPartner => 'Looking for a partner';

  @override
  String get casualFilterNeed1 => 'Need 1 more';

  @override
  String get casualFilterNeed2 => 'Need 2 more';

  @override
  String get casualFilterNeed3 => 'Need 3 more';

  @override
  String get emptyCasualTitle => 'No casual matches nearby';

  @override
  String get emptyCasualMessage =>
      'Be the first to set one up and invite players to join.';

  @override
  String get joinRequestSent => 'Join request sent.';

  @override
  String get statusClosed => 'Closed';

  @override
  String labelLevel(String level) {
    return 'Level $level';
  }

  @override
  String labelSide(String side) {
    return 'Side: $side';
  }

  @override
  String byCreator(String name) {
    return 'By $name';
  }

  @override
  String get actionRequested => 'Requested';

  @override
  String get actionJoin => 'Join';

  @override
  String get createMatchTitle => 'Create a casual match';

  @override
  String get fieldMatchType => 'Match type';

  @override
  String get fieldDateTime => 'Date & time';

  @override
  String get selectFutureDateTime => 'Select a future date & time';

  @override
  String get errorPickFutureDateTime => 'Pick a date and time in the future';

  @override
  String get fieldRequiredLevelOptional => 'Required level (optional)';

  @override
  String get fieldPreferredSideOptional => 'Preferred side (optional)';

  @override
  String get fieldNotesOptional => 'Notes (optional)';

  @override
  String get actionCreateMatch => 'Create match';

  @override
  String get coachesTitle => 'Coaches';

  @override
  String get emptyCoachesTitle => 'No coaches available';

  @override
  String get emptyCoachesMessage => 'Check back soon for available coaches.';

  @override
  String coachPricePerHourLong(String price) {
    return '$price / hour';
  }

  @override
  String coachPricePerHourShort(String price) {
    return '$price/hr';
  }

  @override
  String get statusUnavailable => 'Unavailable';

  @override
  String get sectionAbout => 'About';

  @override
  String get sectionSpecialties => 'Specialties';

  @override
  String get rankingsTitle => 'Rankings';

  @override
  String get emptyRankingsTitle => 'No rankings yet';

  @override
  String get emptyRankingsMessage =>
      'Rankings will appear here once players start earning points.';

  @override
  String get liveMatchTitle => 'Live match';

  @override
  String get vsLabel => 'vs';

  @override
  String get currentGame => 'Current game';

  @override
  String gamesScore(int teamOne, int teamTwo) {
    return '$teamOne - $teamTwo games';
  }

  @override
  String setsScore(int teamOne, int teamTwo) {
    return '$teamOne - $teamTwo sets';
  }

  @override
  String get matchCompleted => 'Match completed';

  @override
  String teamWon(String team) {
    return '$team won';
  }

  @override
  String get rankingEligible => 'Ranking eligible';

  @override
  String get venueTba => 'Venue TBA';

  @override
  String get categoriesSection => 'Categories';

  @override
  String teamsCount(int active, int max) {
    return '$active/$max teams';
  }

  @override
  String feeSuffix(String fee) {
    return ' • $fee fee';
  }

  @override
  String get statusFull => 'Full';

  @override
  String get tournamentsTitle => 'Tournaments';

  @override
  String get filterOpen => 'Open';

  @override
  String get filterLive => 'Live';

  @override
  String get filterCompleted => 'Completed';

  @override
  String get emptyTournamentsTitle => 'No tournaments here';

  @override
  String get emptyTournamentsMessage =>
      'Try a different filter or check back soon.';

  @override
  String get statusDraft => 'Draft';

  @override
  String get statusRegistrationOpen => 'Registration open';

  @override
  String get statusRegistrationClosed => 'Registration closed';

  @override
  String get statusOngoing => 'Ongoing';

  @override
  String get statusCompleted => 'Completed';

  @override
  String get statusCancelled => 'Cancelled';

  @override
  String get achievementsSection => 'Achievements';

  @override
  String get statLevel => 'Level';

  @override
  String get statRating => 'Rating';

  @override
  String get statSeasonPts => 'Season pts';

  @override
  String get statXp => 'XP';

  @override
  String get actionFollowing => 'Following';

  @override
  String get actionFollow => 'Follow';

  @override
  String get tooltipRespect => 'Respect';

  @override
  String get tooltipChallenge => 'Challenge';

  @override
  String challengeSentTo(String name) {
    return 'Challenge sent to $name';
  }

  @override
  String challengeTitle(String name) {
    return 'Challenge $name';
  }

  @override
  String get hintAddMessage => 'Add a message (optional)';

  @override
  String get failureSessionExpired => 'Session expired.';

  @override
  String get failureNoInternet => 'No internet connection.';

  @override
  String get failureServerError => 'Something went wrong on our end.';

  @override
  String get failureUnknown => 'An unexpected error occurred.';

  @override
  String get failureRequestCancelled => 'Request cancelled.';

  @override
  String get failureSecureConnectionFailed => 'Secure connection failed.';

  @override
  String get failureValidationFailed => 'Validation failed.';

  @override
  String get failureRequestFailed => 'Request failed.';

  @override
  String get failureInvalidCredentials => 'Wrong email or password.';

  @override
  String get failurePremiumRequired => 'This is a Premium feature.';

  @override
  String get failureCoachOnly => 'Only coach accounts can do this.';

  @override
  String get failurePlayerProfileRequired => 'This needs a player profile.';

  @override
  String get failureStaffOnly => 'Only tournament staff can do this.';

  @override
  String get failureForbidden => 'You don\'t have access to this.';

  @override
  String get failureAccountInactive => 'This account is inactive.';

  @override
  String get failureNotFound => 'We couldn\'t find that.';

  @override
  String get failureRateLimited => 'Too many attempts. Try again in a moment.';

  @override
  String get failureProviderUnavailable => 'Not available yet.';

  @override
  String get actionClose => 'Close';

  @override
  String get actionConfirm => 'Confirm';

  @override
  String get actionSave => 'Save';

  @override
  String get actionEdit => 'Edit';

  @override
  String get actionDelete => 'Delete';

  @override
  String get actionAccept => 'Accept';

  @override
  String get actionDecline => 'Decline';

  @override
  String get actionRefresh => 'Refresh';

  @override
  String get actionViewAll => 'View all';

  @override
  String get actionLearnMore => 'Learn more';

  @override
  String get actionGoPremium => 'Go Premium';

  @override
  String get actionBack => 'Back';

  @override
  String get actionSearch => 'Search';

  @override
  String get actionApply => 'Apply';

  @override
  String get actionReset => 'Reset';

  @override
  String get actionContinue => 'Continue';

  @override
  String get actionLeave => 'Leave';

  @override
  String get actionOpen => 'Open';

  @override
  String get stateEmptyTitle => 'Nothing here yet';

  @override
  String get stateOfflineTitle => 'You\'re offline';

  @override
  String get stateOfflineMessage => 'Check your connection and try again.';

  @override
  String get stateOfflineBanner => 'Offline — showing what we have';

  @override
  String get stateErrorTitle => 'Something went wrong';

  @override
  String get stateComingSoonTitle => 'Coming soon';

  @override
  String get stateComingSoonPayments =>
      'Online payments are coming soon. Nothing was charged.';

  @override
  String get stateComingSoon3d =>
      '3D identity generation isn\'t available yet. We\'ll let you know when it is.';

  @override
  String get stateInsufficientDataTitle => 'Not enough data yet';

  @override
  String get statePremiumTitle => 'Unlock with Premium';

  @override
  String get statePremiumMessage =>
      'Premium adds insights and analytics. It never affects your rating or ranking.';

  @override
  String progressOf(int current, int target) {
    return '$current/$target';
  }

  @override
  String get valueDash => '—';

  @override
  String get liveBadge => 'LIVE';

  @override
  String get liveRealtime => 'Live · realtime';

  @override
  String liveUpdatingEvery(int seconds) {
    return 'Live · updating every $seconds s';
  }

  @override
  String get correctedToast => 'Score corrected by the scorekeeper';

  @override
  String get metricSkillRating => 'Skill Rating';

  @override
  String get metricSeasonPoints => 'Season Points';

  @override
  String get metricXp => 'XP';

  @override
  String metricPosition(int position) {
    return '#$position';
  }

  @override
  String get metricLevel => 'Level';

  @override
  String get metricUnranked => 'Unranked';

  @override
  String movementUp(int n) {
    return 'Up $n';
  }

  @override
  String movementDown(int n) {
    return 'Down $n';
  }

  @override
  String get movementSame => 'No change';

  @override
  String get competitionRanked => 'VERIFIED · RANKED';

  @override
  String get competitionCertified => 'OFFICIAL';

  @override
  String get competitionSocial => 'SOCIAL';

  @override
  String get officialNote =>
      'Only verified results from ranked tournaments move your Skill Rating and Season Ranking.';

  @override
  String get casualNote => 'Casual play never affects your rating or ranking.';

  @override
  String get rarityCommon => 'Common';

  @override
  String get rarityRare => 'Rare';

  @override
  String get rarityEpic => 'Epic';

  @override
  String get rarityLegendary => 'Legendary';

  @override
  String xpReward(int xp) {
    return '+$xp XP';
  }

  @override
  String get newCoach => 'New coach';

  @override
  String reviewsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reviews',
      one: '1 review',
    );
    return '$_temp0';
  }

  @override
  String get timeNow => 'now';

  @override
  String timeInMinutes(int n) {
    return 'in ${n}m';
  }

  @override
  String timeMinutesAgo(int n) {
    return '${n}m ago';
  }

  @override
  String timeInHours(int n) {
    return 'in ${n}h';
  }

  @override
  String timeHoursAgo(int n) {
    return '${n}h ago';
  }

  @override
  String timeInDays(int n) {
    return 'in ${n}d';
  }

  @override
  String timeDaysAgo(int n) {
    return '${n}d ago';
  }

  @override
  String get dayToday => 'Today';

  @override
  String get dayYesterday => 'Yesterday';

  @override
  String get navCompete => 'Compete';

  @override
  String get navPlay => 'Play';

  @override
  String homeGreeting(String name) {
    return 'Hi, $name';
  }

  @override
  String get homeLiveYouAreIn => 'You\'re on court';

  @override
  String get homeNextMatch => 'Your next match';

  @override
  String get homeLiveFollowing => 'Players you follow';

  @override
  String get homeMyTournaments => 'My tournaments';

  @override
  String get homeYourSeason => 'Your season';

  @override
  String get homeStats => 'Your numbers';

  @override
  String get homeLatestAchievement => 'Latest achievement';

  @override
  String get homeRecommendedTournaments => 'Tournaments for you';

  @override
  String get homeCasualOpportunities => 'Games looking for players';

  @override
  String get homeRecommendedPartner => 'Suggested partner';

  @override
  String get homeRecommendedCoach => 'Coach for you';

  @override
  String get homeUpcomingTraining => 'Upcoming training';

  @override
  String homePendingRequests(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count partner requests waiting',
      one: '1 partner request waiting',
    );
    return '$_temp0';
  }

  @override
  String get homeReviewRequests => 'Review';

  @override
  String get homeAiDailyBrief => 'Daily brief';

  @override
  String get homePremiumTeaserTitle => 'Your game, explained';

  @override
  String get homePremiumTeaserBody =>
      'Daily briefs, advanced analytics and a 3D athlete identity — built only from your real matches.';

  @override
  String get homeInsufficientRanking =>
      'Play verified ranked matches to appear on the season board.';

  @override
  String get homeInsufficientGeneric =>
      'We\'ll fill this in once there\'s enough real data.';

  @override
  String get homeEmptyTitle => 'Your season starts here';

  @override
  String get homeEmptyMessage =>
      'Join a tournament or a casual game to fill your feed.';

  @override
  String get homeFindTournament => 'Find a tournament';

  @override
  String get matchVs => 'vs';

  @override
  String get matchTbd => 'To be decided';

  @override
  String get matchBye => 'Bye';

  @override
  String matchCourt(String name) {
    return 'Court $name';
  }

  @override
  String matchSetLabel(int n) {
    return 'Set $n';
  }

  @override
  String get matchWinner => 'Winner';

  @override
  String get matchScheduled => 'Scheduled';

  @override
  String matchStartsAt(String time) {
    return 'Starts $time';
  }

  @override
  String get matchWalkover => 'Walkover';

  @override
  String get matchPendingVerification => 'Pending verification';

  @override
  String get matchVerified => 'Verified';

  @override
  String get matchServing => 'Serving';

  @override
  String get matchGames => 'Games';

  @override
  String get matchPoints => 'Points';

  @override
  String tournamentSpotsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count spots left',
      one: '1 spot left',
      zero: 'Full',
    );
    return '$_temp0';
  }

  @override
  String tournamentLiveCount(int count) {
    return '$count live';
  }

  @override
  String get tournamentFree => 'Free';

  @override
  String tournamentFee(String amount) {
    return 'Fee $amount';
  }

  @override
  String get reasonComplementarySide => 'Complementary side';

  @override
  String get reasonSimilarRating => 'Similar Skill Rating';

  @override
  String get reasonPreviousPartnership => 'Played together';

  @override
  String get reasonActiveRecently => 'Active recently';

  @override
  String get reasonSameCountry => 'Same country';

  @override
  String coachPerHour(String price) {
    return '$price / hour';
  }

  @override
  String coachNextAvailable(String time) {
    return 'Next: $time';
  }

  @override
  String coachYearsExperience(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count years',
      one: '1 year',
    );
    return '$_temp0';
  }

  @override
  String casualSpotsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count spots left',
      one: '1 spot left',
      zero: 'Full',
    );
    return '$_temp0';
  }

  @override
  String get casualRequestPending => 'Request pending';

  @override
  String get casualYouAreIn => 'You\'re in';

  @override
  String get casualYourGame => 'Your game';

  @override
  String bookingWith(String name) {
    return 'with $name';
  }

  @override
  String get achievementLocked => 'Locked';

  @override
  String achievementUnlockedOn(String date) {
    return 'Unlocked $date';
  }

  @override
  String get statMatches => 'Matches';

  @override
  String get statWins => 'Wins';

  @override
  String get statLosses => 'Losses';

  @override
  String get statWinRate => 'Win rate';

  @override
  String get statStreak => 'Streak';

  @override
  String get statTitles => 'Titles';

  @override
  String get statFinals => 'Finals';

  @override
  String get statTournaments => 'Tournaments';

  @override
  String get statSets => 'Sets won–lost';

  @override
  String get statGames => 'Games won–lost';

  @override
  String get statBestStreak => 'Best win streak';

  @override
  String get statWalkovers => 'Walkovers W–L';

  @override
  String streakWins(int n) {
    return '${n}W';
  }

  @override
  String streakLosses(int n) {
    return '${n}L';
  }

  @override
  String statLastPlayed(String date) {
    return 'Last played $date';
  }

  @override
  String get partnerMain => 'Main partner';

  @override
  String get partnerBestHistorical => 'Best historical partner';

  @override
  String get partnerMostPlayed => 'Most played with';

  @override
  String get partnerRecommended => 'Recommended partners';

  @override
  String get partnerNotSet => 'No main partner yet';

  @override
  String get partnerNotSetHint =>
      'Send a request — it becomes official when they accept.';

  @override
  String partnerUnlockHint(int count) {
    return 'Play $count verified matches with the same partner to unlock this.';
  }

  @override
  String get partnerNoHistory => 'No verified matches with a partner yet.';

  @override
  String partnerRecord(int won, int played) {
    return '$won W · $played played';
  }

  @override
  String get partnerHistory => 'Partnership history';

  @override
  String get partnerRequestAsMain => 'Request as main partner';

  @override
  String get partnerRequestSent => 'Partner request sent';

  @override
  String get partnerRemoveMain => 'End partnership';

  @override
  String get partnerRemoveMainConfirm =>
      'They\'ll stop being your main partner. You can send a new request later.';

  @override
  String get partnerRequestsTitle => 'Partner requests';

  @override
  String get partnerRequestsIncoming => 'Received';

  @override
  String get partnerRequestsOutgoing => 'Sent';

  @override
  String get partnerRequestsEmpty => 'No partner requests right now.';

  @override
  String partnerRequestFrom(String name) {
    return '$name wants you as main partner';
  }

  @override
  String partnerRequestTo(String name) {
    return 'Waiting for $name';
  }

  @override
  String get partnerRequestAccepted => 'You\'re now main partners';

  @override
  String get partnerRecommendedEmpty =>
      'Play a few verified matches and we\'ll suggest partners that fit your game.';

  @override
  String partnerRecommendedBasis(String rating, int matches) {
    return 'Based on your rating $rating and $matches verified matches';
  }

  @override
  String factRatingDiff(String value) {
    return 'Rating gap $value';
  }

  @override
  String factTogether(int wins, int matches) {
    return '$wins/$matches wins together';
  }

  @override
  String factVerifiedMatches(int count) {
    return '$count verified matches';
  }

  @override
  String factWinRate(String value) {
    return 'Win rate $value';
  }

  @override
  String factLastPlayed(String when) {
    return 'Played $when';
  }

  @override
  String get profileTabOverview => 'Overview';

  @override
  String get profileTabResults => 'Results';

  @override
  String get profileTabAchievements => 'Achievements';

  @override
  String get profileTabPartners => 'Partners';

  @override
  String get profileTabStats => 'Stats';

  @override
  String profileMemberSince(String date) {
    return 'Member since $date';
  }

  @override
  String get profileFollowers => 'Followers';

  @override
  String get profileFollowing => 'Following';

  @override
  String get profileRespects => 'Respects';

  @override
  String get profileEdit => 'Edit profile';

  @override
  String get profileContact => 'Contact (only you can see this)';

  @override
  String get profileRecentResults => 'Recent results';

  @override
  String get profileTournamentHistory => 'Tournament history';

  @override
  String get profileNoResults => 'No verified results yet';

  @override
  String get profileNoResultsHint =>
      'Official results appear here once staff verify them.';

  @override
  String get profile3dIdentity => '3D identity';

  @override
  String get profileRatingHistory => 'Rating history';

  @override
  String get profileSeasonHistory => 'Season points';

  @override
  String get profileRespectSent => 'Respect sent';

  @override
  String get resultWon => 'W';

  @override
  String get resultLost => 'L';

  @override
  String get resultRanked => 'Ranked';

  @override
  String get resultUnranked => 'Unranked';

  @override
  String resultWithPartner(String name) {
    return 'with $name';
  }

  @override
  String get placementChampion => 'Champion';

  @override
  String get placementFinalist => 'Finalist';

  @override
  String get achievementsTitle => 'Achievements';

  @override
  String achievementsProgress(int unlocked, int total) {
    return '$unlocked of $total unlocked';
  }

  @override
  String get achievementsCompetitive => 'Competitive';

  @override
  String get achievementsSocial => 'Social';

  @override
  String get achievementsPremiumShelf => 'Premium badges';

  @override
  String get achievementsPremiumNote =>
      'Premium badges are cosmetic — they never affect rating or ranking.';

  @override
  String get achievementsEmpty => 'No achievements yet';

  @override
  String get achievementAutomatic => 'Unlocks automatically';

  @override
  String get statsAdvanced => 'Advanced analytics';

  @override
  String get statsByStage => 'By stage';

  @override
  String get statsGroupStage => 'Group stage';

  @override
  String get statsKnockout => 'Knockout';

  @override
  String get statsDecidingSets => 'Deciding sets';

  @override
  String get statsByCompetition => 'Ranked vs unranked';

  @override
  String get statsPointAnalytics => 'Point analytics';

  @override
  String statsCoverage(String value) {
    return 'Coverage $value';
  }

  @override
  String get statsLimitedData => 'Limited data';

  @override
  String get statsWinnersByShot => 'Winners by shot';

  @override
  String get statsErrorsByType => 'Errors by type';

  @override
  String get statsRatingTimeline => 'Rating timeline';

  @override
  String get statsAdvancedLocked =>
      'Advanced analytics are available to Premium members on their own profile.';

  @override
  String statsRecord(int wins, int matches) {
    return '$wins/$matches';
  }

  @override
  String get followersTitle => 'Followers';

  @override
  String get followingTitle => 'Following';

  @override
  String get followersEmpty => 'Nobody here yet';

  @override
  String get ratingHistoryTitle => 'Rating history';

  @override
  String get ratingReasonOfficial => 'Official result';

  @override
  String get ratingReasonCorrection => 'Correction reversal';

  @override
  String get ratingReasonInactivity => 'Inactivity';

  @override
  String get ratingBreakdown => 'How it was calculated';

  @override
  String get ratingExpected => 'Expected score';

  @override
  String get ratingKFactor => 'Effective K';

  @override
  String get ratingOwnStrength => 'Your team strength';

  @override
  String get ratingOpponentStrength => 'Opponent strength';

  @override
  String get ratingUpset => 'Upset';

  @override
  String get ratingStage => 'Stage';

  @override
  String get ratingHistoryEmpty => 'No rating changes yet';

  @override
  String get seasonPointsTitle => 'Season points';

  @override
  String get seasonBestStageNote =>
      'Each category counts once — the best stage you reached.';

  @override
  String get challengesTitle => 'Challenges';

  @override
  String get challengesIncoming => 'Received';

  @override
  String get challengesOutgoing => 'Sent';

  @override
  String get challengesEmpty => 'No challenges';

  @override
  String challengeFrom(String name) {
    return '$name challenged you';
  }

  @override
  String challengeTo(String name) {
    return 'You challenged $name';
  }

  @override
  String get searchPlayersTitle => 'Find players';

  @override
  String get searchPlayersHint => 'Name or Player ID';

  @override
  String get searchPlayersEmpty => 'No players match your search';

  @override
  String get editProfileTitle => 'Edit profile';

  @override
  String get editProfileCompetitiveNote =>
      'Rating, level, points and XP come from verified results and can\'t be edited.';

  @override
  String get editProfilePhoto => 'Change photo';

  @override
  String get editProfilePhotoHint =>
      'JPG, PNG or WebP · up to 4 MB. Also used for your 3D identity.';

  @override
  String get editProfileSaved => 'Profile saved';

  @override
  String get fieldBio => 'Bio';

  @override
  String get fieldDateOfBirth => 'Date of birth';

  @override
  String get fieldGender => 'Gender';

  @override
  String get fieldSide => 'Playing side';

  @override
  String get changePasswordTitle => 'Change password';

  @override
  String get fieldCurrentPassword => 'Current password';

  @override
  String get fieldNewPassword => 'New password';

  @override
  String get passwordChanged =>
      'Password changed. Other sessions were signed out.';

  @override
  String get premiumTitle => 'Premium';

  @override
  String get premiumHeadline => 'Train smarter. Compete the same.';

  @override
  String get premiumSubhead =>
      'Insights and analytics built only from your real, verified matches.';

  @override
  String premiumNeverAffects(String items) {
    return 'Premium never affects your $items.';
  }

  @override
  String get premiumNeverAffectsDefault =>
      'Premium never affects your Skill Rating, Season Ranking, seeding or eligibility.';

  @override
  String get neverSkillRating => 'Skill Rating';

  @override
  String get neverSeasonRanking => 'Season Ranking';

  @override
  String get neverSeeding => 'seeding';

  @override
  String get neverEligibility => 'tournament eligibility';

  @override
  String get neverOfficialResults => 'official results';

  @override
  String get premiumFeatureAi => 'AI insights';

  @override
  String get premiumFeatureAiBody =>
      'Daily briefs, performance summaries and recommendations.';

  @override
  String get premiumFeatureAnalytics => 'Advanced analytics';

  @override
  String get premiumFeatureAnalyticsBody =>
      'Stage splits, deciding sets, shot and error breakdowns.';

  @override
  String get premiumFeature3d => '3D athlete identity';

  @override
  String get premiumFeature3dBody =>
      'A rotating 3D avatar generated from your profile photo.';

  @override
  String get premiumFeatureBadges => 'Premium badges';

  @override
  String get premiumFeatureBadgesBody =>
      'Cosmetic badges, clearly separate from competitive medals.';

  @override
  String get premiumPlansTitle => 'Choose a plan';

  @override
  String premiumPlanMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count months',
      one: '1 month',
    );
    return '$_temp0';
  }

  @override
  String get premiumPlansUnavailable =>
      'Plans will appear here once pricing is published.';

  @override
  String get premiumCheckoutSoon => 'Online payments coming soon';

  @override
  String get premiumSubscribe => 'Continue to payment';

  @override
  String get premiumActive => 'You\'re Premium';

  @override
  String premiumActiveUntil(String date) {
    return 'Active until $date';
  }

  @override
  String get premiumOpenAi => 'Open AI insights';

  @override
  String get premiumOpen3d => 'Open 3D identity';

  @override
  String get paymentsTitle => 'Payments';

  @override
  String get paymentsEmpty => 'No payments yet';

  @override
  String get paymentStatusTitle => 'Payment status';

  @override
  String get paymentWaiting =>
      'Waiting for confirmation from the payment provider…';

  @override
  String get paymentOpenCheckout => 'Open checkout';

  @override
  String get paymentSucceeded => 'Payment confirmed';

  @override
  String get paymentFailedTitle => 'Payment didn\'t go through';

  @override
  String paymentReference(String ref) {
    return 'Reference $ref';
  }

  @override
  String get paymentOnlyBackend =>
      'We only mark a payment as paid once the server confirms it.';

  @override
  String get aiTitle => 'AI insights';

  @override
  String get aiGenerate => 'Generate';

  @override
  String get aiRefresh => 'Refresh';

  @override
  String get aiWorking => 'Analysing your matches…';

  @override
  String get aiFailed => 'Couldn\'t generate this insight.';

  @override
  String get aiNotGenerated => 'Not generated yet';

  @override
  String aiCoverage(String level) {
    return 'Data coverage: $level';
  }

  @override
  String get aiCoverageNone => 'none';

  @override
  String get aiCoverageLow => 'low';

  @override
  String get aiCoverageMedium => 'medium';

  @override
  String get aiCoverageHigh => 'high';

  @override
  String aiMatchesUsed(int count) {
    return '$count matches used';
  }

  @override
  String get aiHighlights => 'Highlights';

  @override
  String get aiRecommendations => 'Recommendations';

  @override
  String get aiFacts => 'The facts';

  @override
  String aiGeneratedAt(String when) {
    return 'Generated $when';
  }

  @override
  String get aiTypePlayerInsights => 'Player insights';

  @override
  String get aiTypePerformanceSummary => 'Performance summary';

  @override
  String get aiTypePartnerRecommendation => 'Partner recommendation';

  @override
  String get aiTypeTournamentRecommendation => 'Tournament recommendation';

  @override
  String get aiTypeCoachRecommendation => 'Coach recommendation';

  @override
  String get aiTypeDevelopmentRecommendation => 'Development plan';

  @override
  String get aiTypeDailyBrief => 'Daily brief';

  @override
  String get threeDTitle => '3D identity';

  @override
  String get threeDGenerate => 'Generate my 3D identity';

  @override
  String get threeDRegenerate => 'Generate again';

  @override
  String get threeDProcessing =>
      'Building your 3D identity. This can take a few minutes.';

  @override
  String get threeDNeedsPhoto =>
      'Upload a profile photo first — your 3D identity is generated from it.';

  @override
  String get threeDUploadPhoto => 'Upload photo';

  @override
  String get threeDFailed => 'Generation failed. You can try again.';

  @override
  String get threeDEmpty => 'No 3D identity yet';

  @override
  String get bookingStatus => 'Status';

  @override
  String get bookingPrice => 'Price';

  @override
  String get bookingDuration => 'Duration';

  @override
  String get bookingLocation => 'Location';

  @override
  String get bookingTrainingType => 'Training type';

  @override
  String get bookingNotes => 'Notes';

  @override
  String get bookingFeedback => 'Coach feedback';

  @override
  String bookingXpAwarded(int xp) {
    return '+$xp XP earned';
  }

  @override
  String get bookingCancel => 'Cancel booking';

  @override
  String get bookingCancelReason => 'Reason (optional)';

  @override
  String get bookingCancelled => 'Booking cancelled';

  @override
  String get bookingCancelWindow =>
      'Confirmed bookings can be cancelled up to 24 hours before the start.';

  @override
  String get bookingReview => 'Rate this session';

  @override
  String get bookingReviewComment => 'Comment (optional)';

  @override
  String get bookingReviewThanks => 'Thanks for the review';

  @override
  String get bookingYourReview => 'Your review';

  @override
  String bookingRejectedReason(String reason) {
    return 'Rejected: $reason';
  }

  @override
  String bookingCancelledBy(String who) {
    return 'Cancelled by $who';
  }

  @override
  String get bookingByPlayer => 'player';

  @override
  String get bookingByCoach => 'coach';

  @override
  String get bookingProgressRecorded => 'Progress recorded';

  @override
  String get bookingDetailTitle => 'Training session';

  @override
  String get competeTitle => 'Compete';

  @override
  String get competeTabTournaments => 'Tournaments';

  @override
  String get competeTabLive => 'Live now';

  @override
  String get competeSearchHint => 'Search tournaments';

  @override
  String get filterRanked => 'Ranked';

  @override
  String get filterCertified => 'Official';

  @override
  String get filterSocial => 'Social';

  @override
  String get filterUpcoming => 'Upcoming';

  @override
  String get liveNowEmptyTitle => 'No matches on court right now';

  @override
  String get liveNowEmptyMessage =>
      'Live matches appear here the moment a scorekeeper starts one.';

  @override
  String get tournamentTabOverview => 'Overview';

  @override
  String get tournamentTabLive => 'Live';

  @override
  String get tournamentTabSchedule => 'Schedule';

  @override
  String get tournamentTabResults => 'Results';

  @override
  String get tournamentRules => 'Rules';

  @override
  String get tournamentAbout => 'About';

  @override
  String get tournamentOpenMap => 'Open in maps';

  @override
  String tournamentRegistrationWindow(String from, String to) {
    return 'Registration $from – $to';
  }

  @override
  String get tournamentChampion => 'Champion';

  @override
  String get tournamentNoLive =>
      'No live matches in this tournament right now.';

  @override
  String get tournamentNoSchedule => 'The schedule hasn\'t been published yet.';

  @override
  String get tournamentNoResults => 'No verified results yet.';

  @override
  String get tournamentRankedNote =>
      'Verified results here move Skill Rating and Season Points.';

  @override
  String get tournamentUnrankedNote =>
      'Results here don\'t affect Skill Rating or Season Ranking.';

  @override
  String get categoryRegister => 'Register';

  @override
  String get categoryJoinWaitlist => 'Join waitlist';

  @override
  String get categoryRegistered => 'Registered';

  @override
  String get categoryView => 'Teams, groups & bracket';

  @override
  String categoryWaitlist(int count) {
    return '$count on waitlist';
  }

  @override
  String get categoryTabTeams => 'Teams';

  @override
  String get categoryTabGroups => 'Groups';

  @override
  String get categoryTabBracket => 'Bracket';

  @override
  String get categoryNoTeams => 'No teams yet';

  @override
  String get categoryNoGroups => 'Groups will appear once the draw is made.';

  @override
  String get categoryNoBracket =>
      'The bracket is generated after the group stage.';

  @override
  String get teamWithdrawn => 'Withdrawn';

  @override
  String get teamDisqualified => 'Disqualified';

  @override
  String teamSeed(int seed) {
    return 'Seed $seed';
  }

  @override
  String get standingsPlayed => 'P';

  @override
  String get standingsWins => 'W';

  @override
  String get standingsLosses => 'L';

  @override
  String get standingsSetDiff => 'SD';

  @override
  String get standingsGameDiff => 'GD';

  @override
  String get standingsPoints => 'Pts';

  @override
  String get standingsTeam => 'Team';

  @override
  String get groupFinished => 'Finished';

  @override
  String registerTitle2(String category) {
    return 'Register for $category';
  }

  @override
  String get registerPartner => 'Partner';

  @override
  String get registerPickPartner => 'Choose a partner';

  @override
  String get registerChangePartner => 'Change partner';

  @override
  String get registerCheckEligibility => 'Checking eligibility…';

  @override
  String get registerEligible => 'You\'re eligible';

  @override
  String get registerYourIssues => 'You';

  @override
  String get registerPartnerIssues => 'Your partner';

  @override
  String get registerClosed => 'Registration is closed';

  @override
  String get registerFullWaitlist =>
      'This category is full — you\'ll join the waiting list and be promoted automatically if a spot opens.';

  @override
  String registerFeeNote(String amount) {
    return 'Registration fee $amount. Payment is confirmed by the organizer\'s system.';
  }

  @override
  String get registerSubmit => 'Confirm registration';

  @override
  String get registerDone => 'You\'re registered';

  @override
  String get registerWaitlisted => 'You\'re on the waiting list';

  @override
  String get myRegistrationsTitle => 'My registrations';

  @override
  String get myRegistrationsEmpty =>
      'You haven\'t registered for a tournament yet';

  @override
  String get registrationCancel => 'Cancel registration';

  @override
  String get scoreDeuce => 'Deuce';

  @override
  String get scoreAdvantage => 'Advantage';

  @override
  String get scoreGoldenPoint => 'Golden point';

  @override
  String get registerTeamName => 'Team name';

  @override
  String get registerTeamNameHint => 'Required — e.g. Smash Brothers';

  @override
  String get registrationRenameTeam => 'Rename team';

  @override
  String get registrationTeamRenamed => 'Team name updated';

  @override
  String registrationPartnerInvite(String name) {
    return '$name wants you as a partner in this tournament. Confirm to send it to the organizer.';
  }

  @override
  String get registrationPartnerAccept => 'Accept';

  @override
  String get registrationPartnerDecline => 'Decline';

  @override
  String get registrationPartnerDeclineConfirm =>
      'Decline playing in this tournament as a pair?';

  @override
  String get registrationPartnerAcceptedSnack =>
      'Confirmed — the organizer will now review the registration';

  @override
  String get registrationPartnerDeclinedSnack => 'Invitation declined';

  @override
  String get registrationAwaitingPartnerHint =>
      'Waiting for your partner to confirm before the organizer reviews it.';

  @override
  String get registrationPartnerDeclinedHint =>
      'Your partner declined. Choose another partner or cancel the registration.';

  @override
  String get registrationCancelConfirm => 'Your spot will be released.';

  @override
  String get registrationCancelled => 'Registration cancelled';

  @override
  String get registrationPay => 'Pay now';

  @override
  String get registrationPartnerChanged => 'Partner updated';

  @override
  String registrationPromoted(String date) {
    return 'Promoted from waitlist $date';
  }

  @override
  String get liveTitle => 'Match centre';

  @override
  String get livePointFeed => 'Point by point';

  @override
  String get livePointFeedEmpty => 'No points recorded yet.';

  @override
  String get liveTiebreak => 'Tie-break';

  @override
  String get liveMatchOver => 'Match over';

  @override
  String liveWinnerTitle(String team) {
    return '$team win!';
  }

  @override
  String get liveResultPending => 'Result pending staff verification';

  @override
  String get livePartialDetail => 'Partial detail';

  @override
  String livePointBy(String team) {
    return 'Point to $team';
  }

  @override
  String get liveNotStarted => 'Not started';

  @override
  String get liveCorrected => 'Corrected';

  @override
  String get rankingsTabSeason => 'Season';

  @override
  String get rankingsTabSkill => 'Skill';

  @override
  String get rankingsTabXp => 'XP';

  @override
  String get rankingsYou => 'You';

  @override
  String get rankingsSeasonPicker => 'Season';

  @override
  String get rankingsSearchHint => 'Search the board';

  @override
  String get rankingsXpNote =>
      'XP rewards activity. It never affects ranking or seeding.';

  @override
  String get rankingsSkillNote =>
      'Skill Rating moves only with verified results from ranked tournaments.';

  @override
  String get rankingsSeasonNote =>
      'Season points count your best stage per category.';

  @override
  String rankingsLevelPosition(int position, String level) {
    return '#$position in $level';
  }

  @override
  String get playTitle => 'Play';

  @override
  String get playTabCasual => 'Casual';

  @override
  String get playTabCoaches => 'Coaches';

  @override
  String get casualMyMatches => 'My games';

  @override
  String get casualCreated => 'Created';

  @override
  String get casualJoined => 'Joined';

  @override
  String get casualDetailTitle => 'Casual game';

  @override
  String get casualParticipants => 'Players';

  @override
  String get casualRequests => 'Join requests';

  @override
  String get casualNoRequests => 'No pending requests';

  @override
  String get casualLeave => 'Leave game';

  @override
  String get casualCancelGame => 'Cancel game';

  @override
  String get casualCancelConfirm => 'Everyone who joined will be notified.';

  @override
  String get casualLeft => 'You left the game';

  @override
  String get casualCancelled => 'Game cancelled';

  @override
  String get fieldVenue => 'Venue (optional)';

  @override
  String get fieldCourt => 'Court (optional)';

  @override
  String get venueAny => 'Any venue';

  @override
  String get courtAny => 'Any court';

  @override
  String get venuesTitle => 'Venues';

  @override
  String venueCourts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count courts',
      one: '1 court',
    );
    return '$_temp0';
  }

  @override
  String get venueUpcoming => 'Upcoming tournaments';

  @override
  String get venuesEmpty => 'No venues found';

  @override
  String get coachesFilterAll => 'All';

  @override
  String get coachesSortRating => 'Top rated';

  @override
  String get coachesSortPrice => 'Price';

  @override
  String get coachesSortName => 'Name';

  @override
  String get coachesSearchHint => 'Search coaches or city';

  @override
  String get coachLanguages => 'Languages';

  @override
  String get coachExperience => 'Experience';

  @override
  String get coachTrainingTypes => 'Training types';

  @override
  String get coachAvailability => 'Availability';

  @override
  String get coachNoSlots => 'No open slots this day';

  @override
  String get coachReviews => 'Reviews';

  @override
  String get coachNoReviews =>
      'No reviews yet — be the first after your session.';

  @override
  String get coachBook => 'Book a session';

  @override
  String coachBookSlot(String time) {
    return 'Book $time';
  }

  @override
  String get bookingSheetTitle => 'Confirm booking';

  @override
  String get bookingPickSlot => 'Pick a time slot first';

  @override
  String get bookingSummary => 'Summary';

  @override
  String get bookingTotal => 'Total';

  @override
  String get bookingConfirm => 'Request booking';

  @override
  String get bookingRequested =>
      'Booking requested — the coach will confirm it.';

  @override
  String get bookingSlotTaken =>
      'That slot was just taken. Here\'s the latest availability.';

  @override
  String get myBookingsTitle => 'My training';

  @override
  String get myBookingsUpcoming => 'Upcoming';

  @override
  String get myBookingsPast => 'Past';

  @override
  String get myBookingsEmpty => 'No sessions here';

  @override
  String get trainingProgressTitle => 'Training progress';

  @override
  String get trainingProgressEmpty =>
      'Your coach\'s skill assessments will appear here after sessions.';

  @override
  String trainingLatest(int score) {
    return 'Latest $score/10';
  }

  @override
  String trainingAssessments(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count assessments',
      one: '1 assessment',
    );
    return '$_temp0';
  }

  @override
  String get coachPortalTitle => 'Coach portal';

  @override
  String get coachPortalToday => 'Next sessions';

  @override
  String get coachPortalPending => 'Requests to answer';

  @override
  String get coachPortalAvailability => 'Availability';

  @override
  String get coachPortalBookings => 'Bookings';

  @override
  String get coachPortalProfile => 'Coach profile';

  @override
  String get coachPortalSwitchToPlayer => 'Player app';

  @override
  String get coachPortalOpen => 'Coach portal';

  @override
  String get slotAdd => 'Add slots';

  @override
  String get slotDate => 'Date';

  @override
  String get slotStart => 'Start';

  @override
  String get slotEnd => 'End';

  @override
  String get slotRepeat => 'Repeat weekly';

  @override
  String slotRepeatWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'For $count more weeks',
      one: 'For 1 more week',
      zero: 'Don\'t repeat',
    );
    return '$_temp0';
  }

  @override
  String get slotActive => 'Bookable';

  @override
  String get slotBooked => 'Booked';

  @override
  String get slotDeleteConfirm => 'Delete this slot?';

  @override
  String get slotsCreated => 'Slots added';

  @override
  String get slotsEmptyDay => 'No slots on this day';

  @override
  String get bookingConfirmAction => 'Confirm';

  @override
  String get bookingRejectAction => 'Reject';

  @override
  String get bookingCompleteAction => 'Mark completed';

  @override
  String get bookingFeedbackAction => 'Send feedback';

  @override
  String get bookingProgressAction => 'Record progress';

  @override
  String get bookingReasonOptional => 'Reason (optional)';

  @override
  String get bookingFeedbackHint => 'What went well, what to work on';

  @override
  String get bookingUpdated => 'Booking updated';

  @override
  String get progressSkill => 'Skill';

  @override
  String get progressScore => 'Score (1–10)';

  @override
  String get progressAddSkill => 'Add skill';

  @override
  String get progressSaved => 'Progress saved';

  @override
  String get coachFieldCity => 'City';

  @override
  String get coachFieldPrice => 'Price per hour';

  @override
  String get coachFieldYears => 'Years of experience';

  @override
  String get coachFieldSpecialties => 'Specialties';

  @override
  String get coachFieldLanguages => 'Languages (comma separated)';

  @override
  String get coachProfileSaved => 'Coach profile saved';

  @override
  String get notificationsMarkAllRead => 'Mark all read';

  @override
  String get notificationsFilterUnread => 'Unread';

  @override
  String get notificationsFilterAll => 'All';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsPushEnabled => 'Push notifications are on';

  @override
  String get settingsPushDisabled => 'Push notifications are off';

  @override
  String get settingsPushUnavailable => 'Push isn\'t configured on this build';

  @override
  String get settingsPushEnable => 'Enable';

  @override
  String get settingsAccount => 'Account';

  @override
  String get settingsPremium => 'Premium';

  @override
  String get settingsPayments => 'Payments';

  @override
  String get settingsMyTraining => 'My training';

  @override
  String get settingsStaff => 'Staff scorekeeping';

  @override
  String settingsVersion(String version) {
    return 'Version $version';
  }

  @override
  String get settingsLogOutConfirm => 'You\'ll need to sign in again.';

  @override
  String get scorekeeperTitle => 'Scorekeeper';

  @override
  String get scorekeeperLogin => 'Staff login';

  @override
  String get scorekeeperLoginField => 'Staff login';

  @override
  String get scorekeeperMatches => 'Assigned matches';

  @override
  String get scorekeeperNoMatches => 'No matches assigned right now.';

  @override
  String get scorekeeperPointTo => 'Point';

  @override
  String get scorekeeperUndo => 'Undo last point';

  @override
  String get scorekeeperEndMatch => 'End match';

  @override
  String get scorekeeperEndMatchTitle => 'End the match — who won?';

  @override
  String get scorekeeperEndMatchHelp =>
      'The match ends now with the current score (time limit, court needed...). You can reopen it with undo.';

  @override
  String get scorekeeperEndReason => 'Reason (optional)';

  @override
  String get scorekeeperMatchEnded => 'Match ended';

  @override
  String get scorekeeperReopen => 'Reopen match';

  @override
  String get scorekeeperAddDetail => 'Add detail';

  @override
  String get scorekeeperDetailOptional =>
      'Optional — the score is already recorded.';

  @override
  String get scorekeeperEndingType => 'How it ended';

  @override
  String get scorekeeperShot => 'Shot';

  @override
  String get scorekeeperError => 'Error';

  @override
  String get scorekeeperServe => 'Serve';

  @override
  String get scorekeeperPlayer => 'Player';

  @override
  String get scorekeeperSaved => 'Detail saved';

  @override
  String get scorekeeperRecordPoint => 'Record point';

  @override
  String get scorekeeperEditLastPoint => 'Edit last point';

  @override
  String get scorekeeperReasonHelp =>
      'Choose how the point ended and the required details.';

  @override
  String get scorekeeperPlayerWinning => 'Player (team that won the point)';

  @override
  String get scorekeeperPlayerLosing => 'Player (team that lost the point)';

  @override
  String get scorekeeperLogout => 'Leave scorekeeper mode';

  @override
  String get pmPhoneKicker => 'Welcome to the community';

  @override
  String get pmPhoneTitle => 'Step onto the court';

  @override
  String get pmPhoneSubtitle =>
      'Sign in with your phone number and start building your sports identity.';

  @override
  String get pmPhoneLabel => 'Phone number';

  @override
  String get pmPhoneHint => 'We\'ll send you a verification code by SMS';

  @override
  String get pmPhoneInvalid => 'The number must start with 77, 78 or 79';

  @override
  String get pmContinue => 'Continue';

  @override
  String get pmOrContinueWith => 'Or continue with';

  @override
  String get pmLegalPrefix => 'By continuing you agree to the ';

  @override
  String get pmLegalTerms => 'Terms of Use';

  @override
  String get pmLegalAnd => ' and ';

  @override
  String get pmLegalPrivacy => 'Privacy Policy';

  @override
  String get pmStaffSignIn => 'Scorekeeper login';

  @override
  String get pmBack => 'Back';

  @override
  String get pmOtpKicker => 'Last step';

  @override
  String get pmOtpTitle => 'Enter the verification code';

  @override
  String get pmOtpSentTo => 'We sent a 6-digit code to';

  @override
  String get pmOtpEdit => 'Edit';

  @override
  String get pmOtpLabel => 'Verification code';

  @override
  String get pmOtpNotReceived => 'Didn\'t get the code?';

  @override
  String get pmOtpResend => 'Resend';

  @override
  String get pmOtpConfirm => 'Confirm and sign in';

  @override
  String get pmWelcomeTitle => 'Your identity is ready';

  @override
  String get pmWelcomeSubtitle => 'Welcome to Playmaker — the court awaits';

  @override
  String get failureInvalidPhone => 'Enter a valid Jordanian mobile number.';

  @override
  String get failureOtpExpired => 'The code has expired. Request a new one.';

  @override
  String get failureOtpSessionInvalid =>
      'This verification is no longer valid. Request a new code.';

  @override
  String get failureOtpResendTooSoon =>
      'Please wait a moment before requesting a new code.';

  @override
  String get failureOtpResendLimit =>
      'You\'ve reached the resend limit. Try again later.';

  @override
  String get failureOtpTooManyAttempts =>
      'Too many incorrect attempts. Request a new code.';

  @override
  String get failureOtpProviderUnavailable =>
      'SMS service is temporarily unavailable. Try again shortly.';

  @override
  String get failureSocialTokenInvalid =>
      'We couldn\'t verify your account. Please try again.';

  @override
  String get failureSocialUnavailable =>
      'This sign-in option isn\'t available right now.';

  @override
  String get fieldCountry => 'Country';

  @override
  String get partnerEnded => 'Partnership ended';

  @override
  String get duo3dTitle => 'Duo 3D identity';

  @override
  String get duo3dBody =>
      'A 3D scene of you and your partner together on court.';

  @override
  String get duo3dGenerate => 'Create our scene';

  @override
  String get duo3dRegenerate => 'Create a new one';

  @override
  String get duo3dProcessing =>
      'Creating your duo scene… this can take a few minutes.';

  @override
  String get duo3dFailed => 'The last attempt failed. Try again.';

  @override
  String get duo3dNeedsPhotos =>
      'You and your partner both need a profile photo first.';

  @override
  String get duo3dComingSoon => 'Duo scenes are coming soon.';

  @override
  String get duo3dPremium => 'Duo scenes are part of Premium.';

  @override
  String get casualMatchName => 'Match name (optional)';

  @override
  String get casualMatchNameHint => 'e.g. Friday evening padel';

  @override
  String get casualEditMatch => 'Edit match';

  @override
  String get casualEditHint =>
      'Players are notified when you change the time or the court.';

  @override
  String get casualInvitePlayer => 'Invite a player';

  @override
  String get casualInviteSearchHint => 'Search by name or player ID';

  @override
  String get casualInvite => 'Invite';

  @override
  String get casualInvitationSent => 'Invitation sent';

  @override
  String get casualCancelledNotFull =>
      'This match was cancelled automatically: it did not have enough players 2 hours before the start.';

  @override
  String get casualCancelledByCreator =>
      'This match was cancelled by the organizer.';

  @override
  String get casualUpdated => 'Match updated';

  @override
  String get casualInvitedStatus => 'Invited';

  @override
  String casualYouAreInvited(String name) {
    return '$name invited you to this match';
  }

  @override
  String get casualInvitationAccepted => 'You\'re in! See you on court.';

  @override
  String get notificationSettingsTitle => 'Notification settings';

  @override
  String get notificationSettingsHint =>
      'Choose which notifications you receive. Platform announcements are always delivered.';

  @override
  String get myRegistrationsShort => 'My registrations';

  @override
  String get myTrainingsShort => 'My trainings';

  @override
  String get registrationOrganizerNote => 'Organizer\'s note';

  @override
  String get registrationChangesHint =>
      'Update your registration (e.g. change partner) and it goes back to review.';

  @override
  String get openInGoogleMaps => 'Open in Google Maps';

  @override
  String get premiumPlanMonthly => 'Monthly';

  @override
  String get premiumPlanYearly => 'Yearly';

  @override
  String premiumDaysLeft(int count) {
    return '$count days left';
  }

  @override
  String get findPartner => 'Find a partner';

  @override
  String get findPartnerHint =>
      'Search by name or player ID, open the player\'s profile, then tap \"Request as main partner\".';
}
