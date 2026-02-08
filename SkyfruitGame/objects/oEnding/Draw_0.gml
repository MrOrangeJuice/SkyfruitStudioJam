draw_text_border(
	SCREEN_W/2,
	SCREEN_H/2 - 15,
	"The end!"
)

if (t > 165) {
	draw_text_border(
		SCREEN_W/2,
		SCREEN_H/2 + 12,
		"Thank you for playing."
	)
}
if (t > 330) {
	draw_text_border(
		SCREEN_W/2,
		SCREEN_H/2 + 30,
		"Press ESC to return to the main menu."
	)
}