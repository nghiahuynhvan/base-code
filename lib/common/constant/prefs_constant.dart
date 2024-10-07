part of 'constant.dart';

/// [PrefsConstants] file contains the variables default variables
/// or key of shared prefs in app.
class PrefsConstants {
  /// Shared Preference key
  /// keys of language code Shared Preference
  static const keyLanguageCodeSharedPref = "language_code_shared_pref";

  /// Shared Preference key
  /// keys of language code first save Shared Preference
  ///
  /// It is only used for Android below TIRAMISU version
  /// Because Android below TIRAMISU does not support pref-language selection,
  /// but it is expected that the default language when starting the app for
  /// the first time is ja, instead of en as the default system language
  static const keyLanguageFirstSaveSharedPref =
      "language_first_save_shared_pref";

  /// keys of theme Shared Preference
  static const keyThemeSharedPref = "theme_shared_pref";

  /// keys of auth logged Shared Preference
  static const keyAuthLoggedSharedPref = "auth_logged_shared_pref";

  /// keys of token Shared Preference
  static const keyTokenSharedPref = "token_shared_pref";

  /// keys of logged to company Shared Preference
  static const keyLogCompanySharedPref = "log_company_shared_pref";

  /// keys of id company Shared Preference
  static const keyIdCompanySharedPref = "id_company_shared_pref";

  /// keys of name company Shared Preference
  static const keyNameCompanySharedPref = "name_company_shared_pref";

  /// keys of id company Shared Preference
  static const keySessionIdSharedPref = "session_id";

  /// keys of email Shared Preference
  static const keyEmailSharedPref = "email_shared_pref";

  /// keys of password Shared Preference
  static const keyPasswordSharedPref = "password_shared_pref";

  /// keys of save email and password Shared Preference
  static const keySaveEmailPasswordSharedPref =
      "save_email_password_shared_pref";

  /// keys of save email and password Shared Preference
  static const keySaveLinkDomainSharedPref = "save_link_domain_shared_pref";

  /// keys of role Shared Preference
  static const keyRoleSharedPref = "name_role_shared_pref";

  /// keys of id profile Shared Preference
  static const keyIdProfileSharedPref = "name_id_profile_shared_pref";

  /// keys of tenant Shared Preference
  static const keyTenantSharedPref = "name_tenant_shared_pref";
}
