//# sourceURL=application.js

//
//  application.js
//  CustomLblNativeTxt
//
//  Created by Sweda Thiyagarajan on 18/05/2022.
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
const mixedTemplate = function (options) {
    return `
        <document>
            <stackTemplate style="background-color:rgb(0,0,0);">
                <banner id="bannr-29200" style="margin:0 0 50 0;padding:0">
                    <background style="background-color:transparent">
                        <GradientImage aspectFill="true" width="1920" height="576" country-name="Ukraine" src="https://v2s3z9v2.stackpathcdn.com/videos/4634/08-02-2022/th_37288678377_1920x1080__HJ9KMSPA__J1TC98QB1024x576.jpg" />
                    </background>
                    <stack style="margin-top:220;margin-left:200;height:340;width:1056;">
                        <copyright/>
                        <text style="text-align:left;margin-bottom:15;tv-text-max-lines:1;tv-text-style:none;font-size:25;font-weight:normal;color:rgba(178,178,178);">Ukraine</text>
                        <text style="text-align:left;margin-bottom:15;tv-text-max-lines:1;tv-text-style:none;font-size:45;font-weight:normal;color:rgba(255,255,255);">GREEN DAYS BY THE RIVER</text>
                        <row style="tv-align:left;margin-bottom:15;">
                            <text style="text-align:left;tv-text-style:none;font-size:25;font-weight:normal;color:rgba(178,178,178);">1 hr 42 mins</text>
                            <text style="text-align:left;tv-text-style:none;font-size:25;font-weight:normal;color:rgba(178,178,178);"> • English</text>
                        </row>
                        <description more="false" allowsZooming="true" style="text-align:left;margin:0 0 15;tv-text-max-lines:4;font-size:22;font-weight:normal;color:rgba(178,178,178);">A Caribbean coming-of-age classic in the tradition of SUGAR CANE ALLEY, Michael Mooleedhar's first feature is adapted from Michael Anthony's acclaimed 1967 novel. Set in 1952, the story centers on the 15-year-old boy Shellie (Tafari), whose poor but closely knit family has recently relocated to a village in the Mayaro region of Trinidad. With his father seriously ill, Shellie acquires a surrogate father-figure in the wealthy plantation-owner Mr. Gidharee (Lawkaran), and he finds himself torn between Gidharee's seductive half-Indian daughter Rosalie (Kandhai) and the more down-to-earth charms of out-of-town girl Joan (Bartholomew). But does Shellie really have a choice, or has a trap been laid for him from the very beginning? GREEN DAYS BY THE RIVER is a rich sensory experience, featuring a lush sense of place, a superb music-laced soundtrack, and vividly colored, beautifully composed cinematography.</description>
                        <row style="tv-align:left;">
                            <button type="link" linkURL="http://ec2-54-148-131-127.us-west-2.compute.amazonaws.com/watch/animation/green-days-by-the-river-final" url_params="%7B%22expert_id%22:%22%22%7D" style=";min-width:20;height:50;padding:0 28;background-color:rgba(43,43,43);tv-highlight-color:rgba(220,120,50);">
                                <title style="tv-text-style:none;font-size:26;font-weight:bold;text-transform:uppercase;color:rgba(255,255,255);;tv-highlight-color:rgba(255,255,255);;">MORE INFO</title>
                            </button>
                        </row>
                    </stack>

                </banner>
            </stackTemplate>
        </document>`
}

App.onLaunch = function(options) {
    var template = mixedTemplate(options);
    var parser = new DOMParser();
    var templateMix = parser.parseFromString(template, "application/xml");
    navigationDocument.pushDocument(templateMix);
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
