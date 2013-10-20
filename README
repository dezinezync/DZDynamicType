DZDynamicType
===========================================

Titanium module to fetch Text Sizes as set by your Users as a perferrence. This is a great module if you care about your user's accessibility requirements.

INSTALL THE MODULE
--------------------

1. Run `build.py` which creates your distribution
2. cd to `/Library/Application Support/Titanium`
3. copy this zip file into the folder of your Titanium SDK

REGISTER THE MODULE
---------------------

Register your module with your application by editing `tiapp.xml` and adding your module.
Example:

<modules>
	<module version="1.0">com.dezinezync.dynamictype</module>
</modules>


USING THE MODULE IN CODE
-------------------------

Check the app in the example folder.

The module exposes one convinice method and one event

#### Method
~~~~
DZDynamicType.preferredSize() //use-case: when drawing the view for the first time
~~~~


#### Event
~~~~
DZDynamicType.addEventListener("textSize", function(e) {
	var newTextSize = e.size;
});
~~~~

The event is fired each time the user changes the preferred font size, and returns to your app. No other configurations are required.

LICENSE
-------------------------
Please refer to the LICENSE file included in this repo.
