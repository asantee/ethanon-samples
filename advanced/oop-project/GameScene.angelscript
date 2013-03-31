#include "Button.angelscript"
#include "Character.angelscript"

class GameScene : Scene
{
	private Button@ m_exitButton;
	private Character@ m_character;

	GameScene()
	{
		const string sceneName = "empty";
		super(sceneName);
	}

	void onCreated()
	{
		@m_exitButton = Button("sprites/return_button.png", vector2(0.0f, 0.0f), vector2(0.0f, 0.0f));

		const vector2 screenMiddle(GetScreenSize() * 0.5f);
		@m_character = Character("witch.ent", screenMiddle);
	}

	void onUpdate()
	{
		m_character.update();

		m_exitButton.putButton();
		if (m_exitButton.isPressed())
		{
			g_sceneManager.setCurrentScene(MainMenuScene());
		}
	}
}
