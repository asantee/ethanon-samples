/*
	This example shows how to change scenes with entities acting like
	buttons.

	We create a starting scene with two entities, like a starting menu.
	If the user clicks in the "start game" button, the game begins. In the 
	game, we have another button to return to the start scene.

	For more information see the Ethanon Engine manual: http://doc.ethanonengine.com/
*/

#include "isPointInRect.angelscript"

void main()
{
	LoadScene("scenes/start_scene.esc");
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

void ETHCallback_start_button(ETHEntity@ thisEntity)
{
	vector2 size = thisEntity.GetSize() * thisEntity.GetScale();

	ETHInput@ input = GetInputHandle();
	
	if (input.GetTouchState(0) == KS_HIT)
	{
		if(isPointInRect(input.GetTouchPos(0), thisEntity.GetPositionXY(), size, vector2(0.5f, 0.5f)))
		{
			LoadScene("scenes/scene.esc");
		}
	}
}

void ETHCallback_return_button(ETHEntity@ thisEntity)
{
	vector2 size = thisEntity.GetSize() * thisEntity.GetScale();

	ETHInput@ input = GetInputHandle();
		
	if (input.GetTouchState(0) == KS_HIT)
	{
		if(isPointInRect(input.GetTouchPos(0), thisEntity.GetPositionXY(), size, vector2(0.5f, 0.5f)))
		{
			LoadScene("scenes/start_scene.esc");
		}
	}		
}
