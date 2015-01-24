# Prototype With Framerjs
Kickstart your prototyping process with Framer.js

## Basics aka "Nobrainer"
In every prototype I build with Framer.js in Framer Studio (Get it now: http://framerjs.com/) I tend to use the same code to write more efficient code. 

First, I delete all the example code.
Then I import my Sketch or Photoshop file. Accessing a layer (folder in Sketch / Photoshop) would be a pain now. That's why I rename "sketchFileLayers" into "v".

```coffeescript
# Renamed Default Import Sketch File
v = Framer.Importer.load "imported/sketchFile"
```

After that I paste in this code.
### Must haves
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

## Useful Variables
Having the size of your screensize stored in variables is a huge timesaver.

### Screen size
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
#layer.animate
#      properties:
#        y: 300
#      curve: spring
```