void main()
{
	LoadScene("scenes/physics.esc", "onSceneLoaded", "onSceneUpdate");
}

void onSceneLoaded()
{
}

void onSceneUpdate()
{
	DrawText(vector2(0, 0), "Left/right click to add objects to scene", "Verdana20_shadow.fnt", 0xFFFFFFFF);

	ETHInput@ input = GetInputHandle();
	if (input.GetTouchState(0) == KS_HIT)
	{
		AddEntity("box.ent", vector3(input.GetCursorPos(), 0.0f), 0.0f);
	}
	if (input.GetKeyState(K_RMOUSE) == KS_HIT)
	{
		AddEntity("boulder.ent", vector3(input.GetCursorPos(), 0.0f), 0.0f);
	}
}
