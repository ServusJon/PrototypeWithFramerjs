# Prototype With Framerjs
Kickstart your prototyping process with Framer.js

## Basics aka "Nobrainer"
In every prototype I build with Framer.js in Framer Studio (Get it now: http://framerjs.com/) I tend to use the same code to write more efficient code. 

First, I delete all the example code.
Then I import my Sketch or Photoshop file. Accessing a layer (folder in Sketch / Photoshop) would be a pain now. That's why I rename "sketchFileLayers" into "v".

```coffeescript
# Default Import Sketch File
sketchFileLayers = Framer.Importer.load "imported/sketchFile"

# Renamed Default Import Sketch File
v = Framer.Importer.load "imported/sketchFile"
```

After that I paste in this code.

```coffeescript
# Make layers easy accessible 
# Instead of: jakeluLayers.Conversation.opacity = 0
# Right this: Conversation.opacity = 0

for layerGroupName of v
  window[layerGroupName] = v[layerGroupName]



# Store position of layers for later usage
# You can animate a layer to a certain Y-position. After this just write: layerName.originalFrame.x

for layerGroupName of v
  v[layerGroupName].originalFrame = window[layerGroupName].frame
```
