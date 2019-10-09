Blockly.Blocks["minetest_add_node_onplayer"] =
  init: ->
    @appendValueInput("material")
      .setCheck("String")
      .appendField("place")
    @appendValueInput("x")
      .setCheck("Number")
      .appendField("your: ~X")
    @appendValueInput("y")
      .setCheck("Number")
      .appendField("~Y")
    @appendValueInput("z")
      .setCheck("Number")
      .appendField("~Z")
    @appendDummyInput()
      .appendField('move player')
      .appendField(new Blockly.FieldCheckbox('FALSE'), 'ONPLAYER');
    @setInputsInline(true)
    @setPreviousStatement(true, "null")
    @setNextStatement(true, "null")
    @setColour(60)
    @setTooltip("Create a block of a given material, at coordinates x, y, z")


Blockly.JavaScript["minetest_add_node_onplayer"] = (block) ->
  playername = document.getElementById("username").value;
  material = Blockly.JavaScript.valueToCode(
    block, "material", Blockly.JavaScript.ORDER_ATOMIC) || "air"
  x = Blockly.JavaScript.valueToCode(
    block, "x", Blockly.JavaScript.ORDER_ATOMIC) || 0
  y = Blockly.JavaScript.valueToCode(
    block, "y", Blockly.JavaScript.ORDER_ATOMIC) || 0
  z = Blockly.JavaScript.valueToCode(
    block, "z", Blockly.JavaScript.ORDER_ATOMIC) || 0
  moveplayer = block.getFieldValue('ONPLAYER')
  code = "placeonplayer(#{material}, '#{playername}', #{x}, #{y}, #{z}, '#{moveplayer}');\n"
  return code

for language in [
  "JavaScript"
  "Ruby"
]
  apply(language)
