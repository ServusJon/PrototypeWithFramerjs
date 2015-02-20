# Prototype With Framer.js
Kickstart your prototyping process with Framer.js

## Basics aka "Nobrainer"
In every prototype I build with Framer.js in Framer Studio (Get it now: http://studio.update.framerjs.com/archive/) I tend to use the same code to write more efficient code. 

First, I delete all the example code.
Then I import my Sketch or Photoshop file. Accessing a layer (folder in Sketch / Photoshop) would be a pain now. That's why I rename "sketchFileLayers" into "v".

```coffeescript
# Renamed Default Import Sketch File
v = Framer.Importer.load "imported/sketchFile"
```

After that I paste in this code.
### Must-Have
```coffeescript
for layerGroupName of v
  window[layerGroupName] = v[layerGroupName]
# Makes layers easy accessible 
# Instead of: jakeluLayers.Conversation.opacity = 0
# Write this: Conversation.opacity = 0


for layerGroupName of v
  v[layerGroupName].originalFrame = window[layerGroupName].frame
# Storing position of layers for later usage
# Usage:
# layerName.y = 90
#
# layerName.animate
#   properties:
#     y: layerName.originalFrame.y
```

## Useful variables
Having the size of your screensize stored in variables is a huge timesaver.

### Screensize
```coffeescript
screenWidth = Framer.Device.screen.width
screenHeight = Framer.Device.screen.height

# Usage:
# layerName.width = screenWidth 
# layerName.y = screenheight - 100
```

### Animation
I normally define an spring animation early on to use it on multiple layer easily.
```coffeescript
spring = "spring(400,35,0)"

# Usage:
# layer.animate
#   properties:
#     y: 300
#   curve: spring
```

# Useful Beginners Notes:
No “ä”,  “ö”, “ü”, etc. in folder names. Screws up the import.
Also no Numbers at the beginning of the folder names is troublesome. Avoiding dashes in folder names also important. I use underscores.

# Functions
In order to have the switch between two screens always easy at hand I have this little function ready.
```coffeescript
screenSwitch = (current,next) ->
	next.animate
		properties:
			x: 0
		curve: "ease-out"
		time: 0.15
	animationHideScreen = new Animation
		layer: current
		properties:
			opacity: 0
		time: 0.4
		curve:"ease-in"
	animationOrigin = new Animation
		layer: current
		properties:
			x: screenWidth
			opacity: 1
		time:0.0
	animationHideScreen.on(Events.AnimationEnd,animationOrigin.start)
	animationHideScreen.start()

#example
PS.btn_register.on Events.Click, ->
	screenSwitch(PS.register_01,PS.register_02)
```