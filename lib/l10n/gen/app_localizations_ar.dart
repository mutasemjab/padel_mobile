// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'منصة بادل';

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navTournaments => 'البطولات';

  @override
  String get navRankings => 'الترتيب';

  @override
  String get navCasual => 'مباريات ودية';

  @override
  String get navProfile => 'الملف الشخصي';

  @override
  String get actionRetry => 'إعادة المحاولة';

  @override
  String get actionCancel => 'إلغاء';

  @override
  String get actionSend => 'إرسال';

  @override
  String get actionCreate => 'إنشاء';

  @override
  String get actionCreateOne => 'أنشئ واحدة';

  @override
  String get filterAll => 'الكل';

  @override
  String get premiumLabel => 'بريميوم';

  @override
  String get tieBreakLabel => 'كسر التعادل';

  @override
  String get ptsLabel => 'نقطة';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get settingsLanguage => 'اللغة';

  @override
  String get settingsLanguageArabic => 'العربية';

  @override
  String get settingsLanguageEnglish => 'الإنجليزية';

  @override
  String get settingsAppearance => 'المظهر';

  @override
  String get themeSystem => 'حسب النظام';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get settingsLogOut => 'تسجيل الخروج';

  @override
  String get deleteAccountTitle => 'حذف الحساب';

  @override
  String get deleteAccountConfirm =>
      'هل أنت متأكد من رغبتك في حذف حسابك نهائياً؟ هذا الإجراء فوري ولا يمكن التراجع عنه، وسيتم حذف جميع بياناتك ومبارياتك.';

  @override
  String get deleteAccountSuccess => 'تم حذف حسابك بنجاح.';

  @override
  String get deleteAccountLoading => 'جاري حذف الحساب...';

  @override
  String homeWelcomeBack(String name) {
    return 'أهلاً بعودتك، $name';
  }

  @override
  String get homeUnranked => 'غير مصنّف';

  @override
  String homeLevelPoints(String level, int points) {
    return '$level • $points نقطة موسمية';
  }

  @override
  String get homeLiveNow => 'مباشر الآن';

  @override
  String get homeSeeAll => 'عرض الكل';

  @override
  String get homeNoLiveTournaments => 'لا توجد بطولات مباشرة حالياً.';

  @override
  String get fieldPassword => 'كلمة المرور';

  @override
  String get errorPasswordRequired => 'كلمة المرور مطلوبة';

  @override
  String get actionLogIn => 'تسجيل الدخول';

  @override
  String get fieldFullName => 'الاسم الكامل';

  @override
  String get errorNameRequired => 'الاسم مطلوب';

  @override
  String get fieldPhoneOptional => 'رقم الهاتف (اختياري)';

  @override
  String get errorPasswordLength => '8 أحرف على الأقل';

  @override
  String get fieldConfirmPassword => 'تأكيد كلمة المرور';

  @override
  String get errorPasswordsMismatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get notificationsTitle => 'الإشعارات';

  @override
  String get emptyNotificationsTitle => 'لا توجد إشعارات بعد';

  @override
  String get emptyNotificationsMessage =>
      'أنت على اطّلاع بكل شيء — ستظهر الإشعارات الجديدة هنا.';

  @override
  String get casualMatchesTitle => 'مباريات ودية';

  @override
  String get casualFilterLookingForMatch => 'يبحث عن مباراة';

  @override
  String get casualFilterLookingForPartner => 'يبحث عن شريك';

  @override
  String get casualFilterNeed1 => 'يحتاج لاعباً واحداً';

  @override
  String get casualFilterNeed2 => 'يحتاج لاعبين اثنين';

  @override
  String get casualFilterNeed3 => 'يحتاج ثلاثة لاعبين';

  @override
  String get emptyCasualTitle => 'لا توجد مباريات ودية قريبة';

  @override
  String get emptyCasualMessage =>
      'كن أول من ينشئ مباراة ويدعو لاعبين للانضمام.';

  @override
  String get joinRequestSent => 'تم إرسال طلب الانضمام.';

  @override
  String get statusClosed => 'مغلقة';

  @override
  String labelLevel(String level) {
    return 'المستوى $level';
  }

  @override
  String labelSide(String side) {
    return 'الجهة: $side';
  }

  @override
  String byCreator(String name) {
    return 'بواسطة $name';
  }

  @override
  String get actionRequested => 'تم الطلب';

  @override
  String get actionJoin => 'انضمام';

  @override
  String get createMatchTitle => 'إنشاء مباراة ودية';

  @override
  String get fieldMatchType => 'نوع المباراة';

  @override
  String get fieldDateTime => 'التاريخ والوقت';

  @override
  String get selectFutureDateTime => 'اختر تاريخاً ووقتاً مستقبلياً';

  @override
  String get errorPickFutureDateTime => 'اختر تاريخاً ووقتاً في المستقبل';

  @override
  String get fieldRequiredLevelOptional => 'المستوى المطلوب (اختياري)';

  @override
  String get fieldPreferredSideOptional => 'الجهة المفضّلة (اختياري)';

  @override
  String get fieldNotesOptional => 'ملاحظات (اختياري)';

  @override
  String get actionCreateMatch => 'إنشاء المباراة';

  @override
  String get coachesTitle => 'المدربون';

  @override
  String get emptyCoachesTitle => 'لا يوجد مدربون متاحون';

  @override
  String get emptyCoachesMessage => 'تحقق لاحقاً لمعرفة المدربين المتاحين.';

  @override
  String coachPricePerHourLong(String price) {
    return '$price / ساعة';
  }

  @override
  String coachPricePerHourShort(String price) {
    return '$price/ساعة';
  }

  @override
  String get statusUnavailable => 'غير متاح';

  @override
  String get sectionAbout => 'نبذة';

  @override
  String get sectionSpecialties => 'التخصصات';

  @override
  String get rankingsTitle => 'الترتيب';

  @override
  String get emptyRankingsTitle => 'لا يوجد ترتيب بعد';

  @override
  String get emptyRankingsMessage =>
      'سيظهر الترتيب هنا بمجرد أن يبدأ اللاعبون بجمع النقاط.';

  @override
  String get liveMatchTitle => 'مباراة مباشرة';

  @override
  String get vsLabel => 'ضد';

  @override
  String get currentGame => 'الشوط الحالي';

  @override
  String gamesScore(int teamOne, int teamTwo) {
    return '$teamOne - $teamTwo أشواط';
  }

  @override
  String setsScore(int teamOne, int teamTwo) {
    return '$teamOne - $teamTwo مجموعات';
  }

  @override
  String get matchCompleted => 'انتهت المباراة';

  @override
  String teamWon(String team) {
    return 'فاز $team';
  }

  @override
  String get rankingEligible => 'مؤهلة للترتيب';

  @override
  String get venueTba => 'الملعب سيُحدد لاحقاً';

  @override
  String get categoriesSection => 'الفئات';

  @override
  String teamsCount(int active, int max) {
    return '$active/$max فرق';
  }

  @override
  String feeSuffix(String fee) {
    return ' • رسوم $fee';
  }

  @override
  String get statusFull => 'مكتملة';

  @override
  String get tournamentsTitle => 'البطولات';

  @override
  String get filterOpen => 'مفتوحة';

  @override
  String get filterLive => 'مباشرة';

  @override
  String get filterCompleted => 'منتهية';

  @override
  String get emptyTournamentsTitle => 'لا توجد بطولات هنا';

  @override
  String get emptyTournamentsMessage => 'جرّب فلتراً مختلفاً أو تحقق لاحقاً.';

  @override
  String get statusDraft => 'مسودة';

  @override
  String get statusRegistrationOpen => 'التسجيل مفتوح';

  @override
  String get statusRegistrationClosed => 'التسجيل مغلق';

  @override
  String get statusOngoing => 'جارية';

  @override
  String get statusCompleted => 'منتهية';

  @override
  String get statusCancelled => 'ملغاة';

  @override
  String get achievementsSection => 'الإنجازات';

  @override
  String get statLevel => 'المستوى';

  @override
  String get statRating => 'التقييم';

  @override
  String get statSeasonPts => 'نقاط الموسم';

  @override
  String get statXp => 'نقاط الخبرة';

  @override
  String get actionFollowing => 'متابَع';

  @override
  String get actionFollow => 'متابعة';

  @override
  String get tooltipRespect => 'احترام';

  @override
  String get tooltipChallenge => 'تحدي';

  @override
  String challengeSentTo(String name) {
    return 'تم إرسال التحدي إلى $name';
  }

  @override
  String challengeTitle(String name) {
    return 'تحدي $name';
  }

  @override
  String get hintAddMessage => 'أضف رسالة (اختياري)';

  @override
  String get failureSessionExpired => 'انتهت صلاحية الجلسة.';

  @override
  String get failureNoInternet => 'لا يوجد اتصال بالإنترنت.';

  @override
  String get failureServerError => 'حدث خطأ ما من جانبنا.';

  @override
  String get failureUnknown => 'حدث خطأ غير متوقع.';

  @override
  String get failureRequestCancelled => 'تم إلغاء الطلب.';

  @override
  String get failureSecureConnectionFailed => 'فشل الاتصال الآمن.';

  @override
  String get failureValidationFailed => 'فشل التحقق من البيانات.';

  @override
  String get failureRequestFailed => 'فشل الطلب.';

  @override
  String get failureInvalidCredentials =>
      'البريد الإلكتروني أو كلمة المرور غير صحيحة.';

  @override
  String get failurePremiumRequired => 'هذه ميزة خاصة بـ Premium.';

  @override
  String get failureCoachOnly => 'هذا متاح لحسابات المدربين فقط.';

  @override
  String get failurePlayerProfileRequired => 'هذا يتطلب ملف لاعب.';

  @override
  String get failureStaffOnly => 'هذا متاح لطاقم البطولة فقط.';

  @override
  String get failureForbidden => 'ليس لديك صلاحية للوصول إلى هذا.';

  @override
  String get failureAccountInactive => 'هذا الحساب غير نشط.';

  @override
  String get failureNotFound => 'لم نتمكن من العثور على ذلك.';

  @override
  String get failureRateLimited => 'محاولات كثيرة. حاول مرة أخرى بعد قليل.';

  @override
  String get failureProviderUnavailable => 'غير متاح بعد.';

  @override
  String get actionClose => 'إغلاق';

  @override
  String get actionConfirm => 'تأكيد';

  @override
  String get actionSave => 'حفظ';

  @override
  String get actionEdit => 'تعديل';

  @override
  String get actionDelete => 'حذف';

  @override
  String get actionAccept => 'قبول';

  @override
  String get actionDecline => 'رفض';

  @override
  String get actionRefresh => 'تحديث';

  @override
  String get actionViewAll => 'عرض الكل';

  @override
  String get actionLearnMore => 'اعرف المزيد';

  @override
  String get actionGoPremium => 'اشترك في Premium';

  @override
  String get actionBack => 'رجوع';

  @override
  String get actionSearch => 'بحث';

  @override
  String get actionApply => 'تطبيق';

  @override
  String get actionReset => 'إعادة تعيين';

  @override
  String get actionContinue => 'متابعة';

  @override
  String get actionLeave => 'مغادرة';

  @override
  String get actionOpen => 'فتح';

  @override
  String get stateEmptyTitle => 'لا يوجد شيء هنا بعد';

  @override
  String get stateOfflineTitle => 'أنت غير متصل';

  @override
  String get stateOfflineMessage => 'تحقق من اتصالك وحاول مرة أخرى.';

  @override
  String get stateOfflineBanner => 'غير متصل — نعرض ما لدينا';

  @override
  String get stateErrorTitle => 'حدث خطأ ما';

  @override
  String get stateComingSoonTitle => 'قريبًا';

  @override
  String get stateComingSoonPayments =>
      'الدفع الإلكتروني قادم قريبًا. لم يتم خصم أي مبلغ.';

  @override
  String get stateComingSoon3d =>
      'إنشاء الهوية ثلاثية الأبعاد غير متاح بعد. سنعلمك عند توفره.';

  @override
  String get stateInsufficientDataTitle => 'لا توجد بيانات كافية بعد';

  @override
  String get statePremiumTitle => 'افتح هذه الميزة مع Premium';

  @override
  String get statePremiumMessage =>
      'يضيف Premium تحليلات ورؤى، ولا يؤثر أبدًا على تصنيفك أو ترتيبك.';

  @override
  String progressOf(int current, int target) {
    return '$current/$target';
  }

  @override
  String get valueDash => '—';

  @override
  String get liveBadge => 'مباشر';

  @override
  String get liveRealtime => 'مباشر · لحظي';

  @override
  String liveUpdatingEvery(int seconds) {
    return 'مباشر · تحديث كل $seconds ث';
  }

  @override
  String get correctedToast => 'تم تصحيح النتيجة من قبل مسجّل النقاط';

  @override
  String get metricSkillRating => 'تقييم المهارة';

  @override
  String get metricSeasonPoints => 'نقاط الموسم';

  @override
  String get metricXp => 'نقاط الخبرة';

  @override
  String metricPosition(int position) {
    return '#$position';
  }

  @override
  String get metricLevel => 'المستوى';

  @override
  String get metricUnranked => 'غير مصنّف';

  @override
  String movementUp(int n) {
    return 'صعود $n';
  }

  @override
  String movementDown(int n) {
    return 'هبوط $n';
  }

  @override
  String get movementSame => 'بلا تغيير';

  @override
  String get competitionRanked => 'موثّقة · مصنّفة';

  @override
  String get competitionCertified => 'رسمية';

  @override
  String get competitionSocial => 'ودية';

  @override
  String get officialNote =>
      'فقط النتائج الموثّقة من البطولات المصنّفة تؤثر على تقييم مهارتك وترتيبك في الموسم.';

  @override
  String get casualNote => 'اللعب الودي لا يؤثر أبدًا على تقييمك أو ترتيبك.';

  @override
  String get rarityCommon => 'شائع';

  @override
  String get rarityRare => 'نادر';

  @override
  String get rarityEpic => 'ملحمي';

  @override
  String get rarityLegendary => 'أسطوري';

  @override
  String xpReward(int xp) {
    return '+$xp خبرة';
  }

  @override
  String get newCoach => 'مدرب جديد';

  @override
  String reviewsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تقييم',
      many: '$count تقييمًا',
      few: '$count تقييمات',
      two: 'تقييمان',
      one: 'تقييم واحد',
      zero: 'لا تقييمات',
    );
    return '$_temp0';
  }

  @override
  String get timeNow => 'الآن';

  @override
  String timeInMinutes(int n) {
    return 'بعد $n د';
  }

  @override
  String timeMinutesAgo(int n) {
    return 'قبل $n د';
  }

  @override
  String timeInHours(int n) {
    return 'بعد $n س';
  }

  @override
  String timeHoursAgo(int n) {
    return 'قبل $n س';
  }

  @override
  String timeInDays(int n) {
    return 'بعد $n يوم';
  }

  @override
  String timeDaysAgo(int n) {
    return 'قبل $n يوم';
  }

  @override
  String get dayToday => 'اليوم';

  @override
  String get dayYesterday => 'أمس';

  @override
  String get navCompete => 'المنافسات';

  @override
  String get navPlay => 'العب';

  @override
  String homeGreeting(String name) {
    return 'أهلًا، $name';
  }

  @override
  String get homeLiveYouAreIn => 'أنت في الملعب الآن';

  @override
  String get homeNextMatch => 'مباراتك القادمة';

  @override
  String get homeLiveFollowing => 'لاعبون تتابعهم';

  @override
  String get homeMyTournaments => 'بطولاتي';

  @override
  String get homeYourSeason => 'موسمك';

  @override
  String get homeStats => 'أرقامك';

  @override
  String get homeLatestAchievement => 'أحدث إنجاز';

  @override
  String get homeRecommendedTournaments => 'بطولات تناسبك';

  @override
  String get homeCasualOpportunities => 'مباريات تبحث عن لاعبين';

  @override
  String get homeRecommendedPartner => 'شريك مقترح';

  @override
  String get homeRecommendedCoach => 'مدرب مناسب لك';

  @override
  String get homeUpcomingTraining => 'التدريب القادم';

  @override
  String homePendingRequests(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count طلب بانتظارك',
      many: '$count طلبًا بانتظارك',
      few: '$count طلبات شراكة بانتظارك',
      two: 'طلبا شراكة بانتظارك',
      one: 'طلب شراكة واحد بانتظارك',
      zero: 'لا طلبات شراكة',
    );
    return '$_temp0';
  }

  @override
  String get homeReviewRequests => 'مراجعة';

  @override
  String get homeAiDailyBrief => 'الموجز اليومي';

  @override
  String get homePremiumTeaserTitle => 'أداؤك، بالتفصيل';

  @override
  String get homePremiumTeaserBody =>
      'موجز يومي وتحليلات متقدمة وهوية رياضية ثلاثية الأبعاد — مبنية فقط على مبارياتك الحقيقية.';

  @override
  String get homeInsufficientRanking =>
      'العب مباريات مصنّفة موثّقة لتظهر في ترتيب الموسم.';

  @override
  String get homeInsufficientGeneric =>
      'سنعرض هذا عند توفر بيانات حقيقية كافية.';

  @override
  String get homeEmptyTitle => 'موسمك يبدأ من هنا';

  @override
  String get homeEmptyMessage => 'انضم إلى بطولة أو مباراة ودية لتمتلئ صفحتك.';

  @override
  String get homeFindTournament => 'ابحث عن بطولة';

  @override
  String get matchVs => 'ضد';

  @override
  String get matchTbd => 'يُحدد لاحقًا';

  @override
  String get matchBye => 'تأهل مباشر';

  @override
  String matchCourt(String name) {
    return 'ملعب $name';
  }

  @override
  String matchSetLabel(int n) {
    return 'المجموعة $n';
  }

  @override
  String get matchWinner => 'الفائز';

  @override
  String get matchScheduled => 'مجدولة';

  @override
  String matchStartsAt(String time) {
    return 'تبدأ $time';
  }

  @override
  String get matchWalkover => 'انسحاب';

  @override
  String get matchPendingVerification => 'بانتظار التوثيق';

  @override
  String get matchVerified => 'موثّقة';

  @override
  String get matchServing => 'يرسل';

  @override
  String get matchGames => 'الأشواط';

  @override
  String get matchPoints => 'النقاط';

  @override
  String tournamentSpotsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مقعد متبقٍ',
      many: '$count مقعدًا متبقيًا',
      few: '$count مقاعد متبقية',
      two: 'مقعدان متبقيان',
      one: 'مقعد واحد متبقٍ',
      zero: 'مكتملة',
    );
    return '$_temp0';
  }

  @override
  String tournamentLiveCount(int count) {
    return '$count مباشر';
  }

  @override
  String get tournamentFree => 'مجانية';

  @override
  String tournamentFee(String amount) {
    return 'الرسوم $amount';
  }

  @override
  String get reasonComplementarySide => 'جهة لعب مكمّلة';

  @override
  String get reasonSimilarRating => 'تقييم مهارة مشابه';

  @override
  String get reasonPreviousPartnership => 'لعبتما معًا';

  @override
  String get reasonActiveRecently => 'نشط مؤخرًا';

  @override
  String get reasonSameCountry => 'نفس الدولة';

  @override
  String coachPerHour(String price) {
    return '$price / ساعة';
  }

  @override
  String coachNextAvailable(String time) {
    return 'التالي: $time';
  }

  @override
  String coachYearsExperience(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سنة',
      many: '$count سنة',
      few: '$count سنوات',
      two: 'سنتان',
      one: 'سنة واحدة',
      zero: 'أقل من سنة',
    );
    return '$_temp0';
  }

  @override
  String casualSpotsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مكان متبقٍ',
      many: '$count مكانًا متبقيًا',
      few: '$count أماكن متبقية',
      two: 'مكانان متبقيان',
      one: 'مكان واحد متبقٍ',
      zero: 'مكتملة',
    );
    return '$_temp0';
  }

  @override
  String get casualRequestPending => 'الطلب قيد الانتظار';

  @override
  String get casualYouAreIn => 'أنت مشارك';

  @override
  String get casualYourGame => 'مباراتك';

  @override
  String bookingWith(String name) {
    return 'مع $name';
  }

  @override
  String get achievementLocked => 'مقفل';

  @override
  String achievementUnlockedOn(String date) {
    return 'فُتح في $date';
  }

  @override
  String get statMatches => 'المباريات';

  @override
  String get statWins => 'الانتصارات';

  @override
  String get statLosses => 'الهزائم';

  @override
  String get statWinRate => 'نسبة الفوز';

  @override
  String get statStreak => 'السلسلة';

  @override
  String get statTitles => 'الألقاب';

  @override
  String get statFinals => 'النهائيات';

  @override
  String get statTournaments => 'البطولات';

  @override
  String get statSets => 'المجموعات فوز–خسارة';

  @override
  String get statGames => 'الأشواط فوز–خسارة';

  @override
  String get statBestStreak => 'أفضل سلسلة انتصارات';

  @override
  String get statWalkovers => 'انسحابات ف–خ';

  @override
  String streakWins(int n) {
    return '$n فوز';
  }

  @override
  String streakLosses(int n) {
    return '$n خسارة';
  }

  @override
  String statLastPlayed(String date) {
    return 'آخر مباراة $date';
  }

  @override
  String get partnerMain => 'الشريك الأساسي';

  @override
  String get partnerBestHistorical => 'أفضل شريك تاريخيًا';

  @override
  String get partnerMostPlayed => 'الأكثر لعبًا معه';

  @override
  String get partnerRecommended => 'شركاء مقترحون';

  @override
  String get partnerNotSet => 'لا يوجد شريك أساسي بعد';

  @override
  String get partnerNotSetHint => 'أرسل طلبًا — يصبح رسميًا عند قبوله.';

  @override
  String partnerUnlockHint(int count) {
    return 'العب $count مباريات موثّقة مع نفس الشريك لفتح هذا.';
  }

  @override
  String get partnerNoHistory => 'لا توجد مباريات موثّقة مع شريك بعد.';

  @override
  String partnerRecord(int won, int played) {
    return '$won فوز · $played مباراة';
  }

  @override
  String get partnerHistory => 'سجل الشراكات';

  @override
  String get partnerRequestAsMain => 'اطلب شراكة أساسية';

  @override
  String get partnerRequestSent => 'تم إرسال طلب الشراكة';

  @override
  String get partnerRemoveMain => 'إلغاء الشراكة';

  @override
  String get partnerRemoveMainConfirm =>
      'لن يبقى شريكك الأساسي. يمكنك إرسال طلب شراكة جديد لاحقًا.';

  @override
  String get partnerRequestsTitle => 'طلبات الشراكة';

  @override
  String get partnerRequestsIncoming => 'الواردة';

  @override
  String get partnerRequestsOutgoing => 'المرسلة';

  @override
  String get partnerRequestsEmpty => 'لا توجد طلبات شراكة حاليًا.';

  @override
  String partnerRequestFrom(String name) {
    return '$name يريدك شريكًا أساسيًا';
  }

  @override
  String partnerRequestTo(String name) {
    return 'بانتظار $name';
  }

  @override
  String get partnerRequestAccepted => 'أصبحتما شريكين أساسيين';

  @override
  String get partnerRecommendedEmpty =>
      'العب بعض المباريات الموثّقة وسنقترح شركاء يناسبون أسلوبك.';

  @override
  String partnerRecommendedBasis(String rating, int matches) {
    return 'بناءً على تقييمك $rating و$matches مباراة موثّقة';
  }

  @override
  String factRatingDiff(String value) {
    return 'فرق التقييم $value';
  }

  @override
  String factTogether(int wins, int matches) {
    return '$wins/$matches فوز معًا';
  }

  @override
  String factVerifiedMatches(int count) {
    return '$count مباراة موثّقة';
  }

  @override
  String factWinRate(String value) {
    return 'نسبة الفوز $value';
  }

  @override
  String factLastPlayed(String when) {
    return 'لعب $when';
  }

  @override
  String get profileTabOverview => 'نظرة عامة';

  @override
  String get profileTabResults => 'النتائج';

  @override
  String get profileTabAchievements => 'الإنجازات';

  @override
  String get profileTabPartners => 'الشركاء';

  @override
  String get profileTabStats => 'الإحصائيات';

  @override
  String profileMemberSince(String date) {
    return 'عضو منذ $date';
  }

  @override
  String get profileFollowers => 'المتابِعون';

  @override
  String get profileFollowing => 'يتابع';

  @override
  String get profileRespects => 'الاحترام';

  @override
  String get profileEdit => 'تعديل الملف';

  @override
  String get profileContact => 'بيانات التواصل (تظهر لك فقط)';

  @override
  String get profileRecentResults => 'النتائج الأخيرة';

  @override
  String get profileTournamentHistory => 'سجل البطولات';

  @override
  String get profileNoResults => 'لا توجد نتائج موثّقة بعد';

  @override
  String get profileNoResultsHint =>
      'تظهر النتائج الرسمية هنا بعد توثيقها من الطاقم.';

  @override
  String get profile3dIdentity => 'الهوية ثلاثية الأبعاد';

  @override
  String get profileRatingHistory => 'سجل التقييم';

  @override
  String get profileSeasonHistory => 'نقاط الموسم';

  @override
  String get profileRespectSent => 'تم إرسال الاحترام';

  @override
  String get resultWon => 'ف';

  @override
  String get resultLost => 'خ';

  @override
  String get resultRanked => 'مصنّفة';

  @override
  String get resultUnranked => 'غير مصنّفة';

  @override
  String resultWithPartner(String name) {
    return 'مع $name';
  }

  @override
  String get placementChampion => 'بطل';

  @override
  String get placementFinalist => 'وصيف';

  @override
  String get achievementsTitle => 'الإنجازات';

  @override
  String achievementsProgress(int unlocked, int total) {
    return '$unlocked من $total مفتوحة';
  }

  @override
  String get achievementsCompetitive => 'تنافسية';

  @override
  String get achievementsSocial => 'اجتماعية';

  @override
  String get achievementsPremiumShelf => 'شارات Premium';

  @override
  String get achievementsPremiumNote =>
      'شارات Premium شكلية — لا تؤثر أبدًا على التقييم أو الترتيب.';

  @override
  String get achievementsEmpty => 'لا توجد إنجازات بعد';

  @override
  String get achievementAutomatic => 'يُفتح تلقائيًا';

  @override
  String get statsAdvanced => 'تحليلات متقدمة';

  @override
  String get statsByStage => 'حسب المرحلة';

  @override
  String get statsGroupStage => 'دور المجموعات';

  @override
  String get statsKnockout => 'خروج المغلوب';

  @override
  String get statsDecidingSets => 'المجموعات الحاسمة';

  @override
  String get statsByCompetition => 'مصنّفة مقابل غير مصنّفة';

  @override
  String get statsPointAnalytics => 'تحليل النقاط';

  @override
  String statsCoverage(String value) {
    return 'التغطية $value';
  }

  @override
  String get statsLimitedData => 'بيانات محدودة';

  @override
  String get statsWinnersByShot => 'النقاط الفائزة حسب الضربة';

  @override
  String get statsErrorsByType => 'الأخطاء حسب النوع';

  @override
  String get statsRatingTimeline => 'تطور التقييم';

  @override
  String get statsAdvancedLocked =>
      'التحليلات المتقدمة متاحة لأعضاء Premium على ملفهم الشخصي.';

  @override
  String statsRecord(int wins, int matches) {
    return '$wins/$matches';
  }

  @override
  String get followersTitle => 'المتابِعون';

  @override
  String get followingTitle => 'المتابَعون';

  @override
  String get followersEmpty => 'لا أحد هنا بعد';

  @override
  String get ratingHistoryTitle => 'سجل التقييم';

  @override
  String get ratingReasonOfficial => 'نتيجة رسمية';

  @override
  String get ratingReasonCorrection => 'عكس تصحيح';

  @override
  String get ratingReasonInactivity => 'عدم النشاط';

  @override
  String get ratingBreakdown => 'طريقة الحساب';

  @override
  String get ratingExpected => 'النتيجة المتوقعة';

  @override
  String get ratingKFactor => 'معامل K الفعلي';

  @override
  String get ratingOwnStrength => 'قوة فريقك';

  @override
  String get ratingOpponentStrength => 'قوة المنافس';

  @override
  String get ratingUpset => 'مفاجأة';

  @override
  String get ratingStage => 'المرحلة';

  @override
  String get ratingHistoryEmpty => 'لا تغييرات في التقييم بعد';

  @override
  String get seasonPointsTitle => 'نقاط الموسم';

  @override
  String get seasonBestStageNote =>
      'تُحسب كل فئة مرة واحدة — أفضل مرحلة وصلت إليها.';

  @override
  String get challengesTitle => 'التحديات';

  @override
  String get challengesIncoming => 'الواردة';

  @override
  String get challengesOutgoing => 'المرسلة';

  @override
  String get challengesEmpty => 'لا توجد تحديات';

  @override
  String challengeFrom(String name) {
    return '$name تحدّاك';
  }

  @override
  String challengeTo(String name) {
    return 'تحدّيت $name';
  }

  @override
  String get searchPlayersTitle => 'ابحث عن لاعبين';

  @override
  String get searchPlayersHint => 'الاسم أو رقم اللاعب';

  @override
  String get searchPlayersEmpty => 'لا يوجد لاعبون مطابقون';

  @override
  String get editProfileTitle => 'تعديل الملف الشخصي';

  @override
  String get editProfileCompetitiveNote =>
      'التقييم والمستوى والنقاط والخبرة تأتي من النتائج الموثّقة ولا يمكن تعديلها.';

  @override
  String get editProfilePhoto => 'تغيير الصورة';

  @override
  String get editProfilePhotoHint =>
      'JPG أو PNG أو WebP · حتى 4 ميغابايت. تُستخدم أيضًا لهويتك ثلاثية الأبعاد.';

  @override
  String get editProfileSaved => 'تم حفظ الملف';

  @override
  String get fieldBio => 'نبذة';

  @override
  String get fieldDateOfBirth => 'تاريخ الميلاد';

  @override
  String get fieldGender => 'الجنس';

  @override
  String get fieldSide => 'جهة اللعب';

  @override
  String get changePasswordTitle => 'تغيير كلمة المرور';

  @override
  String get fieldCurrentPassword => 'كلمة المرور الحالية';

  @override
  String get fieldNewPassword => 'كلمة المرور الجديدة';

  @override
  String get passwordChanged =>
      'تم تغيير كلمة المرور. تم تسجيل الخروج من الجلسات الأخرى.';

  @override
  String get premiumTitle => 'Premium';

  @override
  String get premiumHeadline => 'تدرّب بذكاء. نافس بنفس القواعد.';

  @override
  String get premiumSubhead =>
      'رؤى وتحليلات مبنية فقط على مبارياتك الحقيقية الموثّقة.';

  @override
  String premiumNeverAffects(String items) {
    return 'Premium لا يؤثر أبدًا على $items.';
  }

  @override
  String get premiumNeverAffectsDefault =>
      'Premium لا يؤثر أبدًا على تقييم مهارتك أو ترتيبك في الموسم أو التصنيف أو الأهلية.';

  @override
  String get neverSkillRating => 'تقييم المهارة';

  @override
  String get neverSeasonRanking => 'ترتيب الموسم';

  @override
  String get neverSeeding => 'التصنيف في البطولات';

  @override
  String get neverEligibility => 'أهلية البطولات';

  @override
  String get neverOfficialResults => 'النتائج الرسمية';

  @override
  String get premiumFeatureAi => 'رؤى الذكاء الاصطناعي';

  @override
  String get premiumFeatureAiBody => 'موجز يومي وملخصات أداء وتوصيات.';

  @override
  String get premiumFeatureAnalytics => 'تحليلات متقدمة';

  @override
  String get premiumFeatureAnalyticsBody =>
      'تفاصيل المراحل والمجموعات الحاسمة والضربات والأخطاء.';

  @override
  String get premiumFeature3d => 'هوية رياضية ثلاثية الأبعاد';

  @override
  String get premiumFeature3dBody =>
      'صورة رمزية ثلاثية الأبعاد من صورة ملفك الشخصي.';

  @override
  String get premiumFeatureBadges => 'شارات Premium';

  @override
  String get premiumFeatureBadgesBody =>
      'شارات شكلية منفصلة بوضوح عن ميداليات المنافسة.';

  @override
  String get premiumPlansTitle => 'اختر خطة';

  @override
  String premiumPlanMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count شهر',
      many: '$count شهرًا',
      few: '$count أشهر',
      two: 'شهران',
      one: 'شهر واحد',
      zero: 'أقل من شهر',
    );
    return '$_temp0';
  }

  @override
  String get premiumPlansUnavailable => 'ستظهر الخطط هنا عند نشر الأسعار.';

  @override
  String get premiumCheckoutSoon => 'الدفع الإلكتروني قريبًا';

  @override
  String get premiumSubscribe => 'المتابعة للدفع';

  @override
  String get premiumActive => 'أنت عضو Premium';

  @override
  String premiumActiveUntil(String date) {
    return 'فعّال حتى $date';
  }

  @override
  String get premiumOpenAi => 'فتح رؤى الذكاء الاصطناعي';

  @override
  String get premiumOpen3d => 'فتح الهوية ثلاثية الأبعاد';

  @override
  String get paymentsTitle => 'المدفوعات';

  @override
  String get paymentsEmpty => 'لا توجد مدفوعات بعد';

  @override
  String get paymentStatusTitle => 'حالة الدفع';

  @override
  String get paymentWaiting => 'بانتظار تأكيد مزود الدفع…';

  @override
  String get paymentOpenCheckout => 'فتح صفحة الدفع';

  @override
  String get paymentSucceeded => 'تم تأكيد الدفع';

  @override
  String get paymentFailedTitle => 'لم تتم عملية الدفع';

  @override
  String paymentReference(String ref) {
    return 'المرجع $ref';
  }

  @override
  String get paymentOnlyBackend =>
      'لا نعتبر الدفع مكتملًا إلا بعد تأكيد الخادم.';

  @override
  String get aiTitle => 'رؤى الذكاء الاصطناعي';

  @override
  String get aiGenerate => 'إنشاء';

  @override
  String get aiRefresh => 'تحديث';

  @override
  String get aiWorking => 'جارٍ تحليل مبارياتك…';

  @override
  String get aiFailed => 'تعذر إنشاء هذه الرؤية.';

  @override
  String get aiNotGenerated => 'لم يتم إنشاؤها بعد';

  @override
  String aiCoverage(String level) {
    return 'تغطية البيانات: $level';
  }

  @override
  String get aiCoverageNone => 'لا يوجد';

  @override
  String get aiCoverageLow => 'منخفضة';

  @override
  String get aiCoverageMedium => 'متوسطة';

  @override
  String get aiCoverageHigh => 'عالية';

  @override
  String aiMatchesUsed(int count) {
    return '$count مباراة مستخدمة';
  }

  @override
  String get aiHighlights => 'أبرز النقاط';

  @override
  String get aiRecommendations => 'التوصيات';

  @override
  String get aiFacts => 'الحقائق';

  @override
  String aiGeneratedAt(String when) {
    return 'أُنشئت $when';
  }

  @override
  String get aiTypePlayerInsights => 'رؤى اللاعب';

  @override
  String get aiTypePerformanceSummary => 'ملخص الأداء';

  @override
  String get aiTypePartnerRecommendation => 'توصية الشريك';

  @override
  String get aiTypeTournamentRecommendation => 'توصية البطولات';

  @override
  String get aiTypeCoachRecommendation => 'توصية المدرب';

  @override
  String get aiTypeDevelopmentRecommendation => 'خطة التطوير';

  @override
  String get aiTypeDailyBrief => 'الموجز اليومي';

  @override
  String get threeDTitle => 'الهوية ثلاثية الأبعاد';

  @override
  String get threeDGenerate => 'أنشئ هويتي ثلاثية الأبعاد';

  @override
  String get threeDRegenerate => 'إنشاء مرة أخرى';

  @override
  String get threeDProcessing =>
      'جارٍ بناء هويتك ثلاثية الأبعاد. قد يستغرق ذلك بضع دقائق.';

  @override
  String get threeDNeedsPhoto =>
      'ارفع صورة للملف الشخصي أولًا — تُنشأ هويتك ثلاثية الأبعاد منها.';

  @override
  String get threeDUploadPhoto => 'رفع صورة';

  @override
  String get threeDFailed => 'فشل الإنشاء. يمكنك المحاولة مجددًا.';

  @override
  String get threeDEmpty => 'لا توجد هوية ثلاثية الأبعاد بعد';

  @override
  String get bookingStatus => 'الحالة';

  @override
  String get bookingPrice => 'السعر';

  @override
  String get bookingDuration => 'المدة';

  @override
  String get bookingLocation => 'المكان';

  @override
  String get bookingTrainingType => 'نوع التدريب';

  @override
  String get bookingNotes => 'ملاحظات';

  @override
  String get bookingFeedback => 'ملاحظات المدرب';

  @override
  String bookingXpAwarded(int xp) {
    return '+$xp خبرة مكتسبة';
  }

  @override
  String get bookingCancel => 'إلغاء الحجز';

  @override
  String get bookingCancelReason => 'السبب (اختياري)';

  @override
  String get bookingCancelled => 'تم إلغاء الحجز';

  @override
  String get bookingCancelWindow =>
      'يمكن إلغاء الحجوزات المؤكدة حتى 24 ساعة قبل البدء.';

  @override
  String get bookingReview => 'قيّم هذه الجلسة';

  @override
  String get bookingReviewComment => 'تعليق (اختياري)';

  @override
  String get bookingReviewThanks => 'شكرًا على تقييمك';

  @override
  String get bookingYourReview => 'تقييمك';

  @override
  String bookingRejectedReason(String reason) {
    return 'مرفوض: $reason';
  }

  @override
  String bookingCancelledBy(String who) {
    return 'أُلغي بواسطة $who';
  }

  @override
  String get bookingByPlayer => 'اللاعب';

  @override
  String get bookingByCoach => 'المدرب';

  @override
  String get bookingProgressRecorded => 'التقدم المسجّل';

  @override
  String get bookingDetailTitle => 'جلسة التدريب';

  @override
  String get competeTitle => 'المنافسات';

  @override
  String get competeTabTournaments => 'البطولات';

  @override
  String get competeTabLive => 'مباشر الآن';

  @override
  String get competeSearchHint => 'ابحث عن بطولة';

  @override
  String get filterRanked => 'مصنّفة';

  @override
  String get filterCertified => 'رسمية';

  @override
  String get filterSocial => 'ودية';

  @override
  String get filterUpcoming => 'القادمة';

  @override
  String get liveNowEmptyTitle => 'لا توجد مباريات في الملعب الآن';

  @override
  String get liveNowEmptyMessage =>
      'تظهر المباريات المباشرة هنا فور بدء تسجيلها.';

  @override
  String get tournamentTabOverview => 'نظرة عامة';

  @override
  String get tournamentTabLive => 'مباشر';

  @override
  String get tournamentTabSchedule => 'الجدول';

  @override
  String get tournamentTabResults => 'النتائج';

  @override
  String get tournamentRules => 'القوانين';

  @override
  String get tournamentAbout => 'عن البطولة';

  @override
  String get tournamentOpenMap => 'افتح في الخرائط';

  @override
  String tournamentRegistrationWindow(String from, String to) {
    return 'التسجيل $from – $to';
  }

  @override
  String get tournamentChampion => 'البطل';

  @override
  String get tournamentNoLive => 'لا توجد مباريات مباشرة في هذه البطولة الآن.';

  @override
  String get tournamentNoSchedule => 'لم يُنشر الجدول بعد.';

  @override
  String get tournamentNoResults => 'لا توجد نتائج موثّقة بعد.';

  @override
  String get tournamentRankedNote =>
      'النتائج الموثّقة هنا تؤثر على تقييم المهارة ونقاط الموسم.';

  @override
  String get tournamentUnrankedNote =>
      'النتائج هنا لا تؤثر على تقييم المهارة أو ترتيب الموسم.';

  @override
  String get categoryRegister => 'سجّل';

  @override
  String get categoryJoinWaitlist => 'انضم لقائمة الانتظار';

  @override
  String get categoryRegistered => 'مسجّل';

  @override
  String get categoryView => 'الفرق والمجموعات والشجرة';

  @override
  String categoryWaitlist(int count) {
    return '$count في الانتظار';
  }

  @override
  String get categoryTabTeams => 'الفرق';

  @override
  String get categoryTabGroups => 'المجموعات';

  @override
  String get categoryTabBracket => 'الشجرة';

  @override
  String get categoryNoTeams => 'لا توجد فرق بعد';

  @override
  String get categoryNoGroups => 'تظهر المجموعات بعد إجراء القرعة.';

  @override
  String get categoryNoBracket => 'تُنشأ الشجرة بعد دور المجموعات.';

  @override
  String get teamWithdrawn => 'منسحب';

  @override
  String get teamDisqualified => 'مستبعد';

  @override
  String teamSeed(int seed) {
    return 'المصنّف $seed';
  }

  @override
  String get standingsPlayed => 'لعب';

  @override
  String get standingsWins => 'ف';

  @override
  String get standingsLosses => 'خ';

  @override
  String get standingsSetDiff => 'فرق م';

  @override
  String get standingsGameDiff => 'فرق ش';

  @override
  String get standingsPoints => 'نقاط';

  @override
  String get standingsTeam => 'الفريق';

  @override
  String get groupFinished => 'انتهت';

  @override
  String registerTitle2(String category) {
    return 'التسجيل في $category';
  }

  @override
  String get registerPartner => 'الشريك';

  @override
  String get registerPickPartner => 'اختر شريكًا';

  @override
  String get registerChangePartner => 'تغيير الشريك';

  @override
  String get registerCheckEligibility => 'جارٍ التحقق من الأهلية…';

  @override
  String get registerEligible => 'أنت مؤهل';

  @override
  String get registerYourIssues => 'أنت';

  @override
  String get registerPartnerIssues => 'شريكك';

  @override
  String get registerClosed => 'التسجيل مغلق';

  @override
  String get registerFullWaitlist =>
      'هذه الفئة مكتملة — ستنضم لقائمة الانتظار وستُرقّى تلقائيًا عند توفر مكان.';

  @override
  String registerFeeNote(String amount) {
    return 'رسوم التسجيل $amount. يتم تأكيد الدفع من نظام المنظم.';
  }

  @override
  String get registerSubmit => 'تأكيد التسجيل';

  @override
  String get registerDone => 'تم تسجيلك';

  @override
  String get registerWaitlisted => 'أنت في قائمة الانتظار';

  @override
  String get myRegistrationsTitle => 'تسجيلاتي';

  @override
  String get myRegistrationsEmpty => 'لم تسجل في أي بطولة بعد';

  @override
  String get registrationCancel => 'إلغاء التسجيل';

  @override
  String get registrationCancelConfirm => 'سيتم تحرير مكانك.';

  @override
  String get registrationCancelled => 'تم إلغاء التسجيل';

  @override
  String get registrationPay => 'ادفع الآن';

  @override
  String get registrationPartnerChanged => 'تم تحديث الشريك';

  @override
  String registrationPromoted(String date) {
    return 'رُقّي من الانتظار $date';
  }

  @override
  String get liveTitle => 'مركز المباراة';

  @override
  String get livePointFeed => 'نقطة بنقطة';

  @override
  String get livePointFeedEmpty => 'لم تُسجل أي نقاط بعد.';

  @override
  String get liveTiebreak => 'شوط فاصل';

  @override
  String get liveMatchOver => 'انتهت المباراة';

  @override
  String liveWinnerTitle(String team) {
    return '$team يفوز!';
  }

  @override
  String get liveResultPending => 'النتيجة بانتظار توثيق الطاقم';

  @override
  String get livePartialDetail => 'تفاصيل جزئية';

  @override
  String livePointBy(String team) {
    return 'نقطة لـ $team';
  }

  @override
  String get liveNotStarted => 'لم تبدأ';

  @override
  String get liveCorrected => 'مُصحّح';

  @override
  String get rankingsTabSeason => 'الموسم';

  @override
  String get rankingsTabSkill => 'المهارة';

  @override
  String get rankingsTabXp => 'الخبرة';

  @override
  String get rankingsYou => 'أنت';

  @override
  String get rankingsSeasonPicker => 'الموسم';

  @override
  String get rankingsSearchHint => 'ابحث في الترتيب';

  @override
  String get rankingsXpNote =>
      'الخبرة تكافئ النشاط ولا تؤثر أبدًا على الترتيب أو التصنيف.';

  @override
  String get rankingsSkillNote =>
      'يتغير تقييم المهارة فقط بالنتائج الموثّقة من البطولات المصنّفة.';

  @override
  String get rankingsSeasonNote => 'نقاط الموسم تحسب أفضل مرحلة لك في كل فئة.';

  @override
  String rankingsLevelPosition(int position, String level) {
    return '#$position في $level';
  }

  @override
  String get playTitle => 'العب';

  @override
  String get playTabCasual => 'ودية';

  @override
  String get playTabCoaches => 'المدربون';

  @override
  String get casualMyMatches => 'مبارياتي';

  @override
  String get casualCreated => 'أنشأتها';

  @override
  String get casualJoined => 'انضممت إليها';

  @override
  String get casualDetailTitle => 'مباراة ودية';

  @override
  String get casualParticipants => 'اللاعبون';

  @override
  String get casualRequests => 'طلبات الانضمام';

  @override
  String get casualNoRequests => 'لا توجد طلبات معلّقة';

  @override
  String get casualLeave => 'مغادرة المباراة';

  @override
  String get casualCancelGame => 'إلغاء المباراة';

  @override
  String get casualCancelConfirm => 'سيتم إشعار كل من انضم.';

  @override
  String get casualLeft => 'غادرت المباراة';

  @override
  String get casualCancelled => 'تم إلغاء المباراة';

  @override
  String get fieldVenue => 'المكان (اختياري)';

  @override
  String get fieldCourt => 'الملعب (اختياري)';

  @override
  String get venueAny => 'أي مكان';

  @override
  String get courtAny => 'أي ملعب';

  @override
  String get venuesTitle => 'الملاعب';

  @override
  String venueCourts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ملعب',
      many: '$count ملعبًا',
      few: '$count ملاعب',
      two: 'ملعبان',
      one: 'ملعب واحد',
      zero: 'لا ملاعب',
    );
    return '$_temp0';
  }

  @override
  String get venueUpcoming => 'البطولات القادمة';

  @override
  String get venuesEmpty => 'لا توجد ملاعب';

  @override
  String get coachesFilterAll => 'الكل';

  @override
  String get coachesSortRating => 'الأعلى تقييمًا';

  @override
  String get coachesSortPrice => 'السعر';

  @override
  String get coachesSortName => 'الاسم';

  @override
  String get coachesSearchHint => 'ابحث عن مدرب أو مدينة';

  @override
  String get coachLanguages => 'اللغات';

  @override
  String get coachExperience => 'الخبرة';

  @override
  String get coachTrainingTypes => 'أنواع التدريب';

  @override
  String get coachAvailability => 'المواعيد المتاحة';

  @override
  String get coachNoSlots => 'لا توجد مواعيد متاحة في هذا اليوم';

  @override
  String get coachReviews => 'التقييمات';

  @override
  String get coachNoReviews => 'لا توجد تقييمات بعد — كن الأول بعد جلستك.';

  @override
  String get coachBook => 'احجز جلسة';

  @override
  String coachBookSlot(String time) {
    return 'احجز $time';
  }

  @override
  String get bookingSheetTitle => 'تأكيد الحجز';

  @override
  String get bookingPickSlot => 'اختر موعدًا أولًا';

  @override
  String get bookingSummary => 'الملخص';

  @override
  String get bookingTotal => 'الإجمالي';

  @override
  String get bookingConfirm => 'طلب الحجز';

  @override
  String get bookingRequested => 'تم طلب الحجز — سيؤكده المدرب.';

  @override
  String get bookingSlotTaken =>
      'تم حجز هذا الموعد للتو. إليك المواعيد المحدثة.';

  @override
  String get myBookingsTitle => 'تدريباتي';

  @override
  String get myBookingsUpcoming => 'القادمة';

  @override
  String get myBookingsPast => 'السابقة';

  @override
  String get myBookingsEmpty => 'لا توجد جلسات هنا';

  @override
  String get trainingProgressTitle => 'تقدم التدريب';

  @override
  String get trainingProgressEmpty =>
      'ستظهر تقييمات مدربك لمهاراتك هنا بعد الجلسات.';

  @override
  String trainingLatest(int score) {
    return 'الأحدث $score/10';
  }

  @override
  String trainingAssessments(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تقييم',
      many: '$count تقييمًا',
      few: '$count تقييمات',
      two: 'تقييمان',
      one: 'تقييم واحد',
      zero: 'لا تقييمات',
    );
    return '$_temp0';
  }

  @override
  String get coachPortalTitle => 'بوابة المدرب';

  @override
  String get coachPortalToday => 'الجلسات القادمة';

  @override
  String get coachPortalPending => 'طلبات بانتظار الرد';

  @override
  String get coachPortalAvailability => 'المواعيد';

  @override
  String get coachPortalBookings => 'الحجوزات';

  @override
  String get coachPortalProfile => 'ملف المدرب';

  @override
  String get coachPortalSwitchToPlayer => 'تطبيق اللاعب';

  @override
  String get coachPortalOpen => 'بوابة المدرب';

  @override
  String get slotAdd => 'إضافة مواعيد';

  @override
  String get slotDate => 'التاريخ';

  @override
  String get slotStart => 'البداية';

  @override
  String get slotEnd => 'النهاية';

  @override
  String get slotRepeat => 'تكرار أسبوعي';

  @override
  String slotRepeatWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'لـ $count أسبوع إضافي',
      many: 'لـ $count أسبوعًا إضافيًا',
      few: 'لـ $count أسابيع إضافية',
      two: 'لأسبوعين إضافيين',
      one: 'لأسبوع إضافي',
      zero: 'بدون تكرار',
    );
    return '$_temp0';
  }

  @override
  String get slotActive => 'قابل للحجز';

  @override
  String get slotBooked => 'محجوز';

  @override
  String get slotDeleteConfirm => 'حذف هذا الموعد؟';

  @override
  String get slotsCreated => 'تمت إضافة المواعيد';

  @override
  String get slotsEmptyDay => 'لا توجد مواعيد في هذا اليوم';

  @override
  String get bookingConfirmAction => 'تأكيد';

  @override
  String get bookingRejectAction => 'رفض';

  @override
  String get bookingCompleteAction => 'تحديد كمكتمل';

  @override
  String get bookingFeedbackAction => 'إرسال ملاحظات';

  @override
  String get bookingProgressAction => 'تسجيل التقدم';

  @override
  String get bookingReasonOptional => 'السبب (اختياري)';

  @override
  String get bookingFeedbackHint => 'ما الذي تم بشكل جيد وما الذي يحتاج عملًا';

  @override
  String get bookingUpdated => 'تم تحديث الحجز';

  @override
  String get progressSkill => 'المهارة';

  @override
  String get progressScore => 'الدرجة (1–10)';

  @override
  String get progressAddSkill => 'إضافة مهارة';

  @override
  String get progressSaved => 'تم حفظ التقدم';

  @override
  String get coachFieldCity => 'المدينة';

  @override
  String get coachFieldPrice => 'السعر للساعة';

  @override
  String get coachFieldYears => 'سنوات الخبرة';

  @override
  String get coachFieldSpecialties => 'التخصصات';

  @override
  String get coachFieldLanguages => 'اللغات (مفصولة بفاصلة)';

  @override
  String get coachProfileSaved => 'تم حفظ ملف المدرب';

  @override
  String get notificationsMarkAllRead => 'تحديد الكل كمقروء';

  @override
  String get notificationsFilterUnread => 'غير المقروءة';

  @override
  String get notificationsFilterAll => 'الكل';

  @override
  String get settingsNotifications => 'الإشعارات';

  @override
  String get settingsPushEnabled => 'إشعارات الدفع مفعّلة';

  @override
  String get settingsPushDisabled => 'إشعارات الدفع متوقفة';

  @override
  String get settingsPushUnavailable =>
      'إشعارات الدفع غير مهيأة في هذا الإصدار';

  @override
  String get settingsPushEnable => 'تفعيل';

  @override
  String get settingsAccount => 'الحساب';

  @override
  String get settingsPremium => 'Premium';

  @override
  String get settingsPayments => 'المدفوعات';

  @override
  String get settingsMyTraining => 'تدريباتي';

  @override
  String get settingsStaff => 'تسجيل النتائج للطاقم';

  @override
  String settingsVersion(String version) {
    return 'الإصدار $version';
  }

  @override
  String get settingsLogOutConfirm => 'ستحتاج لتسجيل الدخول مجددًا.';

  @override
  String get scorekeeperTitle => 'مسجّل النقاط';

  @override
  String get scorekeeperLogin => 'دخول الطاقم';

  @override
  String get scorekeeperLoginField => 'اسم الدخول';

  @override
  String get scorekeeperMatches => 'المباريات المسندة';

  @override
  String get scorekeeperNoMatches => 'لا توجد مباريات مسندة حاليًا.';

  @override
  String get scorekeeperPointTo => 'نقطة';

  @override
  String get scorekeeperUndo => 'تراجع عن آخر نقطة';

  @override
  String get scorekeeperAddDetail => 'إضافة تفاصيل';

  @override
  String get scorekeeperDetailOptional => 'اختياري — تم تسجيل النتيجة بالفعل.';

  @override
  String get scorekeeperEndingType => 'كيف انتهت';

  @override
  String get scorekeeperShot => 'الضربة';

  @override
  String get scorekeeperError => 'الخطأ';

  @override
  String get scorekeeperServe => 'الإرسال';

  @override
  String get scorekeeperPlayer => 'اللاعب';

  @override
  String get scorekeeperSaved => 'تم حفظ التفاصيل';

  @override
  String get scorekeeperRecordPoint => 'تسجيل النقطة';

  @override
  String get scorekeeperEditLastPoint => 'تعديل آخر نقطة';

  @override
  String get scorekeeperReasonHelp =>
      'اختر كيف انتهت النقطة والتفاصيل المطلوبة.';

  @override
  String get scorekeeperPlayerWinning => 'اللاعب (الفريق الفائز بالنقطة)';

  @override
  String get scorekeeperPlayerLosing => 'اللاعب (الفريق الخاسر للنقطة)';

  @override
  String get scorekeeperLogout => 'الخروج من وضع التسجيل';

  @override
  String get pmPhoneKicker => 'أهلًا بك في المجتمع';

  @override
  String get pmPhoneTitle => 'ادخل للملعب';

  @override
  String get pmPhoneSubtitle => 'سجّل برقم هاتفك وابدأ ببناء هويتك الرياضية.';

  @override
  String get pmPhoneLabel => 'رقم الهاتف';

  @override
  String get pmPhoneHint => 'سنرسل لك رمز تحقق عبر SMS';

  @override
  String get pmPhoneInvalid => 'الرقم يجب أن يبدأ بـ 77 أو 78 أو 79';

  @override
  String get pmContinue => 'متابعة';

  @override
  String get pmOrContinueWith => 'أو تابع باستخدام';

  @override
  String get pmLegalPrefix => 'بالمتابعة أنت توافق على ';

  @override
  String get pmLegalTerms => 'شروط الاستخدام';

  @override
  String get pmLegalAnd => ' و';

  @override
  String get pmLegalPrivacy => 'سياسة الخصوصية';

  @override
  String get pmStaffSignIn => 'دخول الطاقم';

  @override
  String get pmBack => 'رجوع';

  @override
  String get pmOtpKicker => 'خطوة أخيرة';

  @override
  String get pmOtpTitle => 'أدخل رمز التحقق';

  @override
  String get pmOtpSentTo => 'أرسلنا رمزًا من 6 أرقام إلى';

  @override
  String get pmOtpEdit => 'تعديل';

  @override
  String get pmOtpLabel => 'رمز التحقق';

  @override
  String get pmOtpNotReceived => 'لم يصلك الرمز؟';

  @override
  String get pmOtpResend => 'إعادة الإرسال';

  @override
  String get pmOtpConfirm => 'تأكيد والدخول';

  @override
  String get pmWelcomeTitle => 'هويتك جاهزة';

  @override
  String get pmWelcomeSubtitle => 'أهلًا بك في Playmaker — الملعب بانتظارك';

  @override
  String get failureInvalidPhone => 'أدخل رقم هاتف أردني صحيح.';

  @override
  String get failureOtpExpired => 'انتهت صلاحية الرمز. اطلب رمزًا جديدًا.';

  @override
  String get failureOtpSessionInvalid =>
      'عملية التحقق لم تعد صالحة. اطلب رمزًا جديدًا.';

  @override
  String get failureOtpResendTooSoon => 'انتظر قليلًا قبل طلب رمز جديد.';

  @override
  String get failureOtpResendLimit =>
      'وصلت للحد الأقصى لإعادة الإرسال. حاول لاحقًا.';

  @override
  String get failureOtpTooManyAttempts =>
      'محاولات خاطئة كثيرة. اطلب رمزًا جديدًا.';

  @override
  String get failureOtpProviderUnavailable =>
      'خدمة الرسائل غير متاحة مؤقتًا. حاول بعد قليل.';

  @override
  String get failureSocialTokenInvalid =>
      'تعذّر التحقق من حسابك. حاول مرة أخرى.';

  @override
  String get failureSocialUnavailable =>
      'خيار تسجيل الدخول هذا غير متاح حاليًا.';

  @override
  String get fieldCountry => 'الدولة';

  @override
  String get partnerEnded => 'تم إلغاء الشراكة';

  @override
  String get duo3dTitle => 'هوية الثنائي ثلاثية الأبعاد';

  @override
  String get duo3dBody => 'مشهد ثلاثي الأبعاد لك ولشريكك معًا في الملعب.';

  @override
  String get duo3dGenerate => 'أنشئ مشهدنا';

  @override
  String get duo3dRegenerate => 'أنشئ مشهدًا جديدًا';

  @override
  String get duo3dProcessing => 'جاري إنشاء مشهدكما… قد يستغرق ذلك بضع دقائق.';

  @override
  String get duo3dFailed => 'فشلت المحاولة الأخيرة. حاول مرة أخرى.';

  @override
  String get duo3dNeedsPhotos => 'يجب أن تكون لديك ولشريكك صورة شخصية أولًا.';

  @override
  String get duo3dComingSoon => 'مشاهد الثنائي قريبًا.';

  @override
  String get duo3dPremium => 'مشاهد الثنائي ضمن Premium.';
}
