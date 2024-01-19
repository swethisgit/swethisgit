//# sourceURL=application.js

//
//  application.js
//  EPGComponent
//
//  Created by Sweda Thiyagarajan on 18/06/2022.
//

/*
 * This file provides an example skeletal stub for the server-side implementation 
 * of a TVML application.
 *
 * A javascript file such as this should be provided at the tvBootURL that is 
 * configured in the AppDelegate of the TVML application. Note that  the various 
 * javascript functions here are referenced by name in the AppDelegate. This skeletal 
 * implementation shows the basic entry points that you will want to handle 
 * application lifecycle events.
 */

/**
 * @description The onLaunch callback is invoked after the application JavaScript 
 * has been parsed into a JavaScript context. The handler is passed an object 
 * that contains options passed in for launch. These options are defined in the
 * swift or objective-c client code. Options can be used to communicate to
 * your JavaScript code that data and as well as state information, like if the 
 * the app is being launched in the background.
 *
 * The location attribute is automatically added to the object and represents 
 * the URL that was used to retrieve the application JavaScript.
 */
const templaeDocument = function (options) {
    return `<document>
          <stackTemplate id="bannr-76324" style="background-color:rgb(0,0,0);tv-scrollable-bounds-inset-top:100.0;">
            <card style="height:840;width:1920;margin:0 0 40;padding:0;">
              <background>
                <img src="https://u7a8b7b2.stackpathcdn.com/videos/4634/07-03-2022/1054_2Fcatalog_image_2F312392_2Fe0teXeOv__A7E9CQ0P1024x576.jpg" aspectFill="true" style="width:1920;height:840;border-radius:0;margin:0;"/>
              </background>
              <img src="http://www.ventunotech.com/plugins/ott-tvos-v3/worker/frmwrk/assets/grad-dark-1920x700.png?3" aspectFill="true" width="1920" height="840" style="tv-position:top-right;border-radius:0;"/>
              <overlay style="tv-position:left;padding:0;margin-left:100;width:1820">
                <text style="text-align:left;margin-bottom:15;tv-text-max-lines:1;tv-text-style:none;font-size:45;font-weight:normal;color:rgba(255,255,255);">kweliLIVE</text>
                <text style="width:1152;text-align:left;margin:0 0 15;tv-text-max-lines:4;font-size:22;font-weight:normal;color:rgba(178,178,178);">kweliTV's 24-hour live channel streams a limited selection of our critically-acclaimed independent films, documentaries, shows and kids programming. This is a free, ad-supported channel.

        Compatible on all devices — kweliTV's tv apps (Roku, Apple TV, Android TV and Amazon Firestick); mobile apps (iOS and GoolePlay for Android); as well as desktop and mobile web browsers (Chrome, Safari and Firefox). Must have at least 25 MBPS of internet speed.</text>
                <row style="tv-align:left;margin-top:35;tv-interitem-spacing:25;">
                  <button type="play" vkey="dnRud6ca1f99733162510e020cd6158505988fb782d0229e0be9a2e4201ec191388ad839cdc00da93ab961c13aa6b0dc38fe=" style=";min-width:20;height:50;padding:0 28;background-color:rgba(43,43,43);tv-highlight-color:rgba(220,120,50);">
                    <title style="tv-text-style:none;font-size:26;font-weight:bold;text-transform:uppercase;color:rgba(255,255,255);;tv-highlight-color:rgba(255,255,255);;">PLAY</title>
                  </button>
                  <button type="info" style="min-width:20;height:50;padding:0 28;background-color:rgba(43,43,43);tv-highlight-color:rgba(220,120,50);">
                    <title style="tv-text-style:none;font-size:26;font-weight:bold;text-transform:uppercase;color:rgba(255,255,255);;tv-highlight-color:rgba(255,255,255);;">MORE INFO</title>
                  </button>
                </row>
              </overlay>
            </card>
            <EPG/>
          </stackTemplate>
        </document>`
}

App.onLaunch = function(options) {
    var template = templaeDocument(options);
    var templateParser = new DOMParser();
    var parsedTemplate = templateParser.parseFromString(template, "application/xml");
//    var alert = createAlert("Hello World!", "Welcome to tvOS");
    navigationDocument.pushDocument(parsedTemplate);
}


App.onWillResignActive = function() {

}

App.onDidEnterBackground = function() {

}

App.onWillEnterForeground = function() {
    
}

App.onDidBecomeActive = function() {
    
}


/**
 * This convenience function returns an alert template, which can be used to present errors to the user.
 */
var createAlert = function(title, description) {

    var alertString = `<?xml version="1.0" encoding="UTF-8" ?>
        <document>
          <alertTemplate>
            <title>${title}</title>
            <description>${description}</description>
          </alertTemplate>
        </document>`

    var parser = new DOMParser();

    var alertDoc = parser.parseFromString(alertString, "application/xml");

    return alertDoc
}
