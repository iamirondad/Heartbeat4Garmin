using Toybox.WatchUi;

class HeartbeatDataFieldView extends WatchUi.SimpleDataField {

    function initialize() {
        SimpleDataField.initialize();
        label = "Heartbeats";
    }

    // Note that compute() and onUpdate() are asynchronous, and there is no
    // guarantee that compute() will be called before onUpdate().
    function compute(info) {
		var numBeats = 0.0;
		
        // averageHeartRate is in beats per minute, regardless of what the docs say
        if(info != null && info.elapsedTime != null && info.averageHeartRate != null) {
        	numBeats = info.timerTime / 1000.0 / 60.0 * info.averageHeartRate;
        }
        
        return Math.floor(numBeats).format("%u");
    }
}