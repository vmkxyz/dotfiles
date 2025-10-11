/*=====================================================================
by @vmkxyz on codeberg, github, discord

my custom user.js for firefox that enhances privacy and does some quality of life changes
inspired by arkenfox, betterfox, Luke Smith

is't split into 5 categorie:
	// 100: settings that you should leave as I've set them
		// 101: privacy/security settings
		// 102: performance settings        WARNING: might increse system resource usage
		// 103: JIT compilation				WARNING: might slow site loading down (few miliseconds)
	// 200: settings that are nice to have
	// 300: settings that you might not like
	// 400: additional arkenfox settings, commented out by default
	// 500: additional settings by Luke Smith. commented out by default

=====================================================================*/



// 100: settings that you probably should leave as set unless you know what you are doing
// 101: privacy/security settings

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

/** TRACKING PROTECTION **/
user_pref("browser.contentblocking.category", "strict");
user_pref("urlclassifier.trackingSkipURLs", "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com");
user_pref("urlclassifier.features.socialtracking.skipURLs", "*.instagram.com, *.twitter.com, *.twimg.com");
user_pref("privacy.globalprivacycontrol.enabled", true);

/** SSL / TLS **/
user_pref("security.ssl3.rsa_des_ede3_sha", false);
user_pref("security.ssl.require_safe_negotiation", true);
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
user_pref("security.tls.enable_0rtt_data", false);
user_pref("browser.xul.error_pages.expert_bad_cert", true);
user_pref("security.insecure_connection_text.enabled", true);
user_pref("security.insecure_connection_text.pbmode.enabled", true);

/** EXPERIMENTS **/
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

/** USER AGENT SPOOFING **/
user_pref("general.appversion.override", false);

/** GEOLOCATION **/
user_pref("geo.enabled", false);

/** REFERER HEADER **/
user_pref("network.http.sendReferHeader", "0");
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);

/** FISSION **/
user_pref("fission.autostart", true);

/** CRASH REPORTS **/
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);

/** OCSP & CERTS / HPKP **/
user_pref("security.remote_settings.crlite_filters.enabled", true);
user_pref("security.pki.crlite_mode", 2);

/** DISK AVOIDANCE **/
user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
user_pref("browser.sessionstore.interval", 60000);

/** SHUTDOWN & SANITIZING **/
user_pref("privacy.history.custom", true);

/** SEARCH / URL BAR **/
user_pref("browser.urlbar.trimHttps", true);
user_pref("browser.urlbar.untrimOnUserInteraction.featureGate", true);
user_pref("browser.search.separatePrivateDefault.ui.enabled", true);
user_pref("browser.urlbar.update2.engineAliasRefresh", true);
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.urlbar.quicksuggest.enabled", false);
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
user_pref("browser.urlbar.groupLabels.enabled", false);
user_pref("browser.formfill.enable", false);
user_pref("network.IDN_show_punycode", true);

/** HTTPS-FIRST POLICY **/
user_pref("dom.security.https_first", true);

/** PASSWORDS **/
user_pref("signon.formlessCapture.enabled", false);
user_pref("signon.privateBrowsingCapture.enabled", false);
user_pref("network.auth.subresource-http-auth-allow", 1);

/** MIXED CONTENT + CROSS-SITE **/
user_pref("security.mixed_content.block_display_content", true);
user_pref("pdfjs.enableScripting", false);

/** EXTENSIONS **/
user_pref("extensions.enabledScopes", 5);

/** CONTAINERS **/
user_pref("privacy.userContext.ui.enabled", true);

/** SAFE BROWSING **/
user_pref("browser.safebrowsing.downloads.remote.enabled", false);

/** MOZILLA **/
user_pref("permissions.default.desktop-notification", 2);
user_pref("permissions.default.geo", 2);
user_pref("permissions.manager.defaultsUrl", "");
user_pref("webchannel.allowObject.urlWhitelist", "");

/** CAPTIVE PORTAL DETECTION **/
user_pref("captivedetect.canonicalURL", "");
user_pref("network.captive-portal-service.enabled", false);

/** NETWORK CONNECTIVITY SERVICE **/
user_pref("network.connectivity-service.enabled", false);

/** OTHER **/
user_pref("editor.truncate_user_pastes", false);
user_pref("browser.download.start_downloads_in_tmp_dir", true);
user_pref("browser.helperApps.deleteTempFileOnExit", true);
user_pref("browser.uitour.enabled", false);



