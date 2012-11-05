/*
	Here we have a simple example of how we add a soundtrack and a small sound when we do an action,
	in this case a shot. So, when we start the game we car hear the soundtrack tha we loaded in the "onSceneLoader"
	function, and when we press the "space" key we can hear that sound too.

	For more information see the Ethanon Engine manual: http://doc.ethanonengine.com/
*/
#include "ETHFramework/IncludeModules.angelscript"

void main()
{
	LoadScene("scenes/scene.esc", "onSceneLoader", "onSceneUpdate");

}

void onSceneLoader()
{
		LoadSoundEffect("soundfx/tiro.mp3");

		LoadMusic("soundfx/trilha.mp3");
		LoopSample("soundfx/trilha.mp3",true);

		PlaySample("soundfx/trilha.mp3");
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
		PlaySample("soundfx/tiro.mp3");
	}

}

void ETHCallback_shot(ETHEntity @ thisEntity)
{

	float speed = g_timeManager.scaledUnitsPerSecond(120.0f);

	thisEntity.AddToPositionXY(vector2(0,-1)*speed);
}
