# Menu de Tela Principal
extends CanvasLayer

# Carrega animação de Tela Principal.
func _ready():
	$AnimationPlayer.play("MainMenu")

# Inicia um novo jogo e carrega esse novo jogo mandando a variavel global intro como true para a Tela de Carregamento.
func _on_Start_Game_pressed():
	Global.intro = true
	get_tree().change_scene("res://Scenes/Loadscreen.tscn")

# Inicia um tutorial e carrega esse tutorial mandando a varivael global tuto como true para a Tela de Carregamento.
func _on_Start_Tutorial_pressed():
	Global.tuto = true
	get_tree().change_scene("res://Scenes/Loadscreen.tscn")

#Quando o jogo é zerado, a Tela Principal passa por uma mudança gráfica.
func change_bg(x):
	if x == true or Global.Zerado == true:
		$CenterContainer/NinePatchRect2.texture = null
		$CenterContainer/NinePatchRect4.texture = load("res://GFX/Interface/PNG/Main2.png")
# Fecha o jogo.
func _on_Quit_pressed():
	get_tree().quit()