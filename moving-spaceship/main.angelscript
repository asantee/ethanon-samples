/*
	Here we have a simple example of how we move an entity in a scene.
	We created an entity called "ship" and we manipulated it with a 
	Callback function(for more info about Callbacks: http://bit.ly/SdkvTE).

	In the Callback funcion, we see if any moving key is pressed(UP, DOWN, RIGHT, LEFT) 
	and them we move the ship in that direction.

	For more information see the Ethanon Engine manual: http://doc.ethanonengine.com/
*/

void main()
{
	LoadScene("scenes/scene.esc", "", "");

}


void ETHCallback_ship(ETHEntity @ thisEntity)
{
	
	ETHInput @ handle = GetInputHandle();

	if(handle.KeyDown(K_RIGHT))
	{
		thisEntity.AddToPositionXY(vector2(2.0f,0.0f));
	}

	if(handle.KeyDown(K_LEFT))
	{
		thisEntity.AddToPositionXY(vector2(-2.0f,0.0f));
	}

	if(handle.KeyDown(K_UP))
	{
		thisEntity.AddToPositionXY(vector2(0.0f,-2.0f));
	}

	if(handle.KeyDown(K_DOWN))
	{
		thisEntity.AddToPositionXY(vector2(0.0f,2.0f));
	}

}
