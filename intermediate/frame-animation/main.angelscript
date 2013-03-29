#include "FrameTimer.angelscript"

void main()
{
	LoadScene("empty", "onCreated");
}

// create scene by adding 
void onCreated()
{
	const vector2 screenMiddle = GetScreenSize() * 0.5f;
	AddEntity("witch.ent", vector3(screenMiddle, 0));
}

// global character properties
FrameTimer g_frameTimer;
uint g_directionLine = 0;

// control character
void ETHCallback_witch(ETHEntity@ thisEntity)
{
	ETHInput@ input = GetInputHandle();
	vector2 direction(0, 0);

	// find current move direction based on keyboard keys
	if (input.KeyDown(K_DOWN))
	{
		g_directionLine = 0;
		direction += vector2(0, 1);
	}
	if (input.KeyDown(K_LEFT))
	{
		g_directionLine = 1;
		direction += vector2(-1, 0);
	}
	if (input.KeyDown(K_RIGHT))
	{
		g_directionLine = 2;
		direction += vector2(1, 0);
	}
	if (input.KeyDown(K_UP))
	{
		g_directionLine = 3;
		direction += vector2(0,-1);
	}

	// if there's movement, update animation
	if (direction.length() != 0.0f)
		g_frameTimer.update(0, 3, 150);
	else
		g_frameTimer.update(0, 0, 150);

	// update entity
	const float speed = 1.5f;
	const uint currentFrame = g_frameTimer.getCurrentFrame();
	thisEntity.AddToPositionXY(normalize(direction) * speed);
	thisEntity.SetFrame(currentFrame, g_directionLine);
}