// 102: performance settings
// these are settings that make firefox faster in trade of higher system resource usage, if you don't like that, comment all of these out

/** GENERAL ***/
user_pref("content.notify.interval", 100000);

/** GFX ***/
user_pref("gfx.canvas.accelerated.cache-items", 4096);
user_pref("gfx.canvas.accelerated.cache-size", 512);
user_pref("gfx.content.skia-font-cache-size", 20);

/** DISK CACHE ***/
user_pref("browser.cache.jsbc_compression_level", 3);

/** MEDIA CACHE ***/
user_pref("media.memory_cache_max_size", 65536);
user_pref("media.cache_readahead_limit", 7200);
user_pref("media.cache_resume_threshold", 3600);

/** IMAGE CACHE ***/
user_pref("image.mem.decode_bytes_at_a_time", 32768);

/** NETWORK ***/
user_pref("network.http.max-connections", 1800);
user_pref("network.http.max-persistent-connections-per-server", 10);
user_pref("network.http.max-urgent-start-excessive-connections-per-host", 5);
user_pref("network.http.pacing.requests.enabled", false);
user_pref("network.dnsCacheExpiration", 3600);
user_pref("network.ssl_tokens_cache_capacity", 10240);

/** SPECULATIVE LOADING ***/
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);
user_pref("network.prefetch-next", false);
user_pref("network.predictor.enabled", false);
user_pref("network.predictor.enable-prefetch", false);

/** EXPERIMENTAL ***/
user_pref("dom.enable_web_task_scheduling", true);


// 103: JIT compilation
// these are settings that make site loading slower, this usually isn't noticeable (a few miliseconds), in exchange for higher security
// JIT compiles the site's code into machine code for faster execution

/** JavaScript JIT **/
user_pref("javascript.options.baselinejit", false);
user_pref("javascript.options.ion", false);
user_pref("javascript.options.jit_trustedprincipals", false);
/** WebAssembly JIT **/
user_pref("javascript.options.wasm", false);
user_pref("javascript.options.wasm_trustedprincipals", false);
user_pref("javascript.options.wasm_baselinejit", false);
user_pref("javascript.options.wasm_optimizingjit", false);
/** Asm.js JIT **/
user_pref("javascript.options.asmjs", false);
/** Blinterp (JIT-like) **/
user_pref("javascript.options.blinterp", false);



// 200: settings that are nice to have
/** settings you most likely want and/or there's no need to disable them **/

/** ABOUT:CONFIG WARNING **/
user_pref("browser.aboutConfig.showWarning", false);
/** USE CUSTOM CSS **/
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
/** DISABLE FAMILY MODE **/
user_pref("security.family_safety.mode", 0);
/** DISBLE AUTOFILL **/
user_pref("signon.autofillForms", false);
user_pref("signon.prefillForms", false);
/** "Trending on Google" ad in the url bar **/
user_pref("browser.urlbar.suggest.trending", false);
user_pref("browser.urlbar.trending.featureGate", false);



// 300: settings that you might not like
/** mostly cosmetic; my personal preferences you might not like; also maybe keep pocket disabled because muh it's proprietary **/

/** POCKET **/
user_pref("extensions.pocket.enabled", false);
/** FULLSCREEN NOTICE **/
user_pref("full-screen-api.transition-duration.enter", "0 0");
user_pref("full-screen-api.transition-duration.leave", "0 0");
user_pref("full-screen-api.warning.delay", -1);
user_pref("full-screen-api.warning.timeout", 0);
//user_pref("general.appversion.override", false);
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
/** BACKSPACE BACK **/
user_pref("browser.backspace_action", 0); // 0 is enabled



// 400: additional arkenfox settings, commented out by default
/** all of the following is some stuff from arkenfox user.js; uncomment for even higher privacy/security **/


//user_pref("browser.newtabpage.activity-stream.default.sites", "");
//user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
//user_pref("browser.discovery.enabled", false);
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
//user_pref("security.OCSP.require", true);
//user_pref("security.cert_pinning.enforcement_level", 2);
//user_pref("dom.security.https_only_mode_send_http_background_request", false);
//user_pref("privacy.userContext.enabled", true);
//user_pref("media.peerconnection.ice.proxy_only_if_behind_proxy", true);
//user_pref("media.peerconnection.ice.default_address_only", true);
//user_pref("dom.disable_window_move_resize", true);
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



// 500: additional settings by Luke Smith. commented out by default
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
