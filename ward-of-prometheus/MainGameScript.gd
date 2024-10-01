extends Node2D
var Tiles = []
var rng = RandomNumberGenerator.new()
var FoolObj = preload("res://Fool.tscn")
var HeroObj = preload("res://Hero.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var Tiles2SpawnOn = []
	for VTiles in range(0,Globals.MapSize):
		var TempMat = []
		for HTiles in range(0,Globals.MapSize):
			var TChoose = rng.randi_range(1,100)
			if TChoose < 35:
				TempMat.append(int(1))
			elif TChoose < 60:
				TempMat.append(int(2))
			else:
				TempMat.append(int(3))
			#TempMat.append(rng.randi_range(1,3))
		Tiles.append(TempMat)
	var NTiles = Tiles
	for VTiles in range(0,Globals.MapSize):
		for HTiles in range(0,Globals.MapSize):
			if VTiles == Globals.MapSize - 1 and HTiles != Globals.MapSize - 1:
				NTiles[VTiles][HTiles] = (Tiles[VTiles-1][HTiles-1] + Tiles[VTiles-1][HTiles] + Tiles[VTiles-1][HTiles+1] + Tiles[VTiles][HTiles-1] + Tiles[VTiles][HTiles+1] + Tiles[1][HTiles-1] + Tiles[1][HTiles] + Tiles[1][HTiles+1]) / 8
			elif HTiles == Globals.MapSize - 1 and VTiles != Globals.MapSize - 1:
				NTiles[VTiles][HTiles] = (Tiles[VTiles-1][HTiles-1] + Tiles[VTiles-1][HTiles] + Tiles[VTiles-1][1] + Tiles[VTiles][HTiles-1] + Tiles[VTiles][1] + Tiles[VTiles+1][HTiles-1] + Tiles[VTiles+1][HTiles] + Tiles[VTiles+1][1]) / 8
			elif HTiles == Globals.MapSize - 1 and VTiles == Globals.MapSize - 1:
				NTiles[VTiles][HTiles] = (Tiles[VTiles-1][HTiles-1] + Tiles[VTiles-1][HTiles] + Tiles[VTiles-1][1] + Tiles[VTiles][HTiles-1] + Tiles[VTiles][1] + Tiles[1][HTiles-1] + Tiles[1][HTiles] + Tiles[1][1]) / 8
			else:
				#print(str(VTiles) + " " + str(HTiles))
				NTiles[VTiles][HTiles] = (Tiles[VTiles-1][HTiles-1] + Tiles[VTiles-1][HTiles] + Tiles[VTiles-1][HTiles+1] + Tiles[VTiles][HTiles-1] + Tiles[VTiles][HTiles+1] + Tiles[VTiles+1][HTiles-1] + Tiles[VTiles+1][HTiles] + Tiles[VTiles+1][HTiles+1]) / 8
	#print(NTiles)
	Tiles = NTiles
	for VTiles in range(0,Globals.MapSize):
		for HTiles in range(0,Globals.MapSize):
			$GroundLayer.set_cell(Vector2(HTiles - (Globals.MapSize/2),VTiles - (Globals.MapSize/2)),1,Vector2i((Tiles[VTiles][HTiles]-1) * 2 + rng.randi_range(0,1),0))
			if Tiles[VTiles][HTiles] == 2:
				$PropLayer.set_cell(Vector2(HTiles - (Globals.MapSize/2),VTiles - (Globals.MapSize/2)),1,Vector2i(0,0),2)
			elif rng.randi_range(0,100) > 95:
				$PropLayer.set_cell(Vector2(HTiles - (Globals.MapSize/2),VTiles - (Globals.MapSize/2)),1,Vector2i(0,0),1)
			else:
				Tiles2SpawnOn.append([HTiles,VTiles])
	for i in range(0,Globals.MapSize+2):
		$GroundLayer.set_cell(Vector2(-Globals.MapSize/2 - 1 + i,-Globals.MapSize/2 - 1),1,Vector2i(4 + rng.randi_range(0,1),0))
		$GroundLayer.set_cell(Vector2(-Globals.MapSize/2 - 1 + i,Globals.MapSize/2),1,Vector2i(4 + rng.randi_range(0,1),0))
		$GroundLayer.set_cell(Vector2(-Globals.MapSize/2 - 1,-Globals.MapSize/2 - 1 + i),1,Vector2i(4 + rng.randi_range(0,1),0))
		$GroundLayer.set_cell(Vector2(Globals.MapSize/2,-Globals.MapSize/2 - 1 + i),1,Vector2i(4 + rng.randi_range(0,1),0))
	for i in range(0,Globals.MapSize+4):
		$GroundLayer.set_cell(Vector2(-Globals.MapSize/2 - 2 + i,-Globals.MapSize/2 - 2),1,Vector2i(6 + rng.randi_range(0,1),0))
		$GroundLayer.set_cell(Vector2(-Globals.MapSize/2 - 2 + i,Globals.MapSize/2 + 1),1,Vector2i(6 + rng.randi_range(0,1),0))
		$GroundLayer.set_cell(Vector2(-Globals.MapSize/2 - 2,-Globals.MapSize/2 - 2 + i),1,Vector2i(6 + rng.randi_range(0,1),0))
		$GroundLayer.set_cell(Vector2(Globals.MapSize/2 + 1,-Globals.MapSize/2 - 2 + i),1,Vector2i(6 + rng.randi_range(0,1),0))
	for n in range(0,Globals.FoolsNeeded):
		var Tile2SpawnIn = rng.randi_range(0,len(Tiles2SpawnOn)-1)
		var NewFool = FoolObj.instantiate()
		NewFool.position = Vector2((Tiles2SpawnOn[Tile2SpawnIn][0] - 1) * 32 + 16 - (Globals.MapSize/2*32),(Tiles2SpawnOn[Tile2SpawnIn][1] - 1) * 32 + 16 - (Globals.MapSize/2*32))
		add_child(NewFool)
		Tiles2SpawnOn.remove_at(Tile2SpawnIn)
	for n in range(0,Globals.HeroesNeeded):
		var Tile2SpawnIn = rng.randi_range(0,len(Tiles2SpawnOn)-1)
		var NewHero = HeroObj.instantiate()
		NewHero.position = Vector2((Tiles2SpawnOn[Tile2SpawnIn][0] - 1) * 32 + 16 - (Globals.MapSize/2*32),(Tiles2SpawnOn[Tile2SpawnIn][1] - 1) * 32 + 16 - (Globals.MapSize/2*32))
		add_child(NewHero)
		Tiles2SpawnOn.remove_at(Tile2SpawnIn)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
