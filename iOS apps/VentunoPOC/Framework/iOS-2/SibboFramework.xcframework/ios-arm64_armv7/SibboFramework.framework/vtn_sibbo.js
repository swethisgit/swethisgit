const initConfig = function (emphasisColor, backgroundColor, domain, consentServerURL, tv, tcString, thirdString, forceOpen) {

    const configuration = {
        // In App properties
        inApp: true,
        tv: false,
        inAppForceOpen: forceOpen,
        inAppTCString: tcString,
        inAppOtherVendors: thirdString,

        // Common properties
        domain: 'meel.ios',
        cmpType: 1,
        geo: 'eu',
        cmpId: '76',
        daysToExpire: 60,
        idSite: '',
        apiURL: consentServerURL + '/v2/consent',
        statisticsCount: true,
        apiCountURL: 'https://count.sibbo.net/',

        // Look and feel
        fontFace: 'default',
        emphasisColor: "#f7b501",
        backgroundColor: "#353434",
        overlayColor: "#1e1a1c",
        backgroundTransparency: 1,
        bannerPosition: "down",
        sibboLabel: 'logo',
        sibboLabelPosition: 'first',
        openLink: false,

        // Texts
        publisherName: 'WETEK',
        language: "PT",
        buttonAcceptText: "",
        buttonConfigureText: "",
        mainText: "<h2>Em <strong>Wetek, SA</strong>, estamos preocupados com sua privacidade</h2><p>NÃ³s e nossos parceiros usamos cookies e identificadores para armazenar e acessar informaÃ§Ãµes em seu dispositivo e coletar dados pessoais sobre o pÃºblico, desenvolver e melhorar produtos, bem como servir e medir anÃºncios personalizados e / ou conteÃºdo com base em sua navegaÃ§Ã£o (por exemplo, pÃ¡ginas visitadas). Com sua permissÃ£o, podemos usar dados para localizaÃ§Ã£o geogrÃ¡fica precisa e identificaÃ§Ã£o por meio de recursos do dispositivo.</p><p>Algumas empresas exigem seu consentimento e outras baseiam-se em interesses legÃ­timos, mas vocÃª pode decidir se tem objeÃ§Ãµes a tal tratamento.</p> <p>VocÃª pode aceitar ou rejeitar / configurar o uso de cookies para este site ou aplicativo no botÃ£o correspondente. VocÃª pode modificar sua escolha em ConfiguraÃ§Ãµes de Privacidade / Cookies. Mais informaÃ§Ãµes <a href='https://www.meel.tv/news/detail/609d0c20ebdf75001846e937/Politica-de-Privacidade-e-Cookies'>PolÃ­tica de cookies.</a></p>",
        purposes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        publisherConsents: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        otherVendors: [
            {
                id: 'google',
                name: 'Tecnologias associadas ao Google',
                urls: [
                {
                    href: 'https://policies.google.com/privacy',
                    text: 'PolÃ­tica de privacidade'
                },
                {
                    href: 'https://support.google.com/admanager/answer/9012903?hl=es',
                    text: 'Lista de fornecedores de tecnologia de anÃºncio'
                }
                ],
                cookieName: 'googleConsent'
            }
        ]
    };

    return configuration;
    
}
