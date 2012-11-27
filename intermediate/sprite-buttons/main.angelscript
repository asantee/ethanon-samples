#include "isPointInRect.angelscript"
#include "Button.angelscript"

Button@ button;

void main()
{
	LoadScene("scenes/start.esc", "onSceneLoader", "onSceneUpdate");
}

void onSceneLoader()
{
	@button = Button("sprites/do-not-press.png", vector2(0.85f, 0.15f) * GetScreenSize(), vector2(0.5f, 0.5f));
	LoadSoundEffect("soundfx/explosion_huge.mp3");
}

void onSceneUpdate()
{
	button.putButton();

	if(button.isTouched())
	{
		ETHEntity@ m_ship = SeekEntity("ship.ent");

		if(m_ship is null)
		{
			DrawFadingText(vector2(140, 200), "Ship is missing!", "Verdana30_shadow.fnt", ARGB(255,255,255,255), 2000);
		}
		else
		{
			AddEntity("explosion.ent", m_ship.GetPosition());
			PlaySample("soundfx/explosion_huge.mp3");
			DeleteEntity(m_ship);
		}

		button.setTouched();
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

	
}
