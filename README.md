# Prototype With Framerjs
Kickstart your prototyping process with Framer.js

## Basics aka "Nobrainer"
In every prototype I build with Framer.js in Framer Studio (Get it now: http://framerjs.com/) I tend to use the same code to write more efficient code. 

First, I delete all the example code.
Then I import my Sketch or Photoshop file. My document looks now like this:

```coffeescript
# Import Sketch File
sketchFileLayers = Framer.Importer.load "imported/sketchFile"
```

Accessing a layer (folder in Sketch / Photoshop) would be a pain. That's why I rename "sketchFileLayers" into "v".
Then I paste in this code:

```coffeescript
for layerGroupName of v
  window[layerGroupName] = v[layerGroupName]

for layerGroupName of v
  v[layerGroupName].originalFrame = window[layerGroupName].frame
```

With this code I make all the imported layers easily accessible. 
**Before:**
```coffeescript
jakeluLayers.Conversation.opacity = 0
```

**After:**
```coffeescript
Conversation.opacity = 0
```


