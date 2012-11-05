/*
	This example shows how to move an entity in a scene.
	We created an entity called "ship" and we'll manipulate
	its position with a callback function
	For more info about Callbacks: http://doc.ethanonengine.com/manual/32

	In the Callback funcion, we check if any arrow key is pressed (UP, DOWN, RIGHT or LEFT) 
	and then we move the ship towards that direction.

	For more information see the Ethanon Engine manual: http://doc.ethanonengine.com/
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
}
