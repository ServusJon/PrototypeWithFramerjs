plugin.run = (contents, options) ->
	"""
#{contents}
# Check for Orientation and set Width and Height of Document
orientation = Framer.Device.orientation

if orientation isnt 0
	screenWidth = Framer.Device.screen.height
	screenHeight = Framer.Device.screen.width
else
	screenWidth = Framer.Device.screen.width
	screenHeight = Framer.Device.screen.height

	"""