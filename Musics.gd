extends Node2D

var area1 = false
var area2 = false
var area3 = false
var area4 = false
var area5 = false
var area6 = false
var area7 = false

func _on_Area1_body_entered(body):
	if body == Global.Player and area1 == false:
		$Insertion.play()
		$Power_Armor.stop()
		$Office.stop()
		$Dock_Combat.stop()
		$Garage_Battle.stop()
		$Hospital.stop()
		$Zombies.stop()
		area1 = true
		area2 = false
		area3 = false
		area4 = false
		area5 = false
		area6 = false
		area7 = false


func _on_Area2_body_entered(body):
	if body == Global.Player and area2 == false:
		$Insertion.stop()
		$Power_Armor.play()
		$Office.stop()
		$Dock_Combat.stop()
		$Garage_Battle.stop()
		$Hospital.stop()
		$Zombies.stop()
		area1 = false
		area2 = true
		area3 = false
		area4 = false
		area5 = false
		area6 = false
		area7 = false


func _on_Area3_body_entered(body):
	if body == Global.Player and area3 == false:
		$Insertion.stop()
		$Power_Armor.stop()
		$Office.play()
		$Dock_Combat.stop()
		$Garage_Battle.stop()
		$Hospital.stop()
		$Zombies.stop()
		area1 = false
		area2 = false
		area3 = true
		area4 = false
		area5 = false
		area6 = false
		area7 = false


func _on_Area4_body_entered(body):
	if body == Global.Player and area4 == false:
		$Insertion.stop()
		$Power_Armor.stop()
		$Office.stop()
		$Dock_Combat.play()
		$Garage_Battle.stop()
		$Hospital.stop()
		$Zombies.stop()
		area1 = false
		area2 = false
		area3 = false
		area4 = true
		area5 = false
		area6 = false
		area7 = false


func _on_Area5_body_entered(body):
	if body == Global.Player and area5 == false:
		$Insertion.stop()
		$Power_Armor.stop()
		$Office.stop()
		$Dock_Combat.stop()
		$Garage_Battle.play()
		$Hospital.stop()
		$Zombies.stop()
		area1 = false
		area2 = false
		area3 = false
		area4 = false
		area5 = true
		area6 = false
		area7 = false


func _on_Area6_body_entered(body):
	if body == Global.Player and area6 == false:
		$Insertion.stop()
		$Power_Armor.stop()
		$Office.stop()
		$Dock_Combat.stop()
		$Garage_Battle.stop()
		$Hospital.play()
		area1 = false
		area2 = false
		area3 = false
		area4 = false
		area5 = false
		area6 = true
		area7 = false

func _on_Area7_body_entered(body):
	if body == Global.Player and area7 == false:
		$Insertion.stop()
		$Power_Armor.stop()
		$Office.stop()
		$Dock_Combat.stop()
		$Garage_Battle.stop()
		$Hospital.stop()
		$Zombies.play()
		area1 = false
		area2 = false
		area3 = false
		area4 = false
		area5 = false
		area6 = false
		area7 = true
