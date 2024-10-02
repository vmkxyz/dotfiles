/*=====================================================================
                   __
     _  __ __ _   / /__
    | |/ //  ' \ /  '_/
by  |___//_/_/_//_/\_\
@vmkxyz on gitlab and github

my custom user.js for firefox that enhances privacy and does some quality of life changes

is't split into 5 categorie:
	// 001: settings that you should leave as I've set them
	// 002: settings that are nice to have
	// 003: settings that you might not like
	// 004: additional arkenfox settings, commented out by default
	// 005: additional settings by Luke Smith. commented out by default

=====================================================================*/



// 001: settings that you should leave as I've set them

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
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
/** HARDENS THE SSL PREFERENCE **/
user_pref("security.ssl3.rsa_des_ede3_sha", false);
user_pref("security.ssl.require_safe_negotiation", true);
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
/** EXPERIMENTS **/
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");
/** USER AGENT SPOOFING **/
user_pref("general.appversion.override", false);
/** GEOLOCATION **/
user_pref("geo.enabled", false);
/** REFER HEAADER **/
user_pref("network.http.sendReferHeader", "0");
/** FISSION **/
user_pref("fission.autostart", true);
/** CRASH REPORTS **/
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);



// 002: settings that are nice to have
/** you can disable these but there's really no need to + you probably want these anyways **/

/** ABOUT:CONFIG WARNING **/
user_pref("browser.aboutConfig.showWarning", false);
/** USE CUSTOM CSS **/
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
/** DISABLE FAMILY MODE **/
user_pref("security.family_safety.mode", 0);
/** DISBLE AUTOFILL **/
user_pref("browser.formfill.enable", false);
user_pref("signon.autofillForms", false);
user_pref("signon.prefillForms", false);



// 003: settings that you might not like
/** these are just my personal preferences, maybe you'll like them; also maybe keep pocket disabled because its proprietary **/

/** POCKET **/
user_pref("extensions.pocket.enabled", false);
/** FULLSCREEN NOTICE **/
user_pref("full-screen-api.transition-duration.enter", "0 0");
user_pref("full-screen-api.transition-duration.leave", "0 0");
user_pref("full-screen-api.warning.delay", -1);
user_pref("full-screen-api.warning.timeout", 0);
user_pref("general.appversion.override", false);
/** BROWSER TABS SIZE **/
user_pref("browser.tabs.tabMinWidth", 40);
/** BROWSER TOOLBAR SIZE **/
user_pref("browser.compactmode.show", true);
/** DISABLE LEFT AND RIGHT TOUCHPAD GESTURES **/
user_pref("browser.gesture.swipe.right", "");
user_pref("browser.gesture.swipe.left", "");
/** DISABLE ALT MENU **/
user_pref("ui.key.menuAccessKeyFocuses", false);
/** TAB HOVER PREVIEWS **/
user_pref("browser.tabs.hoverPreview.enabled", false);
user_pref("browser.tabs.hoverPreview.showThumbnails", false);



// 004: additional arkenfox settings, commented out by default
/** all of the following is some stuff from arkenfox user.js **/


