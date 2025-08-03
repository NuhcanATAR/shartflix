import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @sign_in_title.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get sign_in_title;

  /// No description provided for @sign_in_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Tempus varius a vitae interdum id\ntortor elementum tristique eleifend at'**
  String get sign_in_sub_title;

  /// No description provided for @sign_in_email_field.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get sign_in_email_field;

  /// No description provided for @sign_in_password_field.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get sign_in_password_field;

  /// No description provided for @sign_in_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get sign_in_forgot_password;

  /// No description provided for @sign_in_button.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get sign_in_button;

  /// No description provided for @sign_in_register_title.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get sign_in_register_title;

  /// No description provided for @sign_in_register.
  ///
  /// In en, this message translates to:
  /// **'Register!'**
  String get sign_in_register;

  /// No description provided for @sign_in_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please check your information!'**
  String get sign_in_error;

  /// No description provided for @sign_in_loading.
  ///
  /// In en, this message translates to:
  /// **'Please wait...'**
  String get sign_in_loading;

  /// No description provided for @sign_up_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get sign_up_title;

  /// No description provided for @sign_up_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Tempus varius a vitae interdum id tortor elementum tristique eleifend at.'**
  String get sign_up_sub_title;

  /// No description provided for @sign_up_name_field.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get sign_up_name_field;

  /// No description provided for @sign_up_email_field.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get sign_up_email_field;

  /// No description provided for @sign_up_password_field.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get sign_up_password_field;

  /// No description provided for @sign_up_password_repead_field.
  ///
  /// In en, this message translates to:
  /// **'Repeat Password'**
  String get sign_up_password_repead_field;

  /// No description provided for @sign_up_agreement_title_one.
  ///
  /// In en, this message translates to:
  /// **'I have read and accept the'**
  String get sign_up_agreement_title_one;

  /// No description provided for @sign_up_agreement_title_second.
  ///
  /// In en, this message translates to:
  /// **'user agreement'**
  String get sign_up_agreement_title_second;

  /// No description provided for @sign_up_agreement_title_three.
  ///
  /// In en, this message translates to:
  /// **'Please read this agreement before proceeding.'**
  String get sign_up_agreement_title_three;

  /// No description provided for @sign_up_button.
  ///
  /// In en, this message translates to:
  /// **'Register Now'**
  String get sign_up_button;

  /// No description provided for @sign_up_login_title.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get sign_up_login_title;

  /// No description provided for @sign_up_login.
  ///
  /// In en, this message translates to:
  /// **'Sign In!'**
  String get sign_up_login;

  /// No description provided for @sign_up_password_error.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match, please check your entries.'**
  String get sign_up_password_error;

  /// No description provided for @sign_up_success.
  ///
  /// In en, this message translates to:
  /// **'Your account has been successfully created!'**
  String get sign_up_success;

  /// No description provided for @sign_up_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please check your information!'**
  String get sign_up_error;

  /// No description provided for @sign_up_loading.
  ///
  /// In en, this message translates to:
  /// **'Please wait...'**
  String get sign_up_loading;

  /// No description provided for @home_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please try again later!'**
  String get home_error;

  /// No description provided for @navigation_bar_menu_one.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navigation_bar_menu_one;

  /// No description provided for @navigation_bar_menu_second.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navigation_bar_menu_second;

  /// No description provided for @navigation_bar_exit_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get navigation_bar_exit_dialog_title;

  /// No description provided for @navigation_bar_exit_dialog_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Choose your action to log out!'**
  String get navigation_bar_exit_dialog_sub_title;

  /// No description provided for @navigation_bar_exit_dialog_exit_account_btn.
  ///
  /// In en, this message translates to:
  /// **'Log Out of Account'**
  String get navigation_bar_exit_dialog_exit_account_btn;

  /// No description provided for @navigation_bar_exit_app_btn.
  ///
  /// In en, this message translates to:
  /// **'Close App'**
  String get navigation_bar_exit_app_btn;

  /// No description provided for @profile_appbar.
  ///
  /// In en, this message translates to:
  /// **'Profile Detail'**
  String get profile_appbar;

  /// No description provided for @profile_photo_add_btn.
  ///
  /// In en, this message translates to:
  /// **'Add Photo'**
  String get profile_photo_add_btn;

  /// No description provided for @profile_favorite_list_title.
  ///
  /// In en, this message translates to:
  /// **'Favorite Movies'**
  String get profile_favorite_list_title;

  /// No description provided for @profile_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get profile_error;

  /// No description provided for @profile_photo_add_title.
  ///
  /// In en, this message translates to:
  /// **'Upload Your Photos'**
  String get profile_photo_add_title;

  /// No description provided for @profile_photo_add_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Resources out incentivize\nrelaxation floor loss cc.'**
  String get profile_photo_add_sub_title;

  /// No description provided for @profile_photo_add_next_btn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get profile_photo_add_next_btn;

  /// No description provided for @profile_photo_add_success.
  ///
  /// In en, this message translates to:
  /// **'Profile photo updated!'**
  String get profile_photo_add_success;

  /// No description provided for @profile_photo_add_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please try again later!'**
  String get profile_photo_add_error;

  /// No description provided for @profile_photo_add_loading.
  ///
  /// In en, this message translates to:
  /// **'Uploading photo, please wait...'**
  String get profile_photo_add_loading;

  /// No description provided for @go_router_page_not_found.
  ///
  /// In en, this message translates to:
  /// **'Page not found'**
  String get go_router_page_not_found;

  /// No description provided for @validator_required_field.
  ///
  /// In en, this message translates to:
  /// **'Required Field'**
  String get validator_required_field;

  /// No description provided for @validator_invalid_value.
  ///
  /// In en, this message translates to:
  /// **'Invalid Value'**
  String get validator_invalid_value;

  /// No description provided for @validator_email_empty_error.
  ///
  /// In en, this message translates to:
  /// **'Email field cannot be empty'**
  String get validator_email_empty_error;

  /// No description provided for @validator_invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get validator_invalid_email;

  /// No description provided for @validator_password_empty.
  ///
  /// In en, this message translates to:
  /// **'Password field cannot be empty'**
  String get validator_password_empty;

  /// No description provided for @validator_password_error_one.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters long'**
  String get validator_password_error_one;

  /// No description provided for @validator_password_error_second.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter'**
  String get validator_password_error_second;

  /// No description provided for @validator_password_error_three.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one lowercase letter'**
  String get validator_password_error_three;

  /// No description provided for @validator_password_error_four.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one digit'**
  String get validator_password_error_four;

  /// No description provided for @validator_password_error_five.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one special character'**
  String get validator_password_error_five;

  /// No description provided for @validator_phone_number_empty.
  ///
  /// In en, this message translates to:
  /// **'Required Field'**
  String get validator_phone_number_empty;

  /// No description provided for @validator_phone_number_error.
  ///
  /// In en, this message translates to:
  /// **'Invalid Phone Number'**
  String get validator_phone_number_error;

  /// No description provided for @validator_phone_number_error_second.
  ///
  /// In en, this message translates to:
  /// **'Invalid Phone Number'**
  String get validator_phone_number_error_second;

  /// No description provided for @bonus_card_title.
  ///
  /// In en, this message translates to:
  /// **'Bonuses You Will Receive'**
  String get bonus_card_title;

  /// No description provided for @bonus_card_pro_one_label.
  ///
  /// In en, this message translates to:
  /// **'Premium\nAccount'**
  String get bonus_card_pro_one_label;

  /// No description provided for @bonus_card_pro_second_label.
  ///
  /// In en, this message translates to:
  /// **'More\nMatches'**
  String get bonus_card_pro_second_label;

  /// No description provided for @bonus_card_pro_three_label.
  ///
  /// In en, this message translates to:
  /// **'Highligh\nFeature'**
  String get bonus_card_pro_three_label;

  /// No description provided for @bonus_card_pro_four_label.
  ///
  /// In en, this message translates to:
  /// **'More\nLikes'**
  String get bonus_card_pro_four_label;

  /// No description provided for @expanded_label_more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get expanded_label_more;

  /// No description provided for @expanded_label_less.
  ///
  /// In en, this message translates to:
  /// **'Less'**
  String get expanded_label_less;

  /// No description provided for @limited_offer_card_title.
  ///
  /// In en, this message translates to:
  /// **'Limited Offer'**
  String get limited_offer_card_title;

  /// No description provided for @limited_offer_card_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Select your token package to\nget bonuses and unlock new episodes!'**
  String get limited_offer_card_sub_title;

  /// No description provided for @limited_offer_card_all_tokens_btn.
  ///
  /// In en, this message translates to:
  /// **'View All Tokens'**
  String get limited_offer_card_all_tokens_btn;

  /// No description provided for @package_list_title.
  ///
  /// In en, this message translates to:
  /// **'Select a token package to unlock'**
  String get package_list_title;

  /// No description provided for @package_list_token_label.
  ///
  /// In en, this message translates to:
  /// **'Token'**
  String get package_list_token_label;

  /// No description provided for @package_list_weekly.
  ///
  /// In en, this message translates to:
  /// **'Per week'**
  String get package_list_weekly;

  /// No description provided for @pro_button_text.
  ///
  /// In en, this message translates to:
  /// **'Limited Offer'**
  String get pro_button_text;

  /// No description provided for @language_select_appbar.
  ///
  /// In en, this message translates to:
  /// **'Language Selection'**
  String get language_select_appbar;

  /// No description provided for @language_select_english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language_select_english;

  /// No description provided for @language_select_turkey.
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get language_select_turkey;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
