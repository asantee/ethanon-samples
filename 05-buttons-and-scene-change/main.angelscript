/*
	Here we have a simple example of how we add a shot while we manipulated the ship in the scene.
	We created an entity called "shot" and we add the shot in the scene when
	we hit the "Space" key in our keyboard. We manipulated the shot, by add the direction of it,
	with a Callback function(for more info about Callbacks: http://bit.ly/SdkvTE).

	For more information see the Ethanon Engine manual: http://doc.ethanonengine.com/
*/
#include "ETHFramework/IncludeModules.angelscript"


void main()
{
	LoadScene("scenes/scene.esc", "onSceneLoader", "onSceneUpdate");

}

void onSceneLoader()
{

}
void onSceneUpdate()
{

}

void ETHCallback_ship(ETHEntity @ thisEntity)
{
	
	ETHInput @ handle = GetInputHandle();

	float speed = g_timeManager.scaledUnitsPerSecond(120.0f);


	if(handle.KeyDown(K_RIGHT))
	{
		thisEntity.AddToPositionXY(vector2(1.0f,0.0f)*speed);
	}

	if(handle.KeyDown(K_LEFT))
	{
		thisEntity.AddToPositionXY(vector2(-1.0f,0.0f)*speed);
	}

	if(handle.KeyDown(K_UP))
	{
		thisEntity.AddToPositionXY(vector2(0.0f,-1.0f)*speed);
	}

	if(handle.KeyDown(K_DOWN))
	{
		thisEntity.AddToPositionXY(vector2(0.0f,1.0f)*speed);
	}

	if(handle.GetKeyState(K_SPACE) == KS_HIT)
	{
		AddEntity("shot.ent",thisEntity.GetPosition());
	}

}

void ETHCallback_shot(ETHEntity @ thisEntity)
{

	float speed = g_timeManager.scaledUnitsPerSecond(120.0f);

	thisEntity.AddToPositionXY(vector2(0,-1)*speed);
}
