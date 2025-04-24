extends Control

@onready var scroll = $ItemList.get_v_scroll_bar()
@onready var scroll1 = $Control/ItemList.get_v_scroll_bar()
@onready var scroll2 = $Control2/ItemList.get_v_scroll_bar()
@onready var scroll3 = $Control3/ItemList.get_v_scroll_bar()
@onready var scroll4 = $Control4/ItemList.get_v_scroll_bar()

@onready var list = [$Control, $Control2, $Control3, $Control4]
@onready var ranking = [$Control, $Control2, $Control3, $Control4]
var graphs = []

func _ready() -> void:
	
	scroll4.connect("changed", handle_scrollbar_changed)
	
	$Control/ColorRect.color = Color.GREEN
	$Control2/ColorRect.color = Color.RED
	$Control3/ColorRect.color = Color.BLUE
	$Control4/ColorRect.color = Color.VIOLET
	
	var graph1 = $Graph2D.add_plot_item("", Color.GREEN, 1.0)
	var graph2 = $Graph2D.add_plot_item("", Color.RED, 1.0)
	var graph3 = $Graph2D.add_plot_item("", Color.BLUE, 1.0)
	var graph4 = $Graph2D.add_plot_item("", Color.VIOLET, 1.5)
	
	graphs = [graph1, graph2, graph3, graph4]
	
	for g in graphs:
		g.add_point(Vector2(0, 0))

func format(n: int) -> String:
	var s = str(n)
	var result = ""
	var count = 0
	for i in range(s.length() - 1, -1, -1):
		result = s[i] + result
		count += 1
		if count % 3 == 0 and i != 0:
			result = "." + result
	return result

func handle_scrollbar_changed() -> void:
	scroll.value = scroll.max_value
	scroll1.value = scroll1.max_value
	scroll2.value = scroll2.max_value
	scroll3.value = scroll3.max_value
	scroll4.value = scroll4.max_value

func update_graph() -> void:
	var t = 0
	for c in list:
		if c.punkte > t:
			t = c.punkte
	$Graph2D.y_max = t
	$Graph2D.x_max = $ItemList.get_item_count() + 1

func update_ranking() -> void:
	if ranking[0].punkte < ranking[1].punkte:
		swap(0, 1)
	if ranking[2].punkte < ranking[3].punkte:
		swap(2, 3)
	if ranking[0].punkte < ranking[2].punkte:
		swap(0, 2)
	if ranking[1].punkte < ranking[3].punkte:
		swap(1, 3)
	if ranking[1].punkte < ranking[2].punkte:
		swap(1, 2)
	
	for i in 4:
		ranking[i].position.x = 100 + i * 200
		if i == 0: ranking[i].get_child(3).text = "[1.] -"
		else: ranking[i].get_child(3).text = "[" +str(i+1)+".] - " + format(ranking[i-1].punkte - ranking[i].punkte)

func swap(i: int, j: int) -> void:
	if i != j:
		var temp = ranking[i]
		ranking[i] = ranking[j]
		ranking[j] = temp


func _on_button_pressed() -> void:
	var spritz = int($TextEdit.text)

	var punkte = 10 * 2 ** spritz
	
	$ItemList.add_item(format(punkte))
	
	for c in list:
		if c.get_child(0).button_pressed:
			c.punkte += punkte
			c.get_child(1).add_item(format(c.punkte))
			c.get_child(0).set_pressed_no_signal(false)
		else:
			c.get_child(1).add_item("-")
	
	$TextEdit.clear()
	
	for i in 4:
		graphs[i].add_point(Vector2($ItemList.get_item_count(), list[i].punkte))
	update_graph()
	update_ranking()


func _on_button_2_pressed() -> void:
	var spritz = int($TextEdit.text)

	var punkte = 150 * 2 ** spritz
	
	$ItemList.add_item(format(punkte))
	
	for c in list:
		if c.get_child(0).button_pressed:
			c.punkte += punkte
			c.get_child(1).add_item(format(c.punkte))
			c.get_child(0).set_pressed_no_signal(false)
		else:
			c.get_child(1).add_item("-")
	
	$TextEdit.clear()
	
	for i in 4:
		graphs[i].add_point(Vector2($ItemList.get_item_count(), list[i].punkte))
	update_graph()
	update_ranking()

func _on_button_2_2_pressed() -> void:
	var spritz = int($TextEdit.text)

	var punkte = (150 * 2 ** spritz) / 3
	
	$ItemList.add_item(format(punkte))
	
	for c in list:
		if c.get_child(0).button_pressed:
			c.punkte += punkte
			c.get_child(1).add_item(format(c.punkte))
			c.get_child(0).set_pressed_no_signal(false)
		else:
			c.get_child(1).add_item("-")
	
	$TextEdit.clear()
	
	for i in 4:
		graphs[i].add_point(Vector2($ItemList.get_item_count(), list[i].punkte))
	update_graph()
	update_ranking()

func _on_button_3_pressed() -> void:
	var spritz = int($TextEdit.text)

	var punkte = 300 * 2 ** spritz
	
	$ItemList.add_item(format(punkte))
	
	for c in list:
		if c.get_child(0).button_pressed:
			c.punkte += punkte
			c.get_child(1).add_item(format(c.punkte))
			c.get_child(0).set_pressed_no_signal(false)
		else:
			c.get_child(1).add_item("-")
	
	$TextEdit.clear()
	
	for i in 4:
		graphs[i].add_point(Vector2($ItemList.get_item_count(), list[i].punkte))
	update_graph()
	update_ranking()

func _on_button_3_2_pressed() -> void:
	var spritz = int($TextEdit.text)

	var punkte = (300 * 2 ** spritz) / 3
	
	$ItemList.add_item(format(punkte))
	
	for c in list:
		if c.get_child(0).button_pressed:
			c.punkte += punkte
			c.get_child(1).add_item(format(c.punkte))
			c.get_child(0).set_pressed_no_signal(false)
		else:
			c.get_child(1).add_item("-")
	
	$TextEdit.clear()
	
	for i in 4:
		graphs[i].add_point(Vector2($ItemList.get_item_count(), list[i].punkte))
	update_graph()
	update_ranking()

func _on_button_4_pressed() -> void:
	if $ItemList.get_item_count() < 1:
		return
	
	for i in 4:
		graphs[i].remove_point(Vector2($ItemList.get_item_count(), list[i].punkte))
	
	for c in list:
		
		if c.get_child(1).get_item_text(c.get_child(1).get_item_count() - 1) != "-":
			c.punkte -= int($ItemList.get_item_text($ItemList.get_item_count() - 1).replace(".", ""))
		
		c.get_child(1).remove_item(c.get_child(1).get_item_count() - 1)
	
	$ItemList.remove_item($ItemList.get_item_count() - 1)
	update_graph()
	update_ranking()


func _on_button_5_pressed() -> void:
	var punkte = int($Panel/TextEdit.text)
	
	$ItemList.add_item(format(punkte))
	
	for c in list:
		if c.get_child(0).button_pressed:
			c.punkte += punkte
			c.get_child(1).add_item(format(c.punkte))
			c.get_child(0).set_pressed_no_signal(false)
		else:
			c.get_child(1).add_item("-")
	
	$Panel/TextEdit.clear()
	
	for i in 4:
		graphs[i].add_point(Vector2($ItemList.get_item_count(), list[i].punkte))
	update_graph()
	update_ranking()
