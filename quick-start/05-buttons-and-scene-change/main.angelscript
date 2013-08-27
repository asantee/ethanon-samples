/*
	This example shows how to change scenes with sprite-based buttons.

	If the user clicks the "start game" button, the game begins. In the 
	game, we have another button to return to the start scene.

	For more information see the Ethanon Engine manual: http://doc.ethanonengine.com/
*/

#include "Button.angelscript"

/*****************************************************
	Starting scene
*****************************************************/
void main()
{
	LoadScene("scenes/start_scene.esc", "createStartScene", "updateStartScene");
}

Button@ g_startGameButton;

void createStartScene()
{
	vector2 startButtonPos(GetScreenSize() * vector2(0.5f, 0.75f));
	@g_startGameButton = Button("sprites/start_game.png", startButtonPos);
}

void updateStartScene()
{
	// draw and check button
	g_startGameButton.putButton();
	if (g_startGameButton.isPressed())
	{
		LoadScene("scenes/scene.esc", "createGameScene", "updateGameScene");
	}

	// draw centered game title sprite
	SetSpriteOrigin("sprites/main_logo.png", vector2(0.5f, 0.5f));
	DrawSprite("sprites/main_logo.png", GetScreenSize() * vector2(0.5f, 0.25f));
}

/*****************************************************
	Game scene
*****************************************************/
Button@ g_returnButton;

void createGameScene()
{
	vector2 returnButtonPos(GetScreenSize() * vector2(1.0f, 0.0f));
	vector2 returnButtonOrigin(1.0f, 0.0f);
	@g_returnButton = Button("sprites/return_button.png", returnButtonPos, returnButtonOrigin);
}

void updateGameScene()
{
	// draw and check button
	g_returnButton.putButton();
	if (g_returnButton.isPressed())
	{
		LoadScene("scenes/start_scene.esc", "createStartScene", "updateStartScene");
	}
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
