var resourceLoader;

App.onLaunch = function (options) {
    var javascriptFiles = [
        "${options.BASEURL}js/Presenter.js",
        "S{options.BASEURL}js/ResourceLoader.js"
    ];
    
    evaluateScripts(javascriptFiles, function(success) {
        console.log("in evaluation ${options.BASEURL}")
//        var rl = new ResourceLoader(options.BASEURL);
//        rl.loadResource()
    })
}
