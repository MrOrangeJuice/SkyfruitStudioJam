function NextScene() {
	
	// Always advance beat and save game
	global.health = global.maxHealth;
	if (room != rTitle) global.storyBeat++;
	SaveGame();
	ClearTextHandler();
	StopMusic();


	switch (global.storyBeat) {
	
		// Startup
		case CHAPTER.NOTHING:
			SlideTransition(TRANS_MODE.GOTO, rTutorial);
			PlayMusic(mus_Tutorial);
			break;
		
		// Tutorial complete
		case CHAPTER.ONE_INTRO:
			SlideTransition(TRANS_MODE.GOTO, rScene);
			LoadText("scene_intro", "intro_1");
			break;
			
		// Intro complete
		case CHAPTER.ONE_BATTLE:
			SlideTransition(TRANS_MODE.GOTO, rLevel1);
			PlayMusic(mus_JohnnyFights);
			break;

		// One battle complete
		case CHAPTER.TWO_CONVO:
			SlideTransition(TRANS_MODE.GOTO, rScene);
			LoadText("scene_isla", "isla_1");
			break;
			
		// Date with Isla complete
		case CHAPTER.TWO_BATTLE:
			SlideTransition(TRANS_MODE.GOTO, rLevel2);
			PlayMusic(mus_JohnnyFights);
			break;

		// Second battle complete
		case CHAPTER.THREE_CONVO:
			SlideTransition(TRANS_MODE.GOTO, rScene);
			LoadText("scene_clyde", "clyde_1");
			break;

		// Date with Clyde complete
		case CHAPTER.THREE_BATTLE:
			SlideTransition(TRANS_MODE.GOTO, rLevel3);
			PlayMusic(mus_JohnnyFights);
			break;

		// Third battle complete
		case CHAPTER.FOUR_CONVO:
			room_goto(rScene);
			ClearTextHandler();
			LoadText("scene_alloy", "alloy_1");
			break;

		// Date with Alloy complete
		case CHAPTER.BOSS_BATTLE:
			SlideTransition(TRANS_MODE.GOTO, rLevel4);
			PlayMusic(mus_JohnnyFights);
			break;

		// Boss battle complete
		case CHAPTER.FINAL_CONVO:
			SlideTransition(TRANS_MODE.GOTO, rScene);
			LoadText("scene_end", "end_1");
			break;
	}
}
