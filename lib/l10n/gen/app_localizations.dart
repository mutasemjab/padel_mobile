import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Padel Platform'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navTournaments.
  ///
  /// In en, this message translates to:
  /// **'Tournaments'**
  String get navTournaments;

  /// No description provided for @navRankings.
  ///
  /// In en, this message translates to:
  /// **'Rankings'**
  String get navRankings;

  /// No description provided for @navCasual.
  ///
  /// In en, this message translates to:
  /// **'Casual'**
  String get navCasual;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @actionRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get actionRetry;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @actionSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get actionSend;

  /// No description provided for @actionCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get actionCreate;

  /// No description provided for @actionCreateOne.
  ///
  /// In en, this message translates to:
  /// **'Create one'**
  String get actionCreateOne;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @premiumLabel.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premiumLabel;

  /// No description provided for @tieBreakLabel.
  ///
  /// In en, this message translates to:
  /// **'TIE-BREAK'**
  String get tieBreakLabel;

  /// No description provided for @ptsLabel.
  ///
  /// In en, this message translates to:
  /// **'pts'**
  String get ptsLabel;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsLanguageArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get settingsLanguageArabic;

  /// No description provided for @settingsLanguageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settingsLanguageEnglish;

  /// No description provided for @settingsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @settingsLogOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get settingsLogOut;

  /// No description provided for @deleteAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccountTitle;

  /// No description provided for @deleteAccountConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to permanently delete your account? This action is immediate and cannot be undone, and all your data and matches will be deleted.'**
  String get deleteAccountConfirm;

  /// No description provided for @deleteAccountSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your account has been deleted successfully.'**
  String get deleteAccountSuccess;

  /// No description provided for @deleteAccountLoading.
  ///
  /// In en, this message translates to:
  /// **'Deleting account...'**
  String get deleteAccountLoading;

  /// No description provided for @homeWelcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back, {name}'**
  String homeWelcomeBack(String name);

  /// No description provided for @homeUnranked.
  ///
  /// In en, this message translates to:
  /// **'Unranked'**
  String get homeUnranked;

  /// No description provided for @homeLevelPoints.
  ///
  /// In en, this message translates to:
  /// **'{level} • {points} season pts'**
  String homeLevelPoints(String level, int points);

  /// No description provided for @homeLiveNow.
  ///
  /// In en, this message translates to:
  /// **'Live now'**
  String get homeLiveNow;

  /// No description provided for @homeSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get homeSeeAll;

  /// No description provided for @homeNoLiveTournaments.
  ///
  /// In en, this message translates to:
  /// **'No tournaments live right now.'**
  String get homeNoLiveTournaments;

  /// No description provided for @fieldPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get fieldPassword;

  /// No description provided for @errorPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get errorPasswordRequired;

  /// No description provided for @actionLogIn.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get actionLogIn;

  /// No description provided for @fieldFullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fieldFullName;

  /// No description provided for @errorNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get errorNameRequired;

  /// No description provided for @fieldPhoneOptional.
  ///
  /// In en, this message translates to:
  /// **'Phone (optional)'**
  String get fieldPhoneOptional;

  /// No description provided for @errorPasswordLength.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters'**
  String get errorPasswordLength;

  /// No description provided for @fieldConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get fieldConfirmPassword;

  /// No description provided for @errorPasswordsMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get errorPasswordsMismatch;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @emptyNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'No notifications yet'**
  String get emptyNotificationsTitle;

  /// No description provided for @emptyNotificationsMessage.
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up — new notifications will show up here.'**
  String get emptyNotificationsMessage;

  /// No description provided for @casualMatchesTitle.
  ///
  /// In en, this message translates to:
  /// **'Casual matches'**
  String get casualMatchesTitle;

  /// No description provided for @casualFilterLookingForMatch.
  ///
  /// In en, this message translates to:
  /// **'Looking for a match'**
  String get casualFilterLookingForMatch;

  /// No description provided for @casualFilterLookingForPartner.
  ///
  /// In en, this message translates to:
  /// **'Looking for a partner'**
  String get casualFilterLookingForPartner;

  /// No description provided for @casualFilterNeed1.
  ///
  /// In en, this message translates to:
  /// **'Need 1 more'**
  String get casualFilterNeed1;

  /// No description provided for @casualFilterNeed2.
  ///
  /// In en, this message translates to:
  /// **'Need 2 more'**
  String get casualFilterNeed2;

  /// No description provided for @casualFilterNeed3.
  ///
  /// In en, this message translates to:
  /// **'Need 3 more'**
  String get casualFilterNeed3;

  /// No description provided for @emptyCasualTitle.
  ///
  /// In en, this message translates to:
  /// **'No casual matches nearby'**
  String get emptyCasualTitle;

  /// No description provided for @emptyCasualMessage.
  ///
  /// In en, this message translates to:
  /// **'Be the first to set one up and invite players to join.'**
  String get emptyCasualMessage;

  /// No description provided for @joinRequestSent.
  ///
  /// In en, this message translates to:
  /// **'Join request sent.'**
  String get joinRequestSent;

  /// No description provided for @statusClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get statusClosed;

  /// No description provided for @labelLevel.
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String labelLevel(String level);

  /// No description provided for @labelSide.
  ///
  /// In en, this message translates to:
  /// **'Side: {side}'**
  String labelSide(String side);

  /// No description provided for @byCreator.
  ///
  /// In en, this message translates to:
  /// **'By {name}'**
  String byCreator(String name);

  /// No description provided for @actionRequested.
  ///
  /// In en, this message translates to:
  /// **'Requested'**
  String get actionRequested;

  /// No description provided for @actionJoin.
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get actionJoin;

  /// No description provided for @createMatchTitle.
  ///
  /// In en, this message translates to:
  /// **'Create a casual match'**
  String get createMatchTitle;

  /// No description provided for @fieldMatchType.
  ///
  /// In en, this message translates to:
  /// **'Match type'**
  String get fieldMatchType;

  /// No description provided for @fieldDateTime.
  ///
  /// In en, this message translates to:
  /// **'Date & time'**
  String get fieldDateTime;

  /// No description provided for @selectFutureDateTime.
  ///
  /// In en, this message translates to:
  /// **'Select a future date & time'**
  String get selectFutureDateTime;

  /// No description provided for @errorPickFutureDateTime.
  ///
  /// In en, this message translates to:
  /// **'Pick a date and time in the future'**
  String get errorPickFutureDateTime;

  /// No description provided for @fieldRequiredLevelOptional.
  ///
  /// In en, this message translates to:
  /// **'Required level (optional)'**
  String get fieldRequiredLevelOptional;

  /// No description provided for @fieldPreferredSideOptional.
  ///
  /// In en, this message translates to:
  /// **'Preferred side (optional)'**
  String get fieldPreferredSideOptional;

  /// No description provided for @fieldNotesOptional.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get fieldNotesOptional;

  /// No description provided for @actionCreateMatch.
  ///
  /// In en, this message translates to:
  /// **'Create match'**
  String get actionCreateMatch;

  /// No description provided for @coachesTitle.
  ///
  /// In en, this message translates to:
  /// **'Coaches'**
  String get coachesTitle;

  /// No description provided for @emptyCoachesTitle.
  ///
  /// In en, this message translates to:
  /// **'No coaches available'**
  String get emptyCoachesTitle;

  /// No description provided for @emptyCoachesMessage.
  ///
  /// In en, this message translates to:
  /// **'Check back soon for available coaches.'**
  String get emptyCoachesMessage;

  /// No description provided for @coachPricePerHourLong.
  ///
  /// In en, this message translates to:
  /// **'{price} / hour'**
  String coachPricePerHourLong(String price);

  /// No description provided for @coachPricePerHourShort.
  ///
  /// In en, this message translates to:
  /// **'{price}/hr'**
  String coachPricePerHourShort(String price);

  /// No description provided for @statusUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get statusUnavailable;

  /// No description provided for @sectionAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get sectionAbout;

  /// No description provided for @sectionSpecialties.
  ///
  /// In en, this message translates to:
  /// **'Specialties'**
  String get sectionSpecialties;

  /// No description provided for @rankingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Rankings'**
  String get rankingsTitle;

  /// No description provided for @emptyRankingsTitle.
  ///
  /// In en, this message translates to:
  /// **'No rankings yet'**
  String get emptyRankingsTitle;

  /// No description provided for @emptyRankingsMessage.
  ///
  /// In en, this message translates to:
  /// **'Rankings will appear here once players start earning points.'**
  String get emptyRankingsMessage;

  /// No description provided for @liveMatchTitle.
  ///
  /// In en, this message translates to:
  /// **'Live match'**
  String get liveMatchTitle;

  /// No description provided for @vsLabel.
  ///
  /// In en, this message translates to:
  /// **'vs'**
  String get vsLabel;

  /// No description provided for @currentGame.
  ///
  /// In en, this message translates to:
  /// **'Current game'**
  String get currentGame;

  /// No description provided for @gamesScore.
  ///
  /// In en, this message translates to:
  /// **'{teamOne} - {teamTwo} games'**
  String gamesScore(int teamOne, int teamTwo);

  /// No description provided for @setsScore.
  ///
  /// In en, this message translates to:
  /// **'{teamOne} - {teamTwo} sets'**
  String setsScore(int teamOne, int teamTwo);

  /// No description provided for @matchCompleted.
  ///
  /// In en, this message translates to:
  /// **'Match completed'**
  String get matchCompleted;

  /// No description provided for @teamWon.
  ///
  /// In en, this message translates to:
  /// **'{team} won'**
  String teamWon(String team);

  /// No description provided for @rankingEligible.
  ///
  /// In en, this message translates to:
  /// **'Ranking eligible'**
  String get rankingEligible;

  /// No description provided for @venueTba.
  ///
  /// In en, this message translates to:
  /// **'Venue TBA'**
  String get venueTba;

  /// No description provided for @categoriesSection.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categoriesSection;

  /// No description provided for @teamsCount.
  ///
  /// In en, this message translates to:
  /// **'{active}/{max} teams'**
  String teamsCount(int active, int max);

  /// No description provided for @feeSuffix.
  ///
  /// In en, this message translates to:
  /// **' • {fee} fee'**
  String feeSuffix(String fee);

  /// No description provided for @statusFull.
  ///
  /// In en, this message translates to:
  /// **'Full'**
  String get statusFull;

  /// No description provided for @tournamentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Tournaments'**
  String get tournamentsTitle;

  /// No description provided for @filterOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get filterOpen;

  /// No description provided for @filterLive.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get filterLive;

  /// No description provided for @filterCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get filterCompleted;

  /// No description provided for @emptyTournamentsTitle.
  ///
  /// In en, this message translates to:
  /// **'No tournaments here'**
  String get emptyTournamentsTitle;

  /// No description provided for @emptyTournamentsMessage.
  ///
  /// In en, this message translates to:
  /// **'Try a different filter or check back soon.'**
  String get emptyTournamentsMessage;

  /// No description provided for @statusDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get statusDraft;

  /// No description provided for @statusRegistrationOpen.
  ///
  /// In en, this message translates to:
  /// **'Registration open'**
  String get statusRegistrationOpen;

  /// No description provided for @statusRegistrationClosed.
  ///
  /// In en, this message translates to:
  /// **'Registration closed'**
  String get statusRegistrationClosed;

  /// No description provided for @statusOngoing.
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get statusOngoing;

  /// No description provided for @statusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get statusCompleted;

  /// No description provided for @statusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get statusCancelled;

  /// No description provided for @achievementsSection.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievementsSection;

  /// No description provided for @statLevel.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get statLevel;

  /// No description provided for @statRating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get statRating;

  /// No description provided for @statSeasonPts.
  ///
  /// In en, this message translates to:
  /// **'Season pts'**
  String get statSeasonPts;

  /// No description provided for @statXp.
  ///
  /// In en, this message translates to:
  /// **'XP'**
  String get statXp;

  /// No description provided for @actionFollowing.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get actionFollowing;

  /// No description provided for @actionFollow.
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get actionFollow;

  /// No description provided for @tooltipRespect.
  ///
  /// In en, this message translates to:
  /// **'Respect'**
  String get tooltipRespect;

  /// No description provided for @tooltipChallenge.
  ///
  /// In en, this message translates to:
  /// **'Challenge'**
  String get tooltipChallenge;

  /// No description provided for @challengeSentTo.
  ///
  /// In en, this message translates to:
  /// **'Challenge sent to {name}'**
  String challengeSentTo(String name);

  /// No description provided for @challengeTitle.
  ///
  /// In en, this message translates to:
  /// **'Challenge {name}'**
  String challengeTitle(String name);

  /// No description provided for @hintAddMessage.
  ///
  /// In en, this message translates to:
  /// **'Add a message (optional)'**
  String get hintAddMessage;

  /// No description provided for @failureSessionExpired.
  ///
  /// In en, this message translates to:
  /// **'Session expired.'**
  String get failureSessionExpired;

  /// No description provided for @failureNoInternet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection.'**
  String get failureNoInternet;

  /// No description provided for @failureServerError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong on our end.'**
  String get failureServerError;

  /// No description provided for @failureUnknown.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred.'**
  String get failureUnknown;

  /// No description provided for @failureRequestCancelled.
  ///
  /// In en, this message translates to:
  /// **'Request cancelled.'**
  String get failureRequestCancelled;

  /// No description provided for @failureSecureConnectionFailed.
  ///
  /// In en, this message translates to:
  /// **'Secure connection failed.'**
  String get failureSecureConnectionFailed;

  /// No description provided for @failureValidationFailed.
  ///
  /// In en, this message translates to:
  /// **'Validation failed.'**
  String get failureValidationFailed;

  /// No description provided for @failureRequestFailed.
  ///
  /// In en, this message translates to:
  /// **'Request failed.'**
  String get failureRequestFailed;

  /// No description provided for @failureInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Wrong email or password.'**
  String get failureInvalidCredentials;

  /// No description provided for @failurePremiumRequired.
  ///
  /// In en, this message translates to:
  /// **'This is a Premium feature.'**
  String get failurePremiumRequired;

  /// No description provided for @failureCoachOnly.
  ///
  /// In en, this message translates to:
  /// **'Only coach accounts can do this.'**
  String get failureCoachOnly;

  /// No description provided for @failurePlayerProfileRequired.
  ///
  /// In en, this message translates to:
  /// **'This needs a player profile.'**
  String get failurePlayerProfileRequired;

  /// No description provided for @failureStaffOnly.
  ///
  /// In en, this message translates to:
  /// **'Only tournament staff can do this.'**
  String get failureStaffOnly;

  /// No description provided for @failureForbidden.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have access to this.'**
  String get failureForbidden;

  /// No description provided for @failureAccountInactive.
  ///
  /// In en, this message translates to:
  /// **'This account is inactive.'**
  String get failureAccountInactive;

  /// No description provided for @failureNotFound.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find that.'**
  String get failureNotFound;

  /// No description provided for @failureRateLimited.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Try again in a moment.'**
  String get failureRateLimited;

  /// No description provided for @failureProviderUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Not available yet.'**
  String get failureProviderUnavailable;

  /// No description provided for @actionClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get actionClose;

  /// No description provided for @actionConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get actionConfirm;

  /// No description provided for @actionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// No description provided for @actionEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get actionEdit;

  /// No description provided for @actionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get actionDelete;

  /// No description provided for @actionAccept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get actionAccept;

  /// No description provided for @actionDecline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get actionDecline;

  /// No description provided for @actionRefresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get actionRefresh;

  /// No description provided for @actionViewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get actionViewAll;

  /// No description provided for @actionLearnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn more'**
  String get actionLearnMore;

  /// No description provided for @actionGoPremium.
  ///
  /// In en, this message translates to:
  /// **'Go Premium'**
  String get actionGoPremium;

  /// No description provided for @actionBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get actionBack;

  /// No description provided for @actionSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get actionSearch;

  /// No description provided for @actionApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get actionApply;

  /// No description provided for @actionReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get actionReset;

  /// No description provided for @actionContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get actionContinue;

  /// No description provided for @actionLeave.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get actionLeave;

  /// No description provided for @actionOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get actionOpen;

  /// No description provided for @stateEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet'**
  String get stateEmptyTitle;

  /// No description provided for @stateOfflineTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re offline'**
  String get stateOfflineTitle;

  /// No description provided for @stateOfflineMessage.
  ///
  /// In en, this message translates to:
  /// **'Check your connection and try again.'**
  String get stateOfflineMessage;

  /// No description provided for @stateOfflineBanner.
  ///
  /// In en, this message translates to:
  /// **'Offline — showing what we have'**
  String get stateOfflineBanner;

  /// No description provided for @stateErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get stateErrorTitle;

  /// No description provided for @stateComingSoonTitle.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get stateComingSoonTitle;

  /// No description provided for @stateComingSoonPayments.
  ///
  /// In en, this message translates to:
  /// **'Online payments are coming soon. Nothing was charged.'**
  String get stateComingSoonPayments;

  /// No description provided for @stateComingSoon3d.
  ///
  /// In en, this message translates to:
  /// **'3D identity generation isn\'t available yet. We\'ll let you know when it is.'**
  String get stateComingSoon3d;

  /// No description provided for @stateInsufficientDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Not enough data yet'**
  String get stateInsufficientDataTitle;

  /// No description provided for @statePremiumTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock with Premium'**
  String get statePremiumTitle;

  /// No description provided for @statePremiumMessage.
  ///
  /// In en, this message translates to:
  /// **'Premium adds insights and analytics. It never affects your rating or ranking.'**
  String get statePremiumMessage;

  /// No description provided for @progressOf.
  ///
  /// In en, this message translates to:
  /// **'{current}/{target}'**
  String progressOf(int current, int target);

  /// No description provided for @valueDash.
  ///
  /// In en, this message translates to:
  /// **'—'**
  String get valueDash;

  /// No description provided for @liveBadge.
  ///
  /// In en, this message translates to:
  /// **'LIVE'**
  String get liveBadge;

  /// No description provided for @liveRealtime.
  ///
  /// In en, this message translates to:
  /// **'Live · realtime'**
  String get liveRealtime;

  /// No description provided for @liveUpdatingEvery.
  ///
  /// In en, this message translates to:
  /// **'Live · updating every {seconds} s'**
  String liveUpdatingEvery(int seconds);

  /// No description provided for @correctedToast.
  ///
  /// In en, this message translates to:
  /// **'Score corrected by the scorekeeper'**
  String get correctedToast;

  /// No description provided for @metricSkillRating.
  ///
  /// In en, this message translates to:
  /// **'Skill Rating'**
  String get metricSkillRating;

  /// No description provided for @metricSeasonPoints.
  ///
  /// In en, this message translates to:
  /// **'Season Points'**
  String get metricSeasonPoints;

  /// No description provided for @metricXp.
  ///
  /// In en, this message translates to:
  /// **'XP'**
  String get metricXp;

  /// No description provided for @metricPosition.
  ///
  /// In en, this message translates to:
  /// **'#{position}'**
  String metricPosition(int position);

  /// No description provided for @metricLevel.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get metricLevel;

  /// No description provided for @metricUnranked.
  ///
  /// In en, this message translates to:
  /// **'Unranked'**
  String get metricUnranked;

  /// No description provided for @movementUp.
  ///
  /// In en, this message translates to:
  /// **'Up {n}'**
  String movementUp(int n);

  /// No description provided for @movementDown.
  ///
  /// In en, this message translates to:
  /// **'Down {n}'**
  String movementDown(int n);

  /// No description provided for @movementSame.
  ///
  /// In en, this message translates to:
  /// **'No change'**
  String get movementSame;

  /// No description provided for @competitionRanked.
  ///
  /// In en, this message translates to:
  /// **'VERIFIED · RANKED'**
  String get competitionRanked;

  /// No description provided for @competitionCertified.
  ///
  /// In en, this message translates to:
  /// **'OFFICIAL'**
  String get competitionCertified;

  /// No description provided for @competitionSocial.
  ///
  /// In en, this message translates to:
  /// **'SOCIAL'**
  String get competitionSocial;

  /// No description provided for @officialNote.
  ///
  /// In en, this message translates to:
  /// **'Only verified results from ranked tournaments move your Skill Rating and Season Ranking.'**
  String get officialNote;

  /// No description provided for @casualNote.
  ///
  /// In en, this message translates to:
  /// **'Casual play never affects your rating or ranking.'**
  String get casualNote;

  /// No description provided for @rarityCommon.
  ///
  /// In en, this message translates to:
  /// **'Common'**
  String get rarityCommon;

  /// No description provided for @rarityRare.
  ///
  /// In en, this message translates to:
  /// **'Rare'**
  String get rarityRare;

  /// No description provided for @rarityEpic.
  ///
  /// In en, this message translates to:
  /// **'Epic'**
  String get rarityEpic;

  /// No description provided for @rarityLegendary.
  ///
  /// In en, this message translates to:
  /// **'Legendary'**
  String get rarityLegendary;

  /// No description provided for @xpReward.
  ///
  /// In en, this message translates to:
  /// **'+{xp} XP'**
  String xpReward(int xp);

  /// No description provided for @newCoach.
  ///
  /// In en, this message translates to:
  /// **'New coach'**
  String get newCoach;

  /// No description provided for @reviewsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 review} other{{count} reviews}}'**
  String reviewsCount(int count);

  /// No description provided for @timeNow.
  ///
  /// In en, this message translates to:
  /// **'now'**
  String get timeNow;

  /// No description provided for @timeInMinutes.
  ///
  /// In en, this message translates to:
  /// **'in {n}m'**
  String timeInMinutes(int n);

  /// No description provided for @timeMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{n}m ago'**
  String timeMinutesAgo(int n);

  /// No description provided for @timeInHours.
  ///
  /// In en, this message translates to:
  /// **'in {n}h'**
  String timeInHours(int n);

  /// No description provided for @timeHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{n}h ago'**
  String timeHoursAgo(int n);

  /// No description provided for @timeInDays.
  ///
  /// In en, this message translates to:
  /// **'in {n}d'**
  String timeInDays(int n);

  /// No description provided for @timeDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{n}d ago'**
  String timeDaysAgo(int n);

  /// No description provided for @dayToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get dayToday;

  /// No description provided for @dayYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get dayYesterday;

  /// No description provided for @navCompete.
  ///
  /// In en, this message translates to:
  /// **'Compete'**
  String get navCompete;

  /// No description provided for @navPlay.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get navPlay;

  /// No description provided for @homeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hi, {name}'**
  String homeGreeting(String name);

  /// No description provided for @homeLiveYouAreIn.
  ///
  /// In en, this message translates to:
  /// **'You\'re on court'**
  String get homeLiveYouAreIn;

  /// No description provided for @homeNextMatch.
  ///
  /// In en, this message translates to:
  /// **'Your next match'**
  String get homeNextMatch;

  /// No description provided for @homeLiveFollowing.
  ///
  /// In en, this message translates to:
  /// **'Players you follow'**
  String get homeLiveFollowing;

  /// No description provided for @homeMyTournaments.
  ///
  /// In en, this message translates to:
  /// **'My tournaments'**
  String get homeMyTournaments;

  /// No description provided for @homeYourSeason.
  ///
  /// In en, this message translates to:
  /// **'Your season'**
  String get homeYourSeason;

  /// No description provided for @homeStats.
  ///
  /// In en, this message translates to:
  /// **'Your numbers'**
  String get homeStats;

  /// No description provided for @homeLatestAchievement.
  ///
  /// In en, this message translates to:
  /// **'Latest achievement'**
  String get homeLatestAchievement;

  /// No description provided for @homeRecommendedTournaments.
  ///
  /// In en, this message translates to:
  /// **'Tournaments for you'**
  String get homeRecommendedTournaments;

  /// No description provided for @homeCasualOpportunities.
  ///
  /// In en, this message translates to:
  /// **'Games looking for players'**
  String get homeCasualOpportunities;

  /// No description provided for @homeRecommendedPartner.
  ///
  /// In en, this message translates to:
  /// **'Suggested partner'**
  String get homeRecommendedPartner;

  /// No description provided for @homeRecommendedCoach.
  ///
  /// In en, this message translates to:
  /// **'Coach for you'**
  String get homeRecommendedCoach;

  /// No description provided for @homeUpcomingTraining.
  ///
  /// In en, this message translates to:
  /// **'Upcoming training'**
  String get homeUpcomingTraining;

  /// No description provided for @homePendingRequests.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 partner request waiting} other{{count} partner requests waiting}}'**
  String homePendingRequests(int count);

  /// No description provided for @homeReviewRequests.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get homeReviewRequests;

  /// No description provided for @homeAiDailyBrief.
  ///
  /// In en, this message translates to:
  /// **'Daily brief'**
  String get homeAiDailyBrief;

  /// No description provided for @homePremiumTeaserTitle.
  ///
  /// In en, this message translates to:
  /// **'Your game, explained'**
  String get homePremiumTeaserTitle;

  /// No description provided for @homePremiumTeaserBody.
  ///
  /// In en, this message translates to:
  /// **'Daily briefs, advanced analytics and a 3D athlete identity — built only from your real matches.'**
  String get homePremiumTeaserBody;

  /// No description provided for @homeInsufficientRanking.
  ///
  /// In en, this message translates to:
  /// **'Play verified ranked matches to appear on the season board.'**
  String get homeInsufficientRanking;

  /// No description provided for @homeInsufficientGeneric.
  ///
  /// In en, this message translates to:
  /// **'We\'ll fill this in once there\'s enough real data.'**
  String get homeInsufficientGeneric;

  /// No description provided for @homeEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your season starts here'**
  String get homeEmptyTitle;

  /// No description provided for @homeEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Join a tournament or a casual game to fill your feed.'**
  String get homeEmptyMessage;

  /// No description provided for @homeFindTournament.
  ///
  /// In en, this message translates to:
  /// **'Find a tournament'**
  String get homeFindTournament;

  /// No description provided for @matchVs.
  ///
  /// In en, this message translates to:
  /// **'vs'**
  String get matchVs;

  /// No description provided for @matchTbd.
  ///
  /// In en, this message translates to:
  /// **'To be decided'**
  String get matchTbd;

  /// No description provided for @matchBye.
  ///
  /// In en, this message translates to:
  /// **'Bye'**
  String get matchBye;

  /// No description provided for @matchCourt.
  ///
  /// In en, this message translates to:
  /// **'Court {name}'**
  String matchCourt(String name);

  /// No description provided for @matchSetLabel.
  ///
  /// In en, this message translates to:
  /// **'Set {n}'**
  String matchSetLabel(int n);

  /// No description provided for @matchWinner.
  ///
  /// In en, this message translates to:
  /// **'Winner'**
  String get matchWinner;

  /// No description provided for @matchScheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get matchScheduled;

  /// No description provided for @matchStartsAt.
  ///
  /// In en, this message translates to:
  /// **'Starts {time}'**
  String matchStartsAt(String time);

  /// No description provided for @matchWalkover.
  ///
  /// In en, this message translates to:
  /// **'Walkover'**
  String get matchWalkover;

  /// No description provided for @matchPendingVerification.
  ///
  /// In en, this message translates to:
  /// **'Pending verification'**
  String get matchPendingVerification;

  /// No description provided for @matchVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get matchVerified;

  /// No description provided for @matchServing.
  ///
  /// In en, this message translates to:
  /// **'Serving'**
  String get matchServing;

  /// No description provided for @matchGames.
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get matchGames;

  /// No description provided for @matchPoints.
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get matchPoints;

  /// No description provided for @tournamentSpotsLeft.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Full} =1{1 spot left} other{{count} spots left}}'**
  String tournamentSpotsLeft(int count);

  /// No description provided for @tournamentLiveCount.
  ///
  /// In en, this message translates to:
  /// **'{count} live'**
  String tournamentLiveCount(int count);

  /// No description provided for @tournamentFree.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get tournamentFree;

  /// No description provided for @tournamentFee.
  ///
  /// In en, this message translates to:
  /// **'Fee {amount}'**
  String tournamentFee(String amount);

  /// No description provided for @reasonComplementarySide.
  ///
  /// In en, this message translates to:
  /// **'Complementary side'**
  String get reasonComplementarySide;

  /// No description provided for @reasonSimilarRating.
  ///
  /// In en, this message translates to:
  /// **'Similar Skill Rating'**
  String get reasonSimilarRating;

  /// No description provided for @reasonPreviousPartnership.
  ///
  /// In en, this message translates to:
  /// **'Played together'**
  String get reasonPreviousPartnership;

  /// No description provided for @reasonActiveRecently.
  ///
  /// In en, this message translates to:
  /// **'Active recently'**
  String get reasonActiveRecently;

  /// No description provided for @reasonSameCountry.
  ///
  /// In en, this message translates to:
  /// **'Same country'**
  String get reasonSameCountry;

  /// No description provided for @coachPerHour.
  ///
  /// In en, this message translates to:
  /// **'{price} / hour'**
  String coachPerHour(String price);

  /// No description provided for @coachNextAvailable.
  ///
  /// In en, this message translates to:
  /// **'Next: {time}'**
  String coachNextAvailable(String time);

  /// No description provided for @coachYearsExperience.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 year} other{{count} years}}'**
  String coachYearsExperience(int count);

  /// No description provided for @casualSpotsLeft.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Full} =1{1 spot left} other{{count} spots left}}'**
  String casualSpotsLeft(int count);

  /// No description provided for @casualRequestPending.
  ///
  /// In en, this message translates to:
  /// **'Request pending'**
  String get casualRequestPending;

  /// No description provided for @casualYouAreIn.
  ///
  /// In en, this message translates to:
  /// **'You\'re in'**
  String get casualYouAreIn;

  /// No description provided for @casualYourGame.
  ///
  /// In en, this message translates to:
  /// **'Your game'**
  String get casualYourGame;

  /// No description provided for @bookingWith.
  ///
  /// In en, this message translates to:
  /// **'with {name}'**
  String bookingWith(String name);

  /// No description provided for @achievementLocked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get achievementLocked;

  /// No description provided for @achievementUnlockedOn.
  ///
  /// In en, this message translates to:
  /// **'Unlocked {date}'**
  String achievementUnlockedOn(String date);

  /// No description provided for @statMatches.
  ///
  /// In en, this message translates to:
  /// **'Matches'**
  String get statMatches;

  /// No description provided for @statWins.
  ///
  /// In en, this message translates to:
  /// **'Wins'**
  String get statWins;

  /// No description provided for @statLosses.
  ///
  /// In en, this message translates to:
  /// **'Losses'**
  String get statLosses;

  /// No description provided for @statWinRate.
  ///
  /// In en, this message translates to:
  /// **'Win rate'**
  String get statWinRate;

  /// No description provided for @statStreak.
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get statStreak;

  /// No description provided for @statTitles.
  ///
  /// In en, this message translates to:
  /// **'Titles'**
  String get statTitles;

  /// No description provided for @statFinals.
  ///
  /// In en, this message translates to:
  /// **'Finals'**
  String get statFinals;

  /// No description provided for @statTournaments.
  ///
  /// In en, this message translates to:
  /// **'Tournaments'**
  String get statTournaments;

  /// No description provided for @statSets.
  ///
  /// In en, this message translates to:
  /// **'Sets won–lost'**
  String get statSets;

  /// No description provided for @statGames.
  ///
  /// In en, this message translates to:
  /// **'Games won–lost'**
  String get statGames;

  /// No description provided for @statBestStreak.
  ///
  /// In en, this message translates to:
  /// **'Best win streak'**
  String get statBestStreak;

  /// No description provided for @statWalkovers.
  ///
  /// In en, this message translates to:
  /// **'Walkovers W–L'**
  String get statWalkovers;

  /// No description provided for @streakWins.
  ///
  /// In en, this message translates to:
  /// **'{n}W'**
  String streakWins(int n);

  /// No description provided for @streakLosses.
  ///
  /// In en, this message translates to:
  /// **'{n}L'**
  String streakLosses(int n);

  /// No description provided for @statLastPlayed.
  ///
  /// In en, this message translates to:
  /// **'Last played {date}'**
  String statLastPlayed(String date);

  /// No description provided for @partnerMain.
  ///
  /// In en, this message translates to:
  /// **'Main partner'**
  String get partnerMain;

  /// No description provided for @partnerBestHistorical.
  ///
  /// In en, this message translates to:
  /// **'Best historical partner'**
  String get partnerBestHistorical;

  /// No description provided for @partnerMostPlayed.
  ///
  /// In en, this message translates to:
  /// **'Most played with'**
  String get partnerMostPlayed;

  /// No description provided for @partnerRecommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended partners'**
  String get partnerRecommended;

  /// No description provided for @partnerNotSet.
  ///
  /// In en, this message translates to:
  /// **'No main partner yet'**
  String get partnerNotSet;

  /// No description provided for @partnerNotSetHint.
  ///
  /// In en, this message translates to:
  /// **'Send a request — it becomes official when they accept.'**
  String get partnerNotSetHint;

  /// No description provided for @partnerUnlockHint.
  ///
  /// In en, this message translates to:
  /// **'Play {count} verified matches with the same partner to unlock this.'**
  String partnerUnlockHint(int count);

  /// No description provided for @partnerNoHistory.
  ///
  /// In en, this message translates to:
  /// **'No verified matches with a partner yet.'**
  String get partnerNoHistory;

  /// No description provided for @partnerRecord.
  ///
  /// In en, this message translates to:
  /// **'{won} W · {played} played'**
  String partnerRecord(int won, int played);

  /// No description provided for @partnerHistory.
  ///
  /// In en, this message translates to:
  /// **'Partnership history'**
  String get partnerHistory;

  /// No description provided for @partnerRequestAsMain.
  ///
  /// In en, this message translates to:
  /// **'Request as main partner'**
  String get partnerRequestAsMain;

  /// No description provided for @partnerRequestSent.
  ///
  /// In en, this message translates to:
  /// **'Partner request sent'**
  String get partnerRequestSent;

  /// No description provided for @partnerRemoveMain.
  ///
  /// In en, this message translates to:
  /// **'End partnership'**
  String get partnerRemoveMain;

  /// No description provided for @partnerRemoveMainConfirm.
  ///
  /// In en, this message translates to:
  /// **'They\'ll stop being your main partner. You can send a new request later.'**
  String get partnerRemoveMainConfirm;

  /// No description provided for @partnerRequestsTitle.
  ///
  /// In en, this message translates to:
  /// **'Partner requests'**
  String get partnerRequestsTitle;

  /// No description provided for @partnerRequestsIncoming.
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get partnerRequestsIncoming;

  /// No description provided for @partnerRequestsOutgoing.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get partnerRequestsOutgoing;

  /// No description provided for @partnerRequestsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No partner requests right now.'**
  String get partnerRequestsEmpty;

  /// No description provided for @partnerRequestFrom.
  ///
  /// In en, this message translates to:
  /// **'{name} wants you as main partner'**
  String partnerRequestFrom(String name);

  /// No description provided for @partnerRequestTo.
  ///
  /// In en, this message translates to:
  /// **'Waiting for {name}'**
  String partnerRequestTo(String name);

  /// No description provided for @partnerRequestAccepted.
  ///
  /// In en, this message translates to:
  /// **'You\'re now main partners'**
  String get partnerRequestAccepted;

  /// No description provided for @partnerRecommendedEmpty.
  ///
  /// In en, this message translates to:
  /// **'Play a few verified matches and we\'ll suggest partners that fit your game.'**
  String get partnerRecommendedEmpty;

  /// No description provided for @partnerRecommendedBasis.
  ///
  /// In en, this message translates to:
  /// **'Based on your rating {rating} and {matches} verified matches'**
  String partnerRecommendedBasis(String rating, int matches);

  /// No description provided for @factRatingDiff.
  ///
  /// In en, this message translates to:
  /// **'Rating gap {value}'**
  String factRatingDiff(String value);

  /// No description provided for @factTogether.
  ///
  /// In en, this message translates to:
  /// **'{wins}/{matches} wins together'**
  String factTogether(int wins, int matches);

  /// No description provided for @factVerifiedMatches.
  ///
  /// In en, this message translates to:
  /// **'{count} verified matches'**
  String factVerifiedMatches(int count);

  /// No description provided for @factWinRate.
  ///
  /// In en, this message translates to:
  /// **'Win rate {value}'**
  String factWinRate(String value);

  /// No description provided for @factLastPlayed.
  ///
  /// In en, this message translates to:
  /// **'Played {when}'**
  String factLastPlayed(String when);

  /// No description provided for @profileTabOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get profileTabOverview;

  /// No description provided for @profileTabResults.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get profileTabResults;

  /// No description provided for @profileTabAchievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get profileTabAchievements;

  /// No description provided for @profileTabPartners.
  ///
  /// In en, this message translates to:
  /// **'Partners'**
  String get profileTabPartners;

  /// No description provided for @profileTabStats.
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get profileTabStats;

  /// No description provided for @profileMemberSince.
  ///
  /// In en, this message translates to:
  /// **'Member since {date}'**
  String profileMemberSince(String date);

  /// No description provided for @profileFollowers.
  ///
  /// In en, this message translates to:
  /// **'Followers'**
  String get profileFollowers;

  /// No description provided for @profileFollowing.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get profileFollowing;

  /// No description provided for @profileRespects.
  ///
  /// In en, this message translates to:
  /// **'Respects'**
  String get profileRespects;

  /// No description provided for @profileEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get profileEdit;

  /// No description provided for @profileContact.
  ///
  /// In en, this message translates to:
  /// **'Contact (only you can see this)'**
  String get profileContact;

  /// No description provided for @profileRecentResults.
  ///
  /// In en, this message translates to:
  /// **'Recent results'**
  String get profileRecentResults;

  /// No description provided for @profileTournamentHistory.
  ///
  /// In en, this message translates to:
  /// **'Tournament history'**
  String get profileTournamentHistory;

  /// No description provided for @profileNoResults.
  ///
  /// In en, this message translates to:
  /// **'No verified results yet'**
  String get profileNoResults;

  /// No description provided for @profileNoResultsHint.
  ///
  /// In en, this message translates to:
  /// **'Official results appear here once staff verify them.'**
  String get profileNoResultsHint;

  /// No description provided for @profile3dIdentity.
  ///
  /// In en, this message translates to:
  /// **'3D identity'**
  String get profile3dIdentity;

  /// No description provided for @profileRatingHistory.
  ///
  /// In en, this message translates to:
  /// **'Rating history'**
  String get profileRatingHistory;

  /// No description provided for @profileSeasonHistory.
  ///
  /// In en, this message translates to:
  /// **'Season points'**
  String get profileSeasonHistory;

  /// No description provided for @profileRespectSent.
  ///
  /// In en, this message translates to:
  /// **'Respect sent'**
  String get profileRespectSent;

  /// No description provided for @resultWon.
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get resultWon;

  /// No description provided for @resultLost.
  ///
  /// In en, this message translates to:
  /// **'L'**
  String get resultLost;

  /// No description provided for @resultRanked.
  ///
  /// In en, this message translates to:
  /// **'Ranked'**
  String get resultRanked;

  /// No description provided for @resultUnranked.
  ///
  /// In en, this message translates to:
  /// **'Unranked'**
  String get resultUnranked;

  /// No description provided for @resultWithPartner.
  ///
  /// In en, this message translates to:
  /// **'with {name}'**
  String resultWithPartner(String name);

  /// No description provided for @placementChampion.
  ///
  /// In en, this message translates to:
  /// **'Champion'**
  String get placementChampion;

  /// No description provided for @placementFinalist.
  ///
  /// In en, this message translates to:
  /// **'Finalist'**
  String get placementFinalist;

  /// No description provided for @achievementsTitle.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievementsTitle;

  /// No description provided for @achievementsProgress.
  ///
  /// In en, this message translates to:
  /// **'{unlocked} of {total} unlocked'**
  String achievementsProgress(int unlocked, int total);

  /// No description provided for @achievementsCompetitive.
  ///
  /// In en, this message translates to:
  /// **'Competitive'**
  String get achievementsCompetitive;

  /// No description provided for @achievementsSocial.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get achievementsSocial;

  /// No description provided for @achievementsPremiumShelf.
  ///
  /// In en, this message translates to:
  /// **'Premium badges'**
  String get achievementsPremiumShelf;

  /// No description provided for @achievementsPremiumNote.
  ///
  /// In en, this message translates to:
  /// **'Premium badges are cosmetic — they never affect rating or ranking.'**
  String get achievementsPremiumNote;

  /// No description provided for @achievementsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No achievements yet'**
  String get achievementsEmpty;

  /// No description provided for @achievementAutomatic.
  ///
  /// In en, this message translates to:
  /// **'Unlocks automatically'**
  String get achievementAutomatic;

  /// No description provided for @statsAdvanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced analytics'**
  String get statsAdvanced;

  /// No description provided for @statsByStage.
  ///
  /// In en, this message translates to:
  /// **'By stage'**
  String get statsByStage;

  /// No description provided for @statsGroupStage.
  ///
  /// In en, this message translates to:
  /// **'Group stage'**
  String get statsGroupStage;

  /// No description provided for @statsKnockout.
  ///
  /// In en, this message translates to:
  /// **'Knockout'**
  String get statsKnockout;

  /// No description provided for @statsDecidingSets.
  ///
  /// In en, this message translates to:
  /// **'Deciding sets'**
  String get statsDecidingSets;

  /// No description provided for @statsByCompetition.
  ///
  /// In en, this message translates to:
  /// **'Ranked vs unranked'**
  String get statsByCompetition;

  /// No description provided for @statsPointAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Point analytics'**
  String get statsPointAnalytics;

  /// No description provided for @statsCoverage.
  ///
  /// In en, this message translates to:
  /// **'Coverage {value}'**
  String statsCoverage(String value);

  /// No description provided for @statsLimitedData.
  ///
  /// In en, this message translates to:
  /// **'Limited data'**
  String get statsLimitedData;

  /// No description provided for @statsWinnersByShot.
  ///
  /// In en, this message translates to:
  /// **'Winners by shot'**
  String get statsWinnersByShot;

  /// No description provided for @statsErrorsByType.
  ///
  /// In en, this message translates to:
  /// **'Errors by type'**
  String get statsErrorsByType;

  /// No description provided for @statsRatingTimeline.
  ///
  /// In en, this message translates to:
  /// **'Rating timeline'**
  String get statsRatingTimeline;

  /// No description provided for @statsAdvancedLocked.
  ///
  /// In en, this message translates to:
  /// **'Advanced analytics are available to Premium members on their own profile.'**
  String get statsAdvancedLocked;

  /// No description provided for @statsRecord.
  ///
  /// In en, this message translates to:
  /// **'{wins}/{matches}'**
  String statsRecord(int wins, int matches);

  /// No description provided for @followersTitle.
  ///
  /// In en, this message translates to:
  /// **'Followers'**
  String get followersTitle;

  /// No description provided for @followingTitle.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get followingTitle;

  /// No description provided for @followersEmpty.
  ///
  /// In en, this message translates to:
  /// **'Nobody here yet'**
  String get followersEmpty;

  /// No description provided for @ratingHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Rating history'**
  String get ratingHistoryTitle;

  /// No description provided for @ratingReasonOfficial.
  ///
  /// In en, this message translates to:
  /// **'Official result'**
  String get ratingReasonOfficial;

  /// No description provided for @ratingReasonCorrection.
  ///
  /// In en, this message translates to:
  /// **'Correction reversal'**
  String get ratingReasonCorrection;

  /// No description provided for @ratingReasonInactivity.
  ///
  /// In en, this message translates to:
  /// **'Inactivity'**
  String get ratingReasonInactivity;

  /// No description provided for @ratingBreakdown.
  ///
  /// In en, this message translates to:
  /// **'How it was calculated'**
  String get ratingBreakdown;

  /// No description provided for @ratingExpected.
  ///
  /// In en, this message translates to:
  /// **'Expected score'**
  String get ratingExpected;

  /// No description provided for @ratingKFactor.
  ///
  /// In en, this message translates to:
  /// **'Effective K'**
  String get ratingKFactor;

  /// No description provided for @ratingOwnStrength.
  ///
  /// In en, this message translates to:
  /// **'Your team strength'**
  String get ratingOwnStrength;

  /// No description provided for @ratingOpponentStrength.
  ///
  /// In en, this message translates to:
  /// **'Opponent strength'**
  String get ratingOpponentStrength;

  /// No description provided for @ratingUpset.
  ///
  /// In en, this message translates to:
  /// **'Upset'**
  String get ratingUpset;

  /// No description provided for @ratingStage.
  ///
  /// In en, this message translates to:
  /// **'Stage'**
  String get ratingStage;

  /// No description provided for @ratingHistoryEmpty.
  ///
  /// In en, this message translates to:
  /// **'No rating changes yet'**
  String get ratingHistoryEmpty;

  /// No description provided for @seasonPointsTitle.
  ///
  /// In en, this message translates to:
  /// **'Season points'**
  String get seasonPointsTitle;

  /// No description provided for @seasonBestStageNote.
  ///
  /// In en, this message translates to:
  /// **'Each category counts once — the best stage you reached.'**
  String get seasonBestStageNote;

  /// No description provided for @challengesTitle.
  ///
  /// In en, this message translates to:
  /// **'Challenges'**
  String get challengesTitle;

  /// No description provided for @challengesIncoming.
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get challengesIncoming;

  /// No description provided for @challengesOutgoing.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get challengesOutgoing;

  /// No description provided for @challengesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No challenges'**
  String get challengesEmpty;

  /// No description provided for @challengeFrom.
  ///
  /// In en, this message translates to:
  /// **'{name} challenged you'**
  String challengeFrom(String name);

  /// No description provided for @challengeTo.
  ///
  /// In en, this message translates to:
  /// **'You challenged {name}'**
  String challengeTo(String name);

  /// No description provided for @searchPlayersTitle.
  ///
  /// In en, this message translates to:
  /// **'Find players'**
  String get searchPlayersTitle;

  /// No description provided for @searchPlayersHint.
  ///
  /// In en, this message translates to:
  /// **'Name or Player ID'**
  String get searchPlayersHint;

  /// No description provided for @searchPlayersEmpty.
  ///
  /// In en, this message translates to:
  /// **'No players match your search'**
  String get searchPlayersEmpty;

  /// No description provided for @editProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get editProfileTitle;

  /// No description provided for @editProfileCompetitiveNote.
  ///
  /// In en, this message translates to:
  /// **'Rating, level, points and XP come from verified results and can\'t be edited.'**
  String get editProfileCompetitiveNote;

  /// No description provided for @editProfilePhoto.
  ///
  /// In en, this message translates to:
  /// **'Change photo'**
  String get editProfilePhoto;

  /// No description provided for @editProfilePhotoHint.
  ///
  /// In en, this message translates to:
  /// **'JPG, PNG or WebP · up to 4 MB. Also used for your 3D identity.'**
  String get editProfilePhotoHint;

  /// No description provided for @editProfileSaved.
  ///
  /// In en, this message translates to:
  /// **'Profile saved'**
  String get editProfileSaved;

  /// No description provided for @fieldBio.
  ///
  /// In en, this message translates to:
  /// **'Bio'**
  String get fieldBio;

  /// No description provided for @fieldDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get fieldDateOfBirth;

  /// No description provided for @fieldGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get fieldGender;

  /// No description provided for @fieldSide.
  ///
  /// In en, this message translates to:
  /// **'Playing side'**
  String get fieldSide;

  /// No description provided for @changePasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePasswordTitle;

  /// No description provided for @fieldCurrentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get fieldCurrentPassword;

  /// No description provided for @fieldNewPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get fieldNewPassword;

  /// No description provided for @passwordChanged.
  ///
  /// In en, this message translates to:
  /// **'Password changed. Other sessions were signed out.'**
  String get passwordChanged;

  /// No description provided for @premiumTitle.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premiumTitle;

  /// No description provided for @premiumHeadline.
  ///
  /// In en, this message translates to:
  /// **'Train smarter. Compete the same.'**
  String get premiumHeadline;

  /// No description provided for @premiumSubhead.
  ///
  /// In en, this message translates to:
  /// **'Insights and analytics built only from your real, verified matches.'**
  String get premiumSubhead;

  /// No description provided for @premiumNeverAffects.
  ///
  /// In en, this message translates to:
  /// **'Premium never affects your {items}.'**
  String premiumNeverAffects(String items);

  /// No description provided for @premiumNeverAffectsDefault.
  ///
  /// In en, this message translates to:
  /// **'Premium never affects your Skill Rating, Season Ranking, seeding or eligibility.'**
  String get premiumNeverAffectsDefault;

  /// No description provided for @neverSkillRating.
  ///
  /// In en, this message translates to:
  /// **'Skill Rating'**
  String get neverSkillRating;

  /// No description provided for @neverSeasonRanking.
  ///
  /// In en, this message translates to:
  /// **'Season Ranking'**
  String get neverSeasonRanking;

  /// No description provided for @neverSeeding.
  ///
  /// In en, this message translates to:
  /// **'seeding'**
  String get neverSeeding;

  /// No description provided for @neverEligibility.
  ///
  /// In en, this message translates to:
  /// **'tournament eligibility'**
  String get neverEligibility;

  /// No description provided for @neverOfficialResults.
  ///
  /// In en, this message translates to:
  /// **'official results'**
  String get neverOfficialResults;

  /// No description provided for @premiumFeatureAi.
  ///
  /// In en, this message translates to:
  /// **'AI insights'**
  String get premiumFeatureAi;

  /// No description provided for @premiumFeatureAiBody.
  ///
  /// In en, this message translates to:
  /// **'Daily briefs, performance summaries and recommendations.'**
  String get premiumFeatureAiBody;

  /// No description provided for @premiumFeatureAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Advanced analytics'**
  String get premiumFeatureAnalytics;

  /// No description provided for @premiumFeatureAnalyticsBody.
  ///
  /// In en, this message translates to:
  /// **'Stage splits, deciding sets, shot and error breakdowns.'**
  String get premiumFeatureAnalyticsBody;

  /// No description provided for @premiumFeature3d.
  ///
  /// In en, this message translates to:
  /// **'3D athlete identity'**
  String get premiumFeature3d;

  /// No description provided for @premiumFeature3dBody.
  ///
  /// In en, this message translates to:
  /// **'A rotating 3D avatar generated from your profile photo.'**
  String get premiumFeature3dBody;

  /// No description provided for @premiumFeatureBadges.
  ///
  /// In en, this message translates to:
  /// **'Premium badges'**
  String get premiumFeatureBadges;

  /// No description provided for @premiumFeatureBadgesBody.
  ///
  /// In en, this message translates to:
  /// **'Cosmetic badges, clearly separate from competitive medals.'**
  String get premiumFeatureBadgesBody;

  /// No description provided for @premiumPlansTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a plan'**
  String get premiumPlansTitle;

  /// No description provided for @premiumPlanMonths.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 month} other{{count} months}}'**
  String premiumPlanMonths(int count);

  /// No description provided for @premiumPlansUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Plans will appear here once pricing is published.'**
  String get premiumPlansUnavailable;

  /// No description provided for @premiumCheckoutSoon.
  ///
  /// In en, this message translates to:
  /// **'Online payments coming soon'**
  String get premiumCheckoutSoon;

  /// No description provided for @premiumSubscribe.
  ///
  /// In en, this message translates to:
  /// **'Continue to payment'**
  String get premiumSubscribe;

  /// No description provided for @premiumActive.
  ///
  /// In en, this message translates to:
  /// **'You\'re Premium'**
  String get premiumActive;

  /// No description provided for @premiumActiveUntil.
  ///
  /// In en, this message translates to:
  /// **'Active until {date}'**
  String premiumActiveUntil(String date);

  /// No description provided for @premiumOpenAi.
  ///
  /// In en, this message translates to:
  /// **'Open AI insights'**
  String get premiumOpenAi;

  /// No description provided for @premiumOpen3d.
  ///
  /// In en, this message translates to:
  /// **'Open 3D identity'**
  String get premiumOpen3d;

  /// No description provided for @paymentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get paymentsTitle;

  /// No description provided for @paymentsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No payments yet'**
  String get paymentsEmpty;

  /// No description provided for @paymentStatusTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment status'**
  String get paymentStatusTitle;

  /// No description provided for @paymentWaiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting for confirmation from the payment provider…'**
  String get paymentWaiting;

  /// No description provided for @paymentOpenCheckout.
  ///
  /// In en, this message translates to:
  /// **'Open checkout'**
  String get paymentOpenCheckout;

  /// No description provided for @paymentSucceeded.
  ///
  /// In en, this message translates to:
  /// **'Payment confirmed'**
  String get paymentSucceeded;

  /// No description provided for @paymentFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment didn\'t go through'**
  String get paymentFailedTitle;

  /// No description provided for @paymentReference.
  ///
  /// In en, this message translates to:
  /// **'Reference {ref}'**
  String paymentReference(String ref);

  /// No description provided for @paymentOnlyBackend.
  ///
  /// In en, this message translates to:
  /// **'We only mark a payment as paid once the server confirms it.'**
  String get paymentOnlyBackend;

  /// No description provided for @aiTitle.
  ///
  /// In en, this message translates to:
  /// **'AI insights'**
  String get aiTitle;

  /// No description provided for @aiGenerate.
  ///
  /// In en, this message translates to:
  /// **'Generate'**
  String get aiGenerate;

  /// No description provided for @aiRefresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get aiRefresh;

  /// No description provided for @aiWorking.
  ///
  /// In en, this message translates to:
  /// **'Analysing your matches…'**
  String get aiWorking;

  /// No description provided for @aiFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t generate this insight.'**
  String get aiFailed;

  /// No description provided for @aiNotGenerated.
  ///
  /// In en, this message translates to:
  /// **'Not generated yet'**
  String get aiNotGenerated;

  /// No description provided for @aiCoverage.
  ///
  /// In en, this message translates to:
  /// **'Data coverage: {level}'**
  String aiCoverage(String level);

  /// No description provided for @aiCoverageNone.
  ///
  /// In en, this message translates to:
  /// **'none'**
  String get aiCoverageNone;

  /// No description provided for @aiCoverageLow.
  ///
  /// In en, this message translates to:
  /// **'low'**
  String get aiCoverageLow;

  /// No description provided for @aiCoverageMedium.
  ///
  /// In en, this message translates to:
  /// **'medium'**
  String get aiCoverageMedium;

  /// No description provided for @aiCoverageHigh.
  ///
  /// In en, this message translates to:
  /// **'high'**
  String get aiCoverageHigh;

  /// No description provided for @aiMatchesUsed.
  ///
  /// In en, this message translates to:
  /// **'{count} matches used'**
  String aiMatchesUsed(int count);

  /// No description provided for @aiHighlights.
  ///
  /// In en, this message translates to:
  /// **'Highlights'**
  String get aiHighlights;

  /// No description provided for @aiRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Recommendations'**
  String get aiRecommendations;

  /// No description provided for @aiFacts.
  ///
  /// In en, this message translates to:
  /// **'The facts'**
  String get aiFacts;

  /// No description provided for @aiGeneratedAt.
  ///
  /// In en, this message translates to:
  /// **'Generated {when}'**
  String aiGeneratedAt(String when);

  /// No description provided for @aiTypePlayerInsights.
  ///
  /// In en, this message translates to:
  /// **'Player insights'**
  String get aiTypePlayerInsights;

  /// No description provided for @aiTypePerformanceSummary.
  ///
  /// In en, this message translates to:
  /// **'Performance summary'**
  String get aiTypePerformanceSummary;

  /// No description provided for @aiTypePartnerRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Partner recommendation'**
  String get aiTypePartnerRecommendation;

  /// No description provided for @aiTypeTournamentRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Tournament recommendation'**
  String get aiTypeTournamentRecommendation;

  /// No description provided for @aiTypeCoachRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Coach recommendation'**
  String get aiTypeCoachRecommendation;

  /// No description provided for @aiTypeDevelopmentRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Development plan'**
  String get aiTypeDevelopmentRecommendation;

  /// No description provided for @aiTypeDailyBrief.
  ///
  /// In en, this message translates to:
  /// **'Daily brief'**
  String get aiTypeDailyBrief;

  /// No description provided for @threeDTitle.
  ///
  /// In en, this message translates to:
  /// **'3D identity'**
  String get threeDTitle;

  /// No description provided for @threeDGenerate.
  ///
  /// In en, this message translates to:
  /// **'Generate my 3D identity'**
  String get threeDGenerate;

  /// No description provided for @threeDRegenerate.
  ///
  /// In en, this message translates to:
  /// **'Generate again'**
  String get threeDRegenerate;

  /// No description provided for @threeDProcessing.
  ///
  /// In en, this message translates to:
  /// **'Building your 3D identity. This can take a few minutes.'**
  String get threeDProcessing;

  /// No description provided for @threeDNeedsPhoto.
  ///
  /// In en, this message translates to:
  /// **'Upload a profile photo first — your 3D identity is generated from it.'**
  String get threeDNeedsPhoto;

  /// No description provided for @threeDUploadPhoto.
  ///
  /// In en, this message translates to:
  /// **'Upload photo'**
  String get threeDUploadPhoto;

  /// No description provided for @threeDFailed.
  ///
  /// In en, this message translates to:
  /// **'Generation failed. You can try again.'**
  String get threeDFailed;

  /// No description provided for @threeDEmpty.
  ///
  /// In en, this message translates to:
  /// **'No 3D identity yet'**
  String get threeDEmpty;

  /// No description provided for @bookingStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get bookingStatus;

  /// No description provided for @bookingPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get bookingPrice;

  /// No description provided for @bookingDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get bookingDuration;

  /// No description provided for @bookingLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get bookingLocation;

  /// No description provided for @bookingTrainingType.
  ///
  /// In en, this message translates to:
  /// **'Training type'**
  String get bookingTrainingType;

  /// No description provided for @bookingNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get bookingNotes;

  /// No description provided for @bookingFeedback.
  ///
  /// In en, this message translates to:
  /// **'Coach feedback'**
  String get bookingFeedback;

  /// No description provided for @bookingXpAwarded.
  ///
  /// In en, this message translates to:
  /// **'+{xp} XP earned'**
  String bookingXpAwarded(int xp);

  /// No description provided for @bookingCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel booking'**
  String get bookingCancel;

  /// No description provided for @bookingCancelReason.
  ///
  /// In en, this message translates to:
  /// **'Reason (optional)'**
  String get bookingCancelReason;

  /// No description provided for @bookingCancelled.
  ///
  /// In en, this message translates to:
  /// **'Booking cancelled'**
  String get bookingCancelled;

  /// No description provided for @bookingCancelWindow.
  ///
  /// In en, this message translates to:
  /// **'Confirmed bookings can be cancelled up to 24 hours before the start.'**
  String get bookingCancelWindow;

  /// No description provided for @bookingReview.
  ///
  /// In en, this message translates to:
  /// **'Rate this session'**
  String get bookingReview;

  /// No description provided for @bookingReviewComment.
  ///
  /// In en, this message translates to:
  /// **'Comment (optional)'**
  String get bookingReviewComment;

  /// No description provided for @bookingReviewThanks.
  ///
  /// In en, this message translates to:
  /// **'Thanks for the review'**
  String get bookingReviewThanks;

  /// No description provided for @bookingYourReview.
  ///
  /// In en, this message translates to:
  /// **'Your review'**
  String get bookingYourReview;

  /// No description provided for @bookingRejectedReason.
  ///
  /// In en, this message translates to:
  /// **'Rejected: {reason}'**
  String bookingRejectedReason(String reason);

  /// No description provided for @bookingCancelledBy.
  ///
  /// In en, this message translates to:
  /// **'Cancelled by {who}'**
  String bookingCancelledBy(String who);

  /// No description provided for @bookingByPlayer.
  ///
  /// In en, this message translates to:
  /// **'player'**
  String get bookingByPlayer;

  /// No description provided for @bookingByCoach.
  ///
  /// In en, this message translates to:
  /// **'coach'**
  String get bookingByCoach;

  /// No description provided for @bookingProgressRecorded.
  ///
  /// In en, this message translates to:
  /// **'Progress recorded'**
  String get bookingProgressRecorded;

  /// No description provided for @bookingDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Training session'**
  String get bookingDetailTitle;

  /// No description provided for @competeTitle.
  ///
  /// In en, this message translates to:
  /// **'Compete'**
  String get competeTitle;

  /// No description provided for @competeTabTournaments.
  ///
  /// In en, this message translates to:
  /// **'Tournaments'**
  String get competeTabTournaments;

  /// No description provided for @competeTabLive.
  ///
  /// In en, this message translates to:
  /// **'Live now'**
  String get competeTabLive;

  /// No description provided for @competeSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search tournaments'**
  String get competeSearchHint;

  /// No description provided for @filterRanked.
  ///
  /// In en, this message translates to:
  /// **'Ranked'**
  String get filterRanked;

  /// No description provided for @filterCertified.
  ///
  /// In en, this message translates to:
  /// **'Official'**
  String get filterCertified;

  /// No description provided for @filterSocial.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get filterSocial;

  /// No description provided for @filterUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get filterUpcoming;

  /// No description provided for @liveNowEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No matches on court right now'**
  String get liveNowEmptyTitle;

  /// No description provided for @liveNowEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Live matches appear here the moment a scorekeeper starts one.'**
  String get liveNowEmptyMessage;

  /// No description provided for @tournamentTabOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get tournamentTabOverview;

  /// No description provided for @tournamentTabLive.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get tournamentTabLive;

  /// No description provided for @tournamentTabSchedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get tournamentTabSchedule;

  /// No description provided for @tournamentTabResults.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get tournamentTabResults;

  /// No description provided for @tournamentRules.
  ///
  /// In en, this message translates to:
  /// **'Rules'**
  String get tournamentRules;

  /// No description provided for @tournamentAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get tournamentAbout;

  /// No description provided for @tournamentOpenMap.
  ///
  /// In en, this message translates to:
  /// **'Open in maps'**
  String get tournamentOpenMap;

  /// No description provided for @tournamentRegistrationWindow.
  ///
  /// In en, this message translates to:
  /// **'Registration {from} – {to}'**
  String tournamentRegistrationWindow(String from, String to);

  /// No description provided for @tournamentChampion.
  ///
  /// In en, this message translates to:
  /// **'Champion'**
  String get tournamentChampion;

  /// No description provided for @tournamentNoLive.
  ///
  /// In en, this message translates to:
  /// **'No live matches in this tournament right now.'**
  String get tournamentNoLive;

  /// No description provided for @tournamentNoSchedule.
  ///
  /// In en, this message translates to:
  /// **'The schedule hasn\'t been published yet.'**
  String get tournamentNoSchedule;

  /// No description provided for @tournamentNoResults.
  ///
  /// In en, this message translates to:
  /// **'No verified results yet.'**
  String get tournamentNoResults;

  /// No description provided for @tournamentRankedNote.
  ///
  /// In en, this message translates to:
  /// **'Verified results here move Skill Rating and Season Points.'**
  String get tournamentRankedNote;

  /// No description provided for @tournamentUnrankedNote.
  ///
  /// In en, this message translates to:
  /// **'Results here don\'t affect Skill Rating or Season Ranking.'**
  String get tournamentUnrankedNote;

  /// No description provided for @categoryRegister.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get categoryRegister;

  /// No description provided for @categoryJoinWaitlist.
  ///
  /// In en, this message translates to:
  /// **'Join waitlist'**
  String get categoryJoinWaitlist;

  /// No description provided for @categoryRegistered.
  ///
  /// In en, this message translates to:
  /// **'Registered'**
  String get categoryRegistered;

  /// No description provided for @categoryView.
  ///
  /// In en, this message translates to:
  /// **'Teams, groups & bracket'**
  String get categoryView;

  /// No description provided for @categoryWaitlist.
  ///
  /// In en, this message translates to:
  /// **'{count} on waitlist'**
  String categoryWaitlist(int count);

  /// No description provided for @categoryTabTeams.
  ///
  /// In en, this message translates to:
  /// **'Teams'**
  String get categoryTabTeams;

  /// No description provided for @categoryTabGroups.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get categoryTabGroups;

  /// No description provided for @categoryTabBracket.
  ///
  /// In en, this message translates to:
  /// **'Bracket'**
  String get categoryTabBracket;

  /// No description provided for @categoryNoTeams.
  ///
  /// In en, this message translates to:
  /// **'No teams yet'**
  String get categoryNoTeams;

  /// No description provided for @categoryNoGroups.
  ///
  /// In en, this message translates to:
  /// **'Groups will appear once the draw is made.'**
  String get categoryNoGroups;

  /// No description provided for @categoryNoBracket.
  ///
  /// In en, this message translates to:
  /// **'The bracket is generated after the group stage.'**
  String get categoryNoBracket;

  /// No description provided for @teamWithdrawn.
  ///
  /// In en, this message translates to:
  /// **'Withdrawn'**
  String get teamWithdrawn;

  /// No description provided for @teamDisqualified.
  ///
  /// In en, this message translates to:
  /// **'Disqualified'**
  String get teamDisqualified;

  /// No description provided for @teamSeed.
  ///
  /// In en, this message translates to:
  /// **'Seed {seed}'**
  String teamSeed(int seed);

  /// No description provided for @standingsPlayed.
  ///
  /// In en, this message translates to:
  /// **'P'**
  String get standingsPlayed;

  /// No description provided for @standingsWins.
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get standingsWins;

  /// No description provided for @standingsLosses.
  ///
  /// In en, this message translates to:
  /// **'L'**
  String get standingsLosses;

  /// No description provided for @standingsSetDiff.
  ///
  /// In en, this message translates to:
  /// **'SD'**
  String get standingsSetDiff;

  /// No description provided for @standingsGameDiff.
  ///
  /// In en, this message translates to:
  /// **'GD'**
  String get standingsGameDiff;

  /// No description provided for @standingsPoints.
  ///
  /// In en, this message translates to:
  /// **'Pts'**
  String get standingsPoints;

  /// No description provided for @standingsTeam.
  ///
  /// In en, this message translates to:
  /// **'Team'**
  String get standingsTeam;

  /// No description provided for @groupFinished.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get groupFinished;

  /// No description provided for @registerTitle2.
  ///
  /// In en, this message translates to:
  /// **'Register for {category}'**
  String registerTitle2(String category);

  /// No description provided for @registerPartner.
  ///
  /// In en, this message translates to:
  /// **'Partner'**
  String get registerPartner;

  /// No description provided for @registerPickPartner.
  ///
  /// In en, this message translates to:
  /// **'Choose a partner'**
  String get registerPickPartner;

  /// No description provided for @registerChangePartner.
  ///
  /// In en, this message translates to:
  /// **'Change partner'**
  String get registerChangePartner;

  /// No description provided for @registerCheckEligibility.
  ///
  /// In en, this message translates to:
  /// **'Checking eligibility…'**
  String get registerCheckEligibility;

  /// No description provided for @registerEligible.
  ///
  /// In en, this message translates to:
  /// **'You\'re eligible'**
  String get registerEligible;

  /// No description provided for @registerYourIssues.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get registerYourIssues;

  /// No description provided for @registerPartnerIssues.
  ///
  /// In en, this message translates to:
  /// **'Your partner'**
  String get registerPartnerIssues;

  /// No description provided for @registerClosed.
  ///
  /// In en, this message translates to:
  /// **'Registration is closed'**
  String get registerClosed;

  /// No description provided for @registerFullWaitlist.
  ///
  /// In en, this message translates to:
  /// **'This category is full — you\'ll join the waiting list and be promoted automatically if a spot opens.'**
  String get registerFullWaitlist;

  /// No description provided for @registerFeeNote.
  ///
  /// In en, this message translates to:
  /// **'Registration fee {amount}. Payment is confirmed by the organizer\'s system.'**
  String registerFeeNote(String amount);

  /// No description provided for @registerSubmit.
  ///
  /// In en, this message translates to:
  /// **'Confirm registration'**
  String get registerSubmit;

  /// No description provided for @registerDone.
  ///
  /// In en, this message translates to:
  /// **'You\'re registered'**
  String get registerDone;

  /// No description provided for @registerWaitlisted.
  ///
  /// In en, this message translates to:
  /// **'You\'re on the waiting list'**
  String get registerWaitlisted;

  /// No description provided for @myRegistrationsTitle.
  ///
  /// In en, this message translates to:
  /// **'My registrations'**
  String get myRegistrationsTitle;

  /// No description provided for @myRegistrationsEmpty.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t registered for a tournament yet'**
  String get myRegistrationsEmpty;

  /// No description provided for @registrationCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel registration'**
  String get registrationCancel;

  /// No description provided for @registrationPartnerInvite.
  ///
  /// In en, this message translates to:
  /// **'{name} wants you as a partner in this tournament. Confirm to send it to the organizer.'**
  String registrationPartnerInvite(String name);

  /// No description provided for @registrationPartnerAccept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get registrationPartnerAccept;

  /// No description provided for @registrationPartnerDecline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get registrationPartnerDecline;

  /// No description provided for @registrationPartnerDeclineConfirm.
  ///
  /// In en, this message translates to:
  /// **'Decline playing in this tournament as a pair?'**
  String get registrationPartnerDeclineConfirm;

  /// No description provided for @registrationPartnerAcceptedSnack.
  ///
  /// In en, this message translates to:
  /// **'Confirmed — the organizer will now review the registration'**
  String get registrationPartnerAcceptedSnack;

  /// No description provided for @registrationPartnerDeclinedSnack.
  ///
  /// In en, this message translates to:
  /// **'Invitation declined'**
  String get registrationPartnerDeclinedSnack;

  /// No description provided for @registrationAwaitingPartnerHint.
  ///
  /// In en, this message translates to:
  /// **'Waiting for your partner to confirm before the organizer reviews it.'**
  String get registrationAwaitingPartnerHint;

  /// No description provided for @registrationPartnerDeclinedHint.
  ///
  /// In en, this message translates to:
  /// **'Your partner declined. Choose another partner or cancel the registration.'**
  String get registrationPartnerDeclinedHint;

  /// No description provided for @registrationCancelConfirm.
  ///
  /// In en, this message translates to:
  /// **'Your spot will be released.'**
  String get registrationCancelConfirm;

  /// No description provided for @registrationCancelled.
  ///
  /// In en, this message translates to:
  /// **'Registration cancelled'**
  String get registrationCancelled;

  /// No description provided for @registrationPay.
  ///
  /// In en, this message translates to:
  /// **'Pay now'**
  String get registrationPay;

  /// No description provided for @registrationPartnerChanged.
  ///
  /// In en, this message translates to:
  /// **'Partner updated'**
  String get registrationPartnerChanged;

  /// No description provided for @registrationPromoted.
  ///
  /// In en, this message translates to:
  /// **'Promoted from waitlist {date}'**
  String registrationPromoted(String date);

  /// No description provided for @liveTitle.
  ///
  /// In en, this message translates to:
  /// **'Match centre'**
  String get liveTitle;

  /// No description provided for @livePointFeed.
  ///
  /// In en, this message translates to:
  /// **'Point by point'**
  String get livePointFeed;

  /// No description provided for @livePointFeedEmpty.
  ///
  /// In en, this message translates to:
  /// **'No points recorded yet.'**
  String get livePointFeedEmpty;

  /// No description provided for @liveTiebreak.
  ///
  /// In en, this message translates to:
  /// **'Tie-break'**
  String get liveTiebreak;

  /// No description provided for @liveMatchOver.
  ///
  /// In en, this message translates to:
  /// **'Match over'**
  String get liveMatchOver;

  /// No description provided for @liveWinnerTitle.
  ///
  /// In en, this message translates to:
  /// **'{team} win!'**
  String liveWinnerTitle(String team);

  /// No description provided for @liveResultPending.
  ///
  /// In en, this message translates to:
  /// **'Result pending staff verification'**
  String get liveResultPending;

  /// No description provided for @livePartialDetail.
  ///
  /// In en, this message translates to:
  /// **'Partial detail'**
  String get livePartialDetail;

  /// No description provided for @livePointBy.
  ///
  /// In en, this message translates to:
  /// **'Point to {team}'**
  String livePointBy(String team);

  /// No description provided for @liveNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Not started'**
  String get liveNotStarted;

  /// No description provided for @liveCorrected.
  ///
  /// In en, this message translates to:
  /// **'Corrected'**
  String get liveCorrected;

  /// No description provided for @rankingsTabSeason.
  ///
  /// In en, this message translates to:
  /// **'Season'**
  String get rankingsTabSeason;

  /// No description provided for @rankingsTabSkill.
  ///
  /// In en, this message translates to:
  /// **'Skill'**
  String get rankingsTabSkill;

  /// No description provided for @rankingsTabXp.
  ///
  /// In en, this message translates to:
  /// **'XP'**
  String get rankingsTabXp;

  /// No description provided for @rankingsYou.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get rankingsYou;

  /// No description provided for @rankingsSeasonPicker.
  ///
  /// In en, this message translates to:
  /// **'Season'**
  String get rankingsSeasonPicker;

  /// No description provided for @rankingsSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search the board'**
  String get rankingsSearchHint;

  /// No description provided for @rankingsXpNote.
  ///
  /// In en, this message translates to:
  /// **'XP rewards activity. It never affects ranking or seeding.'**
  String get rankingsXpNote;

  /// No description provided for @rankingsSkillNote.
  ///
  /// In en, this message translates to:
  /// **'Skill Rating moves only with verified results from ranked tournaments.'**
  String get rankingsSkillNote;

  /// No description provided for @rankingsSeasonNote.
  ///
  /// In en, this message translates to:
  /// **'Season points count your best stage per category.'**
  String get rankingsSeasonNote;

  /// No description provided for @rankingsLevelPosition.
  ///
  /// In en, this message translates to:
  /// **'#{position} in {level}'**
  String rankingsLevelPosition(int position, String level);

  /// No description provided for @playTitle.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get playTitle;

  /// No description provided for @playTabCasual.
  ///
  /// In en, this message translates to:
  /// **'Casual'**
  String get playTabCasual;

  /// No description provided for @playTabCoaches.
  ///
  /// In en, this message translates to:
  /// **'Coaches'**
  String get playTabCoaches;

  /// No description provided for @casualMyMatches.
  ///
  /// In en, this message translates to:
  /// **'My games'**
  String get casualMyMatches;

  /// No description provided for @casualCreated.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get casualCreated;

  /// No description provided for @casualJoined.
  ///
  /// In en, this message translates to:
  /// **'Joined'**
  String get casualJoined;

  /// No description provided for @casualDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Casual game'**
  String get casualDetailTitle;

  /// No description provided for @casualParticipants.
  ///
  /// In en, this message translates to:
  /// **'Players'**
  String get casualParticipants;

  /// No description provided for @casualRequests.
  ///
  /// In en, this message translates to:
  /// **'Join requests'**
  String get casualRequests;

  /// No description provided for @casualNoRequests.
  ///
  /// In en, this message translates to:
  /// **'No pending requests'**
  String get casualNoRequests;

  /// No description provided for @casualLeave.
  ///
  /// In en, this message translates to:
  /// **'Leave game'**
  String get casualLeave;

  /// No description provided for @casualCancelGame.
  ///
  /// In en, this message translates to:
  /// **'Cancel game'**
  String get casualCancelGame;

  /// No description provided for @casualCancelConfirm.
  ///
  /// In en, this message translates to:
  /// **'Everyone who joined will be notified.'**
  String get casualCancelConfirm;

  /// No description provided for @casualLeft.
  ///
  /// In en, this message translates to:
  /// **'You left the game'**
  String get casualLeft;

  /// No description provided for @casualCancelled.
  ///
  /// In en, this message translates to:
  /// **'Game cancelled'**
  String get casualCancelled;

  /// No description provided for @fieldVenue.
  ///
  /// In en, this message translates to:
  /// **'Venue (optional)'**
  String get fieldVenue;

  /// No description provided for @fieldCourt.
  ///
  /// In en, this message translates to:
  /// **'Court (optional)'**
  String get fieldCourt;

  /// No description provided for @venueAny.
  ///
  /// In en, this message translates to:
  /// **'Any venue'**
  String get venueAny;

  /// No description provided for @courtAny.
  ///
  /// In en, this message translates to:
  /// **'Any court'**
  String get courtAny;

  /// No description provided for @venuesTitle.
  ///
  /// In en, this message translates to:
  /// **'Venues'**
  String get venuesTitle;

  /// No description provided for @venueCourts.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 court} other{{count} courts}}'**
  String venueCourts(int count);

  /// No description provided for @venueUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming tournaments'**
  String get venueUpcoming;

  /// No description provided for @venuesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No venues found'**
  String get venuesEmpty;

  /// No description provided for @coachesFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get coachesFilterAll;

  /// No description provided for @coachesSortRating.
  ///
  /// In en, this message translates to:
  /// **'Top rated'**
  String get coachesSortRating;

  /// No description provided for @coachesSortPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get coachesSortPrice;

  /// No description provided for @coachesSortName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get coachesSortName;

  /// No description provided for @coachesSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search coaches or city'**
  String get coachesSearchHint;

  /// No description provided for @coachLanguages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get coachLanguages;

  /// No description provided for @coachExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get coachExperience;

  /// No description provided for @coachTrainingTypes.
  ///
  /// In en, this message translates to:
  /// **'Training types'**
  String get coachTrainingTypes;

  /// No description provided for @coachAvailability.
  ///
  /// In en, this message translates to:
  /// **'Availability'**
  String get coachAvailability;

  /// No description provided for @coachNoSlots.
  ///
  /// In en, this message translates to:
  /// **'No open slots this day'**
  String get coachNoSlots;

  /// No description provided for @coachReviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get coachReviews;

  /// No description provided for @coachNoReviews.
  ///
  /// In en, this message translates to:
  /// **'No reviews yet — be the first after your session.'**
  String get coachNoReviews;

  /// No description provided for @coachBook.
  ///
  /// In en, this message translates to:
  /// **'Book a session'**
  String get coachBook;

  /// No description provided for @coachBookSlot.
  ///
  /// In en, this message translates to:
  /// **'Book {time}'**
  String coachBookSlot(String time);

  /// No description provided for @bookingSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm booking'**
  String get bookingSheetTitle;

  /// No description provided for @bookingPickSlot.
  ///
  /// In en, this message translates to:
  /// **'Pick a time slot first'**
  String get bookingPickSlot;

  /// No description provided for @bookingSummary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get bookingSummary;

  /// No description provided for @bookingTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get bookingTotal;

  /// No description provided for @bookingConfirm.
  ///
  /// In en, this message translates to:
  /// **'Request booking'**
  String get bookingConfirm;

  /// No description provided for @bookingRequested.
  ///
  /// In en, this message translates to:
  /// **'Booking requested — the coach will confirm it.'**
  String get bookingRequested;

  /// No description provided for @bookingSlotTaken.
  ///
  /// In en, this message translates to:
  /// **'That slot was just taken. Here\'s the latest availability.'**
  String get bookingSlotTaken;

  /// No description provided for @myBookingsTitle.
  ///
  /// In en, this message translates to:
  /// **'My training'**
  String get myBookingsTitle;

  /// No description provided for @myBookingsUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get myBookingsUpcoming;

  /// No description provided for @myBookingsPast.
  ///
  /// In en, this message translates to:
  /// **'Past'**
  String get myBookingsPast;

  /// No description provided for @myBookingsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No sessions here'**
  String get myBookingsEmpty;

  /// No description provided for @trainingProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Training progress'**
  String get trainingProgressTitle;

  /// No description provided for @trainingProgressEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your coach\'s skill assessments will appear here after sessions.'**
  String get trainingProgressEmpty;

  /// No description provided for @trainingLatest.
  ///
  /// In en, this message translates to:
  /// **'Latest {score}/10'**
  String trainingLatest(int score);

  /// No description provided for @trainingAssessments.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 assessment} other{{count} assessments}}'**
  String trainingAssessments(int count);

  /// No description provided for @coachPortalTitle.
  ///
  /// In en, this message translates to:
  /// **'Coach portal'**
  String get coachPortalTitle;

  /// No description provided for @coachPortalToday.
  ///
  /// In en, this message translates to:
  /// **'Next sessions'**
  String get coachPortalToday;

  /// No description provided for @coachPortalPending.
  ///
  /// In en, this message translates to:
  /// **'Requests to answer'**
  String get coachPortalPending;

  /// No description provided for @coachPortalAvailability.
  ///
  /// In en, this message translates to:
  /// **'Availability'**
  String get coachPortalAvailability;

  /// No description provided for @coachPortalBookings.
  ///
  /// In en, this message translates to:
  /// **'Bookings'**
  String get coachPortalBookings;

  /// No description provided for @coachPortalProfile.
  ///
  /// In en, this message translates to:
  /// **'Coach profile'**
  String get coachPortalProfile;

  /// No description provided for @coachPortalSwitchToPlayer.
  ///
  /// In en, this message translates to:
  /// **'Player app'**
  String get coachPortalSwitchToPlayer;

  /// No description provided for @coachPortalOpen.
  ///
  /// In en, this message translates to:
  /// **'Coach portal'**
  String get coachPortalOpen;

  /// No description provided for @slotAdd.
  ///
  /// In en, this message translates to:
  /// **'Add slots'**
  String get slotAdd;

  /// No description provided for @slotDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get slotDate;

  /// No description provided for @slotStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get slotStart;

  /// No description provided for @slotEnd.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get slotEnd;

  /// No description provided for @slotRepeat.
  ///
  /// In en, this message translates to:
  /// **'Repeat weekly'**
  String get slotRepeat;

  /// No description provided for @slotRepeatWeeks.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Don\'t repeat} =1{For 1 more week} other{For {count} more weeks}}'**
  String slotRepeatWeeks(int count);

  /// No description provided for @slotActive.
  ///
  /// In en, this message translates to:
  /// **'Bookable'**
  String get slotActive;

  /// No description provided for @slotBooked.
  ///
  /// In en, this message translates to:
  /// **'Booked'**
  String get slotBooked;

  /// No description provided for @slotDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete this slot?'**
  String get slotDeleteConfirm;

  /// No description provided for @slotsCreated.
  ///
  /// In en, this message translates to:
  /// **'Slots added'**
  String get slotsCreated;

  /// No description provided for @slotsEmptyDay.
  ///
  /// In en, this message translates to:
  /// **'No slots on this day'**
  String get slotsEmptyDay;

  /// No description provided for @bookingConfirmAction.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get bookingConfirmAction;

  /// No description provided for @bookingRejectAction.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get bookingRejectAction;

  /// No description provided for @bookingCompleteAction.
  ///
  /// In en, this message translates to:
  /// **'Mark completed'**
  String get bookingCompleteAction;

  /// No description provided for @bookingFeedbackAction.
  ///
  /// In en, this message translates to:
  /// **'Send feedback'**
  String get bookingFeedbackAction;

  /// No description provided for @bookingProgressAction.
  ///
  /// In en, this message translates to:
  /// **'Record progress'**
  String get bookingProgressAction;

  /// No description provided for @bookingReasonOptional.
  ///
  /// In en, this message translates to:
  /// **'Reason (optional)'**
  String get bookingReasonOptional;

  /// No description provided for @bookingFeedbackHint.
  ///
  /// In en, this message translates to:
  /// **'What went well, what to work on'**
  String get bookingFeedbackHint;

  /// No description provided for @bookingUpdated.
  ///
  /// In en, this message translates to:
  /// **'Booking updated'**
  String get bookingUpdated;

  /// No description provided for @progressSkill.
  ///
  /// In en, this message translates to:
  /// **'Skill'**
  String get progressSkill;

  /// No description provided for @progressScore.
  ///
  /// In en, this message translates to:
  /// **'Score (1–10)'**
  String get progressScore;

  /// No description provided for @progressAddSkill.
  ///
  /// In en, this message translates to:
  /// **'Add skill'**
  String get progressAddSkill;

  /// No description provided for @progressSaved.
  ///
  /// In en, this message translates to:
  /// **'Progress saved'**
  String get progressSaved;

  /// No description provided for @coachFieldCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get coachFieldCity;

  /// No description provided for @coachFieldPrice.
  ///
  /// In en, this message translates to:
  /// **'Price per hour'**
  String get coachFieldPrice;

  /// No description provided for @coachFieldYears.
  ///
  /// In en, this message translates to:
  /// **'Years of experience'**
  String get coachFieldYears;

  /// No description provided for @coachFieldSpecialties.
  ///
  /// In en, this message translates to:
  /// **'Specialties'**
  String get coachFieldSpecialties;

  /// No description provided for @coachFieldLanguages.
  ///
  /// In en, this message translates to:
  /// **'Languages (comma separated)'**
  String get coachFieldLanguages;

  /// No description provided for @coachProfileSaved.
  ///
  /// In en, this message translates to:
  /// **'Coach profile saved'**
  String get coachProfileSaved;

  /// No description provided for @notificationsMarkAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all read'**
  String get notificationsMarkAllRead;

  /// No description provided for @notificationsFilterUnread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get notificationsFilterUnread;

  /// No description provided for @notificationsFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get notificationsFilterAll;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// No description provided for @settingsPushEnabled.
  ///
  /// In en, this message translates to:
  /// **'Push notifications are on'**
  String get settingsPushEnabled;

  /// No description provided for @settingsPushDisabled.
  ///
  /// In en, this message translates to:
  /// **'Push notifications are off'**
  String get settingsPushDisabled;

  /// No description provided for @settingsPushUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Push isn\'t configured on this build'**
  String get settingsPushUnavailable;

  /// No description provided for @settingsPushEnable.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get settingsPushEnable;

  /// No description provided for @settingsAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingsAccount;

  /// No description provided for @settingsPremium.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get settingsPremium;

  /// No description provided for @settingsPayments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get settingsPayments;

  /// No description provided for @settingsMyTraining.
  ///
  /// In en, this message translates to:
  /// **'My training'**
  String get settingsMyTraining;

  /// No description provided for @settingsStaff.
  ///
  /// In en, this message translates to:
  /// **'Staff scorekeeping'**
  String get settingsStaff;

  /// No description provided for @settingsVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String settingsVersion(String version);

  /// No description provided for @settingsLogOutConfirm.
  ///
  /// In en, this message translates to:
  /// **'You\'ll need to sign in again.'**
  String get settingsLogOutConfirm;

  /// No description provided for @scorekeeperTitle.
  ///
  /// In en, this message translates to:
  /// **'Scorekeeper'**
  String get scorekeeperTitle;

  /// No description provided for @scorekeeperLogin.
  ///
  /// In en, this message translates to:
  /// **'Staff login'**
  String get scorekeeperLogin;

  /// No description provided for @scorekeeperLoginField.
  ///
  /// In en, this message translates to:
  /// **'Staff login'**
  String get scorekeeperLoginField;

  /// No description provided for @scorekeeperMatches.
  ///
  /// In en, this message translates to:
  /// **'Assigned matches'**
  String get scorekeeperMatches;

  /// No description provided for @scorekeeperNoMatches.
  ///
  /// In en, this message translates to:
  /// **'No matches assigned right now.'**
  String get scorekeeperNoMatches;

  /// No description provided for @scorekeeperPointTo.
  ///
  /// In en, this message translates to:
  /// **'Point'**
  String get scorekeeperPointTo;

  /// No description provided for @scorekeeperUndo.
  ///
  /// In en, this message translates to:
  /// **'Undo last point'**
  String get scorekeeperUndo;

  /// No description provided for @scorekeeperAddDetail.
  ///
  /// In en, this message translates to:
  /// **'Add detail'**
  String get scorekeeperAddDetail;

  /// No description provided for @scorekeeperDetailOptional.
  ///
  /// In en, this message translates to:
  /// **'Optional — the score is already recorded.'**
  String get scorekeeperDetailOptional;

  /// No description provided for @scorekeeperEndingType.
  ///
  /// In en, this message translates to:
  /// **'How it ended'**
  String get scorekeeperEndingType;

  /// No description provided for @scorekeeperShot.
  ///
  /// In en, this message translates to:
  /// **'Shot'**
  String get scorekeeperShot;

  /// No description provided for @scorekeeperError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get scorekeeperError;

  /// No description provided for @scorekeeperServe.
  ///
  /// In en, this message translates to:
  /// **'Serve'**
  String get scorekeeperServe;

  /// No description provided for @scorekeeperPlayer.
  ///
  /// In en, this message translates to:
  /// **'Player'**
  String get scorekeeperPlayer;

  /// No description provided for @scorekeeperSaved.
  ///
  /// In en, this message translates to:
  /// **'Detail saved'**
  String get scorekeeperSaved;

  /// No description provided for @scorekeeperRecordPoint.
  ///
  /// In en, this message translates to:
  /// **'Record point'**
  String get scorekeeperRecordPoint;

  /// No description provided for @scorekeeperEditLastPoint.
  ///
  /// In en, this message translates to:
  /// **'Edit last point'**
  String get scorekeeperEditLastPoint;

  /// No description provided for @scorekeeperReasonHelp.
  ///
  /// In en, this message translates to:
  /// **'Choose how the point ended and the required details.'**
  String get scorekeeperReasonHelp;

  /// No description provided for @scorekeeperPlayerWinning.
  ///
  /// In en, this message translates to:
  /// **'Player (team that won the point)'**
  String get scorekeeperPlayerWinning;

  /// No description provided for @scorekeeperPlayerLosing.
  ///
  /// In en, this message translates to:
  /// **'Player (team that lost the point)'**
  String get scorekeeperPlayerLosing;

  /// No description provided for @scorekeeperLogout.
  ///
  /// In en, this message translates to:
  /// **'Leave scorekeeper mode'**
  String get scorekeeperLogout;

  /// No description provided for @pmPhoneKicker.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the community'**
  String get pmPhoneKicker;

  /// No description provided for @pmPhoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Step onto the court'**
  String get pmPhoneTitle;

  /// No description provided for @pmPhoneSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with your phone number and start building your sports identity.'**
  String get pmPhoneSubtitle;

  /// No description provided for @pmPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get pmPhoneLabel;

  /// No description provided for @pmPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'We\'ll send you a verification code by SMS'**
  String get pmPhoneHint;

  /// No description provided for @pmPhoneInvalid.
  ///
  /// In en, this message translates to:
  /// **'The number must start with 77, 78 or 79'**
  String get pmPhoneInvalid;

  /// No description provided for @pmContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get pmContinue;

  /// No description provided for @pmOrContinueWith.
  ///
  /// In en, this message translates to:
  /// **'Or continue with'**
  String get pmOrContinueWith;

  /// No description provided for @pmLegalPrefix.
  ///
  /// In en, this message translates to:
  /// **'By continuing you agree to the '**
  String get pmLegalPrefix;

  /// No description provided for @pmLegalTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get pmLegalTerms;

  /// No description provided for @pmLegalAnd.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get pmLegalAnd;

  /// No description provided for @pmLegalPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get pmLegalPrivacy;

  /// No description provided for @pmStaffSignIn.
  ///
  /// In en, this message translates to:
  /// **'Scorekeeper login'**
  String get pmStaffSignIn;

  /// No description provided for @pmBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get pmBack;

  /// No description provided for @pmOtpKicker.
  ///
  /// In en, this message translates to:
  /// **'Last step'**
  String get pmOtpKicker;

  /// No description provided for @pmOtpTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code'**
  String get pmOtpTitle;

  /// No description provided for @pmOtpSentTo.
  ///
  /// In en, this message translates to:
  /// **'We sent a 6-digit code to'**
  String get pmOtpSentTo;

  /// No description provided for @pmOtpEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get pmOtpEdit;

  /// No description provided for @pmOtpLabel.
  ///
  /// In en, this message translates to:
  /// **'Verification code'**
  String get pmOtpLabel;

  /// No description provided for @pmOtpNotReceived.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t get the code?'**
  String get pmOtpNotReceived;

  /// No description provided for @pmOtpResend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get pmOtpResend;

  /// No description provided for @pmOtpConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm and sign in'**
  String get pmOtpConfirm;

  /// No description provided for @pmWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Your identity is ready'**
  String get pmWelcomeTitle;

  /// No description provided for @pmWelcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Playmaker — the court awaits'**
  String get pmWelcomeSubtitle;

  /// No description provided for @failureInvalidPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid Jordanian mobile number.'**
  String get failureInvalidPhone;

  /// No description provided for @failureOtpExpired.
  ///
  /// In en, this message translates to:
  /// **'The code has expired. Request a new one.'**
  String get failureOtpExpired;

  /// No description provided for @failureOtpSessionInvalid.
  ///
  /// In en, this message translates to:
  /// **'This verification is no longer valid. Request a new code.'**
  String get failureOtpSessionInvalid;

  /// No description provided for @failureOtpResendTooSoon.
  ///
  /// In en, this message translates to:
  /// **'Please wait a moment before requesting a new code.'**
  String get failureOtpResendTooSoon;

  /// No description provided for @failureOtpResendLimit.
  ///
  /// In en, this message translates to:
  /// **'You\'ve reached the resend limit. Try again later.'**
  String get failureOtpResendLimit;

  /// No description provided for @failureOtpTooManyAttempts.
  ///
  /// In en, this message translates to:
  /// **'Too many incorrect attempts. Request a new code.'**
  String get failureOtpTooManyAttempts;

  /// No description provided for @failureOtpProviderUnavailable.
  ///
  /// In en, this message translates to:
  /// **'SMS service is temporarily unavailable. Try again shortly.'**
  String get failureOtpProviderUnavailable;

  /// No description provided for @failureSocialTokenInvalid.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t verify your account. Please try again.'**
  String get failureSocialTokenInvalid;

  /// No description provided for @failureSocialUnavailable.
  ///
  /// In en, this message translates to:
  /// **'This sign-in option isn\'t available right now.'**
  String get failureSocialUnavailable;

  /// No description provided for @fieldCountry.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get fieldCountry;

  /// No description provided for @partnerEnded.
  ///
  /// In en, this message translates to:
  /// **'Partnership ended'**
  String get partnerEnded;

  /// No description provided for @duo3dTitle.
  ///
  /// In en, this message translates to:
  /// **'Duo 3D identity'**
  String get duo3dTitle;

  /// No description provided for @duo3dBody.
  ///
  /// In en, this message translates to:
  /// **'A 3D scene of you and your partner together on court.'**
  String get duo3dBody;

  /// No description provided for @duo3dGenerate.
  ///
  /// In en, this message translates to:
  /// **'Create our scene'**
  String get duo3dGenerate;

  /// No description provided for @duo3dRegenerate.
  ///
  /// In en, this message translates to:
  /// **'Create a new one'**
  String get duo3dRegenerate;

  /// No description provided for @duo3dProcessing.
  ///
  /// In en, this message translates to:
  /// **'Creating your duo scene… this can take a few minutes.'**
  String get duo3dProcessing;

  /// No description provided for @duo3dFailed.
  ///
  /// In en, this message translates to:
  /// **'The last attempt failed. Try again.'**
  String get duo3dFailed;

  /// No description provided for @duo3dNeedsPhotos.
  ///
  /// In en, this message translates to:
  /// **'You and your partner both need a profile photo first.'**
  String get duo3dNeedsPhotos;

  /// No description provided for @duo3dComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Duo scenes are coming soon.'**
  String get duo3dComingSoon;

  /// No description provided for @duo3dPremium.
  ///
  /// In en, this message translates to:
  /// **'Duo scenes are part of Premium.'**
  String get duo3dPremium;

  /// No description provided for @casualMatchName.
  ///
  /// In en, this message translates to:
  /// **'Match name (optional)'**
  String get casualMatchName;

  /// No description provided for @casualMatchNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Friday evening padel'**
  String get casualMatchNameHint;

  /// No description provided for @casualEditMatch.
  ///
  /// In en, this message translates to:
  /// **'Edit match'**
  String get casualEditMatch;

  /// No description provided for @casualEditHint.
  ///
  /// In en, this message translates to:
  /// **'Players are notified when you change the time or the court.'**
  String get casualEditHint;

  /// No description provided for @casualInvitePlayer.
  ///
  /// In en, this message translates to:
  /// **'Invite a player'**
  String get casualInvitePlayer;

  /// No description provided for @casualInviteSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name or player ID'**
  String get casualInviteSearchHint;

  /// No description provided for @casualInvite.
  ///
  /// In en, this message translates to:
  /// **'Invite'**
  String get casualInvite;

  /// No description provided for @casualInvitationSent.
  ///
  /// In en, this message translates to:
  /// **'Invitation sent'**
  String get casualInvitationSent;

  /// No description provided for @casualCancelledNotFull.
  ///
  /// In en, this message translates to:
  /// **'This match was cancelled automatically: it did not have enough players 2 hours before the start.'**
  String get casualCancelledNotFull;

  /// No description provided for @casualCancelledByCreator.
  ///
  /// In en, this message translates to:
  /// **'This match was cancelled by the organizer.'**
  String get casualCancelledByCreator;

  /// No description provided for @casualUpdated.
  ///
  /// In en, this message translates to:
  /// **'Match updated'**
  String get casualUpdated;

  /// No description provided for @casualInvitedStatus.
  ///
  /// In en, this message translates to:
  /// **'Invited'**
  String get casualInvitedStatus;

  /// No description provided for @casualYouAreInvited.
  ///
  /// In en, this message translates to:
  /// **'{name} invited you to this match'**
  String casualYouAreInvited(String name);

  /// No description provided for @casualInvitationAccepted.
  ///
  /// In en, this message translates to:
  /// **'You\'re in! See you on court.'**
  String get casualInvitationAccepted;

  /// No description provided for @notificationSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification settings'**
  String get notificationSettingsTitle;

  /// No description provided for @notificationSettingsHint.
  ///
  /// In en, this message translates to:
  /// **'Choose which notifications you receive. Platform announcements are always delivered.'**
  String get notificationSettingsHint;

  /// No description provided for @myRegistrationsShort.
  ///
  /// In en, this message translates to:
  /// **'My registrations'**
  String get myRegistrationsShort;

  /// No description provided for @myTrainingsShort.
  ///
  /// In en, this message translates to:
  /// **'My trainings'**
  String get myTrainingsShort;

  /// No description provided for @registrationOrganizerNote.
  ///
  /// In en, this message translates to:
  /// **'Organizer\'s note'**
  String get registrationOrganizerNote;

  /// No description provided for @registrationChangesHint.
  ///
  /// In en, this message translates to:
  /// **'Update your registration (e.g. change partner) and it goes back to review.'**
  String get registrationChangesHint;

  /// No description provided for @openInGoogleMaps.
  ///
  /// In en, this message translates to:
  /// **'Open in Google Maps'**
  String get openInGoogleMaps;

  /// No description provided for @premiumPlanMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get premiumPlanMonthly;

  /// No description provided for @premiumPlanYearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get premiumPlanYearly;

  /// No description provided for @premiumDaysLeft.
  ///
  /// In en, this message translates to:
  /// **'{count} days left'**
  String premiumDaysLeft(int count);

  /// No description provided for @findPartner.
  ///
  /// In en, this message translates to:
  /// **'Find a partner'**
  String get findPartner;

  /// No description provided for @findPartnerHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name or player ID, open the player\'s profile, then tap \"Request as main partner\".'**
  String get findPartnerHint;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
