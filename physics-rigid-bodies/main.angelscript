void main()
{
	LoadScene("scenes/physics.esc", "onSceneLoaded", "onSceneUpdate");
}

void onSceneLoaded()
{
}

void onSceneUpdate()
{
	ETHInput@ input = GetInputHandle();
	if (input.GetKeyState(K_LMOUSE) == KS_HIT)
	{
		AddEntity("box.ent", vector3(input.GetCursorPos(), 0.0f), 0.0f);
	}
	if (input.GetKeyState(K_RMOUSE) == KS_HIT)
	{
		AddEntity("boulder.ent", vector3(input.GetCursorPos(), 0.0f), 0.0f);
	}
}
