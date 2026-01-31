convo_test_1 = {
	intro: [
		Page(spk_johnny, "Howdy. I'm a cowboy. Johnny Slick. They call me that on account of how SLICK I am."),
		Page(spk_jane, "Oh Johnny. You're here. |V|I've heard of you./V/"),
		Page(spk_jane, "I've heard of you because of how |R|cool|W| you are."),
		Page(spk_jane, "You're so cool."),
		Page(spk_johnny, "Heh. So you've heard of how cool I am."),
		Page(spk_johnny, "That just makes me even cooler."),
		Page(spk_johnny, "So cool. I'm just so cool."),
		Page(spk_jane, "So cool, Johnny. The |R|cowboy.|W| Who rides a |Y|horse|W|."),
	],
	
	choicer: [
		Page(spk_jane, "Say, Johnny..."),
		Page(spk_jane, "|R|Cats?|W| Or |R|dogs?|S|"),
		Page(spk_johnny, "Hmmm..."),
		ChoicePage(
			Choice("Cats", "cats"),
			Choice("Dogs", "dogs"),
		),
	],
	cats: [
		Page(spk_johnny, "Cats. Cats for sure."),
		Page(spk_johnny, "Dogs're stupid."),
	],
	dogs: [
		Page(spk_johnny, "Dogs. It's gotta be dogs."),
		Page(spk_johnny, "I mean... who let 'em out?? Haha..."),
	],
	
	
	gift_choicer: [
		Page(spk_jane, "Say, Johnny..."),
		Page(spk_jane, "How would you get the attention of a romance pardner?"),
		Page(spk_johnny, "Hmmm..."),
		ChoicePage(
			Choice("Stare at 'em", "gift_choicer_stare", 0),
			Choice("Give 'em a compliment", "gift_choicer_compliment", 3),
			Choice("Take 'em out somewhere nice", "gift_choicer_date", 10),
		),
	],
	gift_choicer_stare: [
		Page(spk_johnny, "I'd stare at 'em. From 'cross the room. Real romance-like."),
	],
	gift_choicer_compliment: [
		Page(spk_johnny, "I'd give 'em a compliment. Something like..."),
		Page(spk_johnny, "Wow. You have eyes."),
	],
	gift_choicer_date: [
		Page(spk_johnny, "I'd take 'em somewhere nice. Y'know. Like the |V|salooooooooon./V/"),
	],
	
	scene: [
		CodePage(PortraitEnter, [oPortraitJohnny]),
		Page(spk_johnny, "Howdy. I'm a cowboy. Johnny Slick. They call me that on account of how SLICK I am."),
		CodePage(PortraitEnter, [oPortraitJane]),
		Page(spk_jane, "Oh Johnny. You're here. |V|I've heard of you./V/"),
		CodePage(PortraitFace, [oPortraitJane, RIGHT]),
		Page(spk_jane, "I've heard of you because of how |R|cool|W| you are."),
		CodePage(PortraitFace, [oPortraitJane, LEFT]),
		Page(spk_jane, "You're so cool."),
		CodePage(PortraitChange, [oPortraitJohnny, sPorJohnnyHandsUp]),
		CodePage(PortraitShake, [oPortraitJohnny]),
		Page(spk_johnny, "Woah there. Just because I'm cool doesn't mean you can just... |S|say it!/S/"),
		CodePage(PortraitChange, [oPortraitJane, sPorJaneHands]),
		CodePage(PortraitWiggle, [oPortraitJane]),
		Page(spk_jane, "Oh, I'm so sorry."),
		CodePage(PortraitMove, [oPortraitJohnny, 120]),
		CodePage(PortraitChange, [oPortraitJohnny, sPorJohnnyNeutral]),
		Page(spk_johnny, "But it's true. I am... |B|cool|W|."),
		CodePage(PortraitFace, [oPortraitJohnny, LEFT]),
		Page(spk_johnny, "|B|Cool|W| like the |R|summer breeze|W|."),
		CodePage(PortraitChange, [oPortraitJane, sPorJaneNeutral]),
		Page(spk_jane, "So cool, Johnny. The |R|cowboy.|W| Who rides a |Y|horse|W|."),
		CodePage(PortraitMove, [oPortraitJohnny, 200]),
		Page(spk_johnny, "......"),
		CodePage(PortraitMove, [oPortraitJohnny, 0]),
		Page(spk_johnny, "Yes."),
		CodePage(PortraitExit, [oPortraitJohnny]),
		CodePage(PortraitExit, [oPortraitJane]),
	],
}