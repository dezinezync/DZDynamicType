var DZDynamicType = require('com.dezinezync.dynamictype');
Ti.API.info("module is => " + DZDynamicType);

// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel({
	width: Ti.UI.SIZE,
	height: Ti.UI.SIZE,
	text: DZDynamicType.example(),
	font: {
		fontFamily: "Avenir-Roman",
		fontSize: DZDynamicType.preferredSize() //Convinience method to get Preferred Size when first launching the app or creating the view
	}
});

win.add(label);
win.open();

//This event notifies you whenever the user changes their preferrence.
DZDynamicType.addEventListener("textSize", function(e) {

	Ti.API.debug("Text Size Preferrence changed by user");
	var size = e.size;

	label.applyProperties({
		width: Ti.UI.SIZE,
		height: Ti.UI.SIZE,
		font: {
			fontFamily: "Avenir-Roman",
			fontSize: size
		}
	});

});