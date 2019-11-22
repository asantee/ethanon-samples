#include "src/scene-manager/Scene.angelscript"
#include "src/scene-manager/SceneManager.angelscript"

#include "src/game-state/MainMenuScene.angelscript"
#include "src/game-state/GameScene.angelscript"

#include "src/utils/Button.angelscript"
#include "src/utils/FrameTimer.angelscript"
#include "src/utils/isPointInRect.angelscript"

#include "src/character/Character.angelscript"
#include "src/character/CharacterController.angelscript"
#include "src/character/MainCharacterController.angelscript"

void main()
{
	SetFixedHeight(720.0f);

	g_sceneManager.setCurrentScene(MainMenuScene());
}
