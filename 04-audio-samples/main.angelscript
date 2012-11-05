void main()
{
	LoadScene("scenes/scene.esc", "onSceneLoaded");
}

void onSceneLoaded()
{
	LoadSoundEffect("soundfx/shoot.mp3");

	LoadMusic("soundfx/soundtrack.mp3");
	LoopSample("soundfx/soundtrack.mp3",true);

	PlaySample("soundfx/soundtrack.mp3");
}

void ETHCallback_ship(ETHEntity@ thisEntity)
{
	ETHInput@ input = GetInputHandle();

	float speed = UnitsPerSecond(160.0f);

	if (input.KeyDown(K_RIGHT))
	{
		thisEntity.AddToPositionXY(vector2(1.0f, 0.0f) * speed);
	}

	if (input.KeyDown(K_LEFT))
	{
		thisEntity.AddToPositionXY(vector2(-1.0f, 0.0f) * speed);
	}

	if (input.KeyDown(K_UP))
	{
		thisEntity.AddToPositionXY(vector2(0.0f,-1.0f) * speed);
	}

	if (input.KeyDown(K_DOWN))
	{
		thisEntity.AddToPositionXY(vector2(0.0f, 1.0f) * speed);
	}

	if (input.GetKeyState(K_SPACE) == KS_HIT)
	{
		AddEntity("shot.ent", thisEntity.GetPosition());
		PlaySample("soundfx/shoot.mp3");
	}
}

void ETHCallback_shot(ETHEntity@ thisEntity)
{
	float speed = UnitsPerSecond(400.0f);
	thisEntity.AddToPositionXY(vector2(0.0f,-1.0f) * speed);

	// if the projectile goes out of the screen view, delete it
	if (thisEntity.GetPosition().y < 0.0f)
	{
		DeleteEntity(thisEntity);
		print("projectile removed because it is no longer visible: ID " + thisEntity.GetID());
	}
}
