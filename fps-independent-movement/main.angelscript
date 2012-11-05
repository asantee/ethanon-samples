/*
	Here we have a simple example of how to shoot with our moving spaceship.
	We created an entity called "shot" and we add the shot to scene when
	we hit the "Space" key. We manipulate the projectile by adding a direction
	vector from its callback function.

	More about entity callback functions: http://doc.ethanonengine.com/manual/32
*/

void main()
{
	LoadScene("scenes/scene.esc");
}

void ETHCallback_ship(ETHEntity@ thisEntity)
{
	ETHInput@ input = GetInputHandle();

	// computes the distance our ship must move in order to keep
	// a speed of 60 pixels per second
	float speed = UnitsPerSecond(120.0f);

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
	}
}

void ETHCallback_shot(ETHEntity@ thisEntity)
{
	float speed = UnitsPerSecond(360.0f);
	thisEntity.AddToPositionXY(vector2(0,-1) * speed);
}