//user_pref("browser.newtabpage.activity-stream.default.sites", "");
//user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
//user_pref("browser.discovery.enabled", false);
//user_pref("captivedetect.canonicalURL", "");
//user_pref("network.connectivity-service.enabled", false);
//user_pref("browser.safebrowsing.downloads.remote.enabled", false);
//user_pref("network.prefetch-next", false);
//user_pref("network.dns.disablePrefetch", true);
//user_pref("network.predictor.enabled", false);
//user_pref("network.http.speculative-parallel-limit", 0);
//user_pref("browser.places.speculativeConnect.enabled", false);
//user_pref("network.proxy.socks_remote_dns", true);
//user_pref("browser.urlbar.speculativeConnect.enabled", false);
//user_pref("browser.search.suggest.enabled", false);
//user_pref("browser.urlbar.suggest.searches", false);
//user_pref("browser.urlbar.trending.featureGate", false);
//user_pref("signon.formlessCapture.enabled", false);
//user_pref("network.auth.subresource-http-auth-allow", 1);
//user_pref("browser.cache.disk.enable", false);
//user_pref("media.memory_cache_max_size", 65536);
//user_pref("browser.sessionstore.privacy_level", 2);
//user_pref("toolkit.winRegisterApplicationRestart", false);
//user_pref("browser.shell.shortcutFavicons", false);
//user_pref("security.tls.enable_0rtt_data", false);
//user_pref("security.OCSP.require", true);
//user_pref("security.cert_pinning.enforcement_level", 2);
//user_pref("security.remote_settings.crlite_filters.enabled", true);
//user_pref("security.pki.crlite_mode", 2);
//user_pref("dom.security.https_only_mode_send_http_background_request", false);
//user_pref("browser.xul.error_pages.expert_bad_cert", true);
//user_pref("network.http.referer.XOriginTrimmingPolicy", 2);
//user_pref("privacy.userContext.enabled", true);
//user_pref("privacy.userContext.ui.enabled", true);
//user_pref("media.peerconnection.ice.proxy_only_if_behind_proxy", true);
//user_pref("media.peerconnection.ice.default_address_only", true);
//user_pref("dom.disable_window_move_resize", true);
//user_pref("browser.helperApps.deleteTempFileOnExit", true);
//user_pref("browser.uitour.enabled", false);
//user_pref("permissions.manager.defaultsUrl", "");
//user_pref("webchannel.allowObject.urlWhitelist", "");
//user_pref("network.IDN_show_punycode", true);
//user_pref("browser.download.useDownloadDir", false);
//user_pref("browser.download.alwaysOpenPanel", false);
//user_pref("browser.download.manager.addToRecentDocs", false);
//user_pref("browser.download.always_ask_before_handling_new_types", true);
//user_pref("extensions.postDownloadThirdPartyPrompt", false);
//user_pref("privacy.sanitize.sanitizeOnShutdown", true);
//user_pref("privacy.cpd.cookies", false);
//user_pref("privacy.sanitize.timeSpan", 0);
//user_pref("privacy.window.maxInnerWidth", 1600);
//user_pref("privacy.window.maxInnerHeight", 900);
//user_pref("privacy.resistFingerprinting.block_mozAddonManager", true);
//user_pref("browser.link.open_newwindow.restriction", 0);
//user_pref("webgl.disabled", true);
//user_pref("browser.messaging-system.whatsNewPanel.enabled", false);
//user_pref("browser.urlbar.showSearchTerms.enabled", false);
//user_pref("network.dns.skipTRR-when-parental-control-enabled", false);



// 005: additional settings by Luke Smith. commented out by default

/** all of the following are Luke Smith's additions & changes to arkenfox **/

// Disable the Twitter/R*ddit/Faceberg ads in the URL bar:
//user_pref("browser.urlbar.quicksuggest.enabled", false);
//user_pref("browser.urlbar.suggest.topsites", false); // [FF78+]
// Do not suggest web history in the URL bar:
//user_pref("browser.urlbar.suggest.history", false);
// Do not autocomplete in the URL bar:
//user_pref("browser.urlbar.autoFill", false);
// Enable the addition of search keywords:
//user_pref("keyword.enabled", true);
// Allow access to http (i.e. not https) sites:
//user_pref("dom.security.https_only_mode", false);
// Keep cookies until expiration or user deletion:
//user_pref("network.cookie.lifetimePolicy", 0);
//user_pref("dom.webnotifications.serviceworker.enabled", false);
// Disable push notifications:
//user_pref("dom.push.enabled", false);
// Don't autodelete cookies on shutdown:
//user_pref("privacy.clearOnShutdown.cookies", false);
// This could otherwise cause some issues on bank logins and other annoying sites:
//user_pref("network.http.referer.XOriginPolicy", 0);
// Disable Firefox sync and its menu entries
//user_pref("identity.fxaccounts.enabled", false);
// Fix the issue where right mouse button instantly clicks
//user_pref("ui.context_menus.after_mouseup", true);
