void main()
{
	/*
	  The single line below will globally scale all entities in scene
	  as if the screen height would ALWAYS be 512 pixels tall.
	  In other words, if the original scene height is 512 pixels, it
	  will ALWAYS fit the entire scene in screen automatically.
	*/ 
	SetFixedHeight(512.0f);

	LoadScene("scenes/scene.esc", "", "onSceneUpdate");
}

void onSceneUpdate()
{
	DrawExplanatoryText();
}

void DrawExplanatoryText()
{
	string str;
	str += "This scene is 512px tall.\n";
	str += "The global scale system will make sure\n";
	str += "our scene will always fit the screen even\n";
	str += "if our screen height is different than 512 px.\n\n";

	str += "All entities will be automatically scaled and\n";
	str += "behave according to the global scale factor.\n";

	DrawText(vector2(100,100), str, "Verdana20_shadow.fnt", 0xFFFFFFFF);
}
