#include "SceneManager.angelscript"
#include "MainMenuScene.angelscript"
#include "GameScene.angelscript"

void main()
{
	SetFixedHeight(720.0f);

	g_sceneManager.setCurrentScene(MainMenuScene());
}
