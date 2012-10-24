void main()
{
	/*
	  Will globally scale all entities in scene as if the screen height
	  would ALWAYS be 512 pixels tall.
	  In other words, if the original scene height is 512 pixels, it
	  will ALWAYS fit the entire scene in screen automatically.
	*/ 
	SetFixedHeight(512.0f);

	LoadScene("scenes/scene.esc", "onSceneLoaded", "onSceneUpdate");
}

void onSceneLoaded()
{
}

void onSceneUpdate()
{
	ETHInput@ input = GetInputHandle();
	if (input.GetTouchState(0) == KS_HIT)
	{
		AddEntity("box.ent", vector3(input.GetCursorPos(), 0.0f), 0.0f);
	}

	if (input.GetKeyState(K_RMOUSE) == KS_HIT || input.GetTouchState(1) == KS_HIT)
	{
		AddEntity("boulder.ent", vector3(input.GetCursorPos(), 0.0f), 0.0f);
	}
}
