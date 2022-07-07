sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/empmaster/test/integration/pages/MainListReport' ,
        'com/empmaster/test/integration/pages/MainObjectPage',
        'com/empmaster/test/integration/OpaJourney'
    ],
    function(JourneyRunner, MainListReport, MainObjectPage, Journey) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/empmaster') + '/index.html'
        });

        JourneyRunner.run(
            {
                pages: { onTheMainPage: MainListReport, onTheDetailPage: MainObjectPage }
            },
            Journey.run
        );
    }
);