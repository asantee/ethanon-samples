/*
	This example takes the "shooting-spaceship" code and make
	all moving entities move at same speed, no matter what the
	FPS rate is.

	UnitsPerSecond function reference: http://doc.ethanonengine.com/api/function/80
	More about entity callback functions: http://doc.ethanonengine.com/manual/32
*/

void main()
{
	LoadScene("scenes/scene.esc", "", "onSceneUpdate");
}

void onSceneUpdate()
{
	DrawText(vector2(0, 0), "No matter what the FPS rate is,\nthe ship speed will remain the same", "Verdana20.fnt", 0xFFFFFFFF);
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
	thisEntity.AddToPositionXY(vector2(0.0f,-1.0f) * speed);

	// if the projectile goes out of the screen view, delete it
	if (thisEntity.GetPosition().y < 0.0f)
	{
		DeleteEntity(thisEntity);
		print("projectile removed because it is no longer visible: ID " + thisEntity.GetID());
	}
}
