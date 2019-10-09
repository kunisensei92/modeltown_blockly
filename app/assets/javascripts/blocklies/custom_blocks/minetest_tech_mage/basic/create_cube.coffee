Blockly.Blocks["create_cube"] =
  init: ->
    @appendValueInput("material")
      .setCheck("String")
      .appendField("place cube")
    @appendDummyInput()
      .appendField("width X: ")
      .appendField(new Blockly.FieldNumber('0'), 'x1')
    @appendDummyInput()
      .appendField("height Y: ")
      .appendField(new Blockly.FieldNumber('0'), 'y1')
    @appendDummyInput()
      .appendField("length Z: ")
      .appendField(new Blockly.FieldNumber('0'), 'z1')
    @setInputsInline(false)
    @setPreviousStatement(true, "null")
    @setNextStatement(true, "null")
    @setColour(45)
    @setTooltip("Create a block of a given material, at coordinates x, y, z")


Blockly.JavaScript["create_cube"] = (block) ->
  playername = document.getElementById("username").value;
  material = Blockly.JavaScript.valueToCode(
    block, "material", Blockly.JavaScript.ORDER_ATOMIC).slice(1,-1) || "air"
  x1 = 0
  y1 = 0
  z1 = 0
  x2 = block.getFieldValue('x1')
  y2 = block.getFieldValue('y1')
  z2 = block.getFieldValue('z1')
  code = "createcube(#{material}, '#{playername}', #{x1}, #{y1}, #{z1}, #{x2}, #{y2}, #{z2});\n"
  return code


for language in [
  "JavaScript"
  "Ruby"
]
  apply(language)
