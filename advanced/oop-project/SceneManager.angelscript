#include "Scene.angelscript"

class SceneManager
{
	Scene@ m_currentScene;

	void setCurrentScene(Scene@ scene)
	{
		@m_currentScene = @scene;
	}

	void runOnSceneCreatedFunction()
	{
		if (m_currentScene !is null)
			m_currentScene.onCreated();
	}

	void runOnSceneUpdateFunction()
	{
		if (m_currentScene !is null)
			m_currentScene.onUpdate();
	}
}

SceneManager g_sceneManager;

void onSceneCreated()
{
	g_sceneManager.runOnSceneCreatedFunction();
}

void onSceneUpdate()
{
	g_sceneManager.runOnSceneUpdateFunction();
}
