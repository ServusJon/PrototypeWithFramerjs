plugin.run = (contents, options) ->
	"""
#{contents}
spring = "spring(400,32,0)"
slideAnimation = "spring(400,36,0)"
modalAnimation = "spring(800,60,0)"

Framer.Defaults.Animation = {
    curve: slideAnimation
}
	"""