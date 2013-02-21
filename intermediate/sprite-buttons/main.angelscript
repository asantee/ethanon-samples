#include "Button.angelscript"

Button@ button;

void main()
{
	LoadScene("scenes/start.esc", "onSceneLoaded", "onSceneUpdate");
}

void onSceneLoaded()
{
	@button = Button("sprites/do-not-press.png", vector2(0.9f, 0.10f) * GetScreenSize());

	LoadSoundEffect("soundfx/explosion_huge.mp3");
}

void onSceneUpdate()
{
	button.putButton();

	// if the user presses the button, explode the ship
	if (button.isPressed())
	{
		ETHEntity@ ship = SeekEntity("ship.ent");

		if (ship !is null)
		{
			AddEntity("explosion.ent", ship.GetPosition());
			PlaySample("soundfx/explosion_huge.mp3");
			DeleteEntity(ship);
		}
		else
		{
			DrawFadingText(vector2(140, 200), "Ship is missing!", "Verdana30_shadow.fnt", ARGB(255,255,255,255), 2000);
		}

		button.setPressed(false);
	}
}

void ETHCallback_ship(ETHEntity@ thisEntity)
{
	ETHInput@ input = GetInputHandle();

	// computes the distance our ship must move in order to keep
	// a speed of 60 pixels per second
	float speed = UnitsPerSecond(120.0f);

	if (input.KeyDown(K_RIGHT))
		thisEntity.AddToPositionXY(vector2(1.0f, 0.0f) * speed);

	if (input.KeyDown(K_LEFT))
		thisEntity.AddToPositionXY(vector2(-1.0f, 0.0f) * speed);

	if (input.KeyDown(K_UP))
		thisEntity.AddToPositionXY(vector2(0.0f,-1.0f) * speed);

	if (input.KeyDown(K_DOWN))
		thisEntity.AddToPositionXY(vector2(0.0f, 1.0f) * speed);
}
