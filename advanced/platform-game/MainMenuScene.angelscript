#include "Button.angelscript"

class MainMenuScene : Scene
{
	private Button@ m_startGameButton;

	MainMenuScene()
	{
		const string sceneName = "empty";
		super(sceneName);
	}

	void onCreated()
	{
		const vector2 screenMiddle(GetScreenSize() * 0.5f);
		@m_startGameButton = Button("sprites/start_game.png", screenMiddle);
	}

	void onUpdate()
	{
		m_startGameButton.putButton();

		if (m_startGameButton.isPressed())
		{
			g_sceneManager.setCurrentScene(GameScene());
		}
	}
}
