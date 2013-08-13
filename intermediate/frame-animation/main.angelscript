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

// initializes the timer object
void ETHConstructorCallback_witch(ETHEntity@ thisEntity)
{
	// instantiates a FrameTimer object a copies a reference to it into the character entity
	FrameTimer frameTimer;
	thisEntity.SetObject("frameTimer", @frameTimer);

	// creates a variable the control the current line in the sprite sheet
	thisEntity.SetUInt("directionLine", 0);
}

// control character
void ETHCallback_witch(ETHEntity@ thisEntity)
{
	// retrieves the FrameTimer object reference from the entity
	FrameTimer@ frameTimer;
	thisEntity.GetObject("frameTimer", @frameTimer);

	ETHInput@ input = GetInputHandle();
	vector2 direction(0, 0);

	// find current move direction based on keyboard keys
	if (input.KeyDown(K_DOWN))
	{
		thisEntity.SetUInt("directionLine", 0);
		direction += vector2(0, 1);
	}
	if (input.KeyDown(K_LEFT))
	{
		thisEntity.SetUInt("directionLine", 1);
		direction += vector2(-1, 0);
	}
	if (input.KeyDown(K_RIGHT))
	{
		thisEntity.SetUInt("directionLine", 2);
		direction += vector2(1, 0);
	}
	if (input.KeyDown(K_UP))
	{
		thisEntity.SetUInt("directionLine", 3);
		direction += vector2(0,-1);
	}

	// if there's movement, update animation
	if (direction.length() != 0.0f)
		frameTimer.update(0, 3, 150);
	else
		frameTimer.update(0, 0, 150);

	// update entity
	const float speed = UnitsPerSecond(120.0f); // pixels per second
	const uint currentFrame = frameTimer.getCurrentFrame();
	thisEntity.AddToPositionXY(normalize(direction) * speed);

	// finds the current entity frame based on column x row
	thisEntity.SetFrame(currentFrame, thisEntity.GetUInt("directionLine"));
}
