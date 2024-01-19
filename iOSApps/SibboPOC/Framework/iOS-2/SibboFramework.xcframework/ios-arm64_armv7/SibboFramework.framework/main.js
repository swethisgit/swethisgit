window['init'] = (domain, consentStringPostURL, backgroundColor, emphasisColor, tcString, thirdString, forceOpen) => {
    const configuration = initConfig(domain, consentStringPostURL, backgroundColor, emphasisColor, tcString, thirdString, forceOpen);
    
    SibboCMP.init(configuration);
    
    window.postMessage({__tcfapiCall: {command: 'addEventListener', callId: 1, version: 2}}, 'file:///')

    window.addEventListener('message', function(e) {
            window.webkit.messageHandlers.doSomethingHandler.postMessage(e.data);
    })

    window.addEventListener('closeCMP', function(e) {
            window.webkit.messageHandlers.doSomethingHandler.postMessage({'action': 'close'})
    })
}

window['getInAppTCData'] = () => {
    window.postMessage({__tcfapiCall: {command: 'getInAppTCData', callId: 2, version: 2}}, 'file:///')
}

window['getInAppThirdData'] = () => {
  window.postMessage({__tcfapiCall: {command: 'getOtherVendorConsents', callId: 3, version: 2}}, 'file:///')
}

window['getDeviceID'] = () => {
  window.postMessage({__tcfapiCall: {command: 'getDeviceID', callId: 4, version: 2}}, 'file:///')
}
