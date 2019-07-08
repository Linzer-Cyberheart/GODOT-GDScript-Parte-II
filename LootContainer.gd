extends NinePatchRect

func _ready():
	visible = false


func collect_loot(loot):
	visible = true
	if loot == "Suitcase":
		$LootList.add_icon_item(load(Global.suitcase_sprite), false)
	if loot == "Files":
		$LootList.add_icon_item(load(Global.files_sprite), false)
	if loot == "Recorder":
		$LootList.add_icon_item(load(Global.recorder_sprite), false)
	if loot == "Lantern":
		$LootList.add_icon_item(load(Global.lantern_icon_sprite), false)
	if loot == "Motocicle":
		$LootList.add_icon_item(load(Global.motocicle_icon_sprite), false)
	if loot == "Knife":
		$LootList.add_icon_item(load(Global.knife_icon_sprite), false)
	if loot == "Gun":
		$LootList.add_icon_item(load(Global.gun_icon_sprite), false)
	if loot == "Medkit":
		$LootList.add_icon_item(load(Global.medkit_icon_sprite), false)
	if loot == "Armor":
		$LootList.add_icon_item(load(Global.armor_icon_sprite), false)
	if loot == "Skin":
		$LootList.add_icon_item(load(Global.skin_icon_sprite), false)
	if loot == "Rifle":
		$LootList.add_icon_item(load(Global.rifle_icon_sprite), false)
	if loot == "Laseron":
		$LootList.add_icon_item(load(Global.laseron_icon_sprite), false)
	if loot == "Sword":
		$LootList.add_icon_item(load(Global.sword_icon_sprite), false)