function NextScene() {
	
	switch (global.storyBeat) {
	
	
		
		// Tutorial complete
		case CHAPTER.ONE_INTRO:
			room_goto(rScene);
			ClearTextHandler();
			LoadText("scene_intro", "intro_1");
			PlayMusic(mus_MainTheme);
			break;
			
		// Intro complete
		case CHAPTER.ONE_BATTLE:
			break;

		// One battle complete
		case CHAPTER.TWO_CONVO:
			room_goto(rScene);
			ClearTextHandler();
			LoadText("scene_isla", "isla_1");
			PlayMusic(mus_Dating);
			break;
			
		// Date with Isla complete
		case CHAPTER.TWO_BATTLE:
			break;

		// Second battle complete
		case CHAPTER.THREE_CONVO:
			room_goto(rScene);
			ClearTextHandler();
			LoadText("scene_clyde", "clyde_1");
			PlayMusic(mus_Dating);
			break;

		// Date with Clyde complete
		case CHAPTER.THREE_BATTLE:
			break;

		// Third battle complete
		case CHAPTER.FOUR_CONVO:
			room_goto(rScene);
			ClearTextHandler();
			LoadText("scene_alloy", "alloy_1");
			PlayMusic(mus_Dating);
			break;

		// Date with Alloy complete
		case CHAPTER.BOSS_BATTLE:
			break;
	}
}
