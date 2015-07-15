plugin.run = (contents, options) ->
	"""
#{contents}
for layerGroupName of v
  window[layerGroupName] = v[layerGroupName]

for layerGroupName of v
  v[layerGroupName].originalFrame = window[layerGroupName].frame


p = print
"""