class Scene
{
	Scene(const string &in sceneFileName)
	{
		LoadScene(sceneFileName, "onSceneCreated", "onSceneUpdate");
	}

	void onCreated()
	{
	}

	void onUpdate()
	{
	}
}
