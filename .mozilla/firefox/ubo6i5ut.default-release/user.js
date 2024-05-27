/*=====================================================================
                   __
     _  __ __ _   / /__
    | |/ //  ' \ /  '_/
by  |___//_/_/_//_/\_\
@vmkxyz on gitlab and github

my custom user.js for firefox that enhances privacy and does some quality of life changes

=====================================================================*/

/** ABOUT:CONFIG WARNING **/
user_pref("browser.aboutConfig.showWarning", false);

/** USE CUSTOM CSS **/
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

/** TELEMETRY **/
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.coverage.endpoint.base", "");
user_pref("browser.ping-centre.telemetry", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);

/** HARDENS THE SSL PREFERENCE **/
user_pref("security.ssl3.rsa_des_ede3_sha", false);
user_pref("security.ssl.require_safe_negotiation", false);

/** EXPERIMENTS **/
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");

/** CRASH REPORTS **/
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);

/** POCKET **/
user_pref("extensions.pocket.enabled", false);

/** FULLSCREEN NOTICE **/
user_pref("full-screen-api.transition-duration.enter", "0 0");
user_pref("full-screen-api.transition-duration.leave", "0 0");
user_pref("full-screen-api.warning.delay", -1);
user_pref("full-screen-api.warning.timeout", 0);
user_pref("general.appversion.override", false);

/** USER AGENT SPOOFING **/
user_pref("general.appversion.override", false);

/** BROWSER TABS SIZE **/
user_pref("browser.tabs.tabMinWidth", 40);

/** BROWSER TOOLBAR SIZE **/
user_pref("browser.compactmode.show", true);

/** GEOLOCATION **/
user_pref("geo.enabled", false);

/** REFER HEAADER **/
user_pref("network.http.sendReferHeader", "0");

/** FISSION **/
user_pref("fission.autostart", true);

/** DISABLE LEFT AND RIGHT TOUCHPAD GESTURES **/
user_pref("browser.gesture.swipe.right", "");
user_pref("browser.gesture.swipe.left", "");

/** DISABLE ALT MENU **/
user_pref("ui.key.menuAccessKeyFocuses", false);
