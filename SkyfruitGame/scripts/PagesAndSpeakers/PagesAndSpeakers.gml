
#macro GIFT_TEXT_X_OFFSET 6
#macro GIFT_TEXT_Y_OFFSET -2

enum PAGE_TYPE {
	NORMAL,
	CHOICE,
	CODE,
	GOTO,
}

function Page(_speaker, _text) {
    return {
		speaker: _speaker,
		type: PAGE_TYPE.NORMAL,
        text: _text,
    }
}

function CodePage(_code, _args) {
    return {
		type: PAGE_TYPE.CODE,
		code: _code,
		args: _args,
    }
}


function ChoicePage() {
	var _choices = [];
	for (var i = 0; i < argument_count; i++) {
		_choices[i] = argument[i];
	}
	
	return {
		type: PAGE_TYPE.CHOICE,
		choices: _choices, // Array of Choice()s
	}
}

function Choice(_text, _next_key, _gift_req = 0) {
    return {
        text: _text,
        next_key: _next_key,
        gift_req: _gift_req,
    }
}


function Speaker(_name, _voice, _portrait) {
    return {
		name: _name,
		voice: _voice,
		portrait: _portrait,
    }
}

#macro spk_johnny "spkJohnny"
#macro spk_jane "spkJane"
#macro spk_none "spkNone"

global.spkNone = Speaker(NONE, NONE, NONE);
global.spkJohnny = Speaker("Johnny", vTest, oPortraitJohnny);
global.spkJane = Speaker("Jane", vTest, oPortraitJane);
