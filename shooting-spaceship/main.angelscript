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

	if (input.KeyDown(K_RIGHT))
	{
		thisEntity.AddToPositionXY(vector2(2.0f, 0.0f));
	}

	if (input.KeyDown(K_LEFT))
	{
		thisEntity.AddToPositionXY(vector2(-2.0f, 0.0f));
	}

	if (input.KeyDown(K_UP))
	{
		thisEntity.AddToPositionXY(vector2(0.0f,-2.0f));
	}

	if (input.KeyDown(K_DOWN))
	{
		thisEntity.AddToPositionXY(vector2(0.0f, 2.0f));
	}

	if (input.GetKeyState(K_SPACE) == KS_HIT)
	{
		AddEntity("shot.ent",thisEntity.GetPosition());
	}
}

void ETHCallback_shot(ETHEntity@ thisEntity)
{
	thisEntity.AddToPositionXY(vector2(0.0f,-15.0f));
}
