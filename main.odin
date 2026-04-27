package main

import "core:fmt"
import "core:strings"
import rl "vendor:raylib"

clipboard: string

main :: proc() {
	rl.SetTraceLogLevel(.WARNING)
	rl.InitWindow(300, 350, "tanspose")
	defer rl.CloseWindow()

	clipboard = string(rl.GetClipboardText())

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		defer rl.EndDrawing()
		rl.ClearBackground(rl.RAYWHITE)

		if rl.GuiButton({50, 50, 200, 50}, "Bb -> C") {
			Bb_to_C()
		}
		if rl.GuiButton({50, 150, 200, 50}, "C -> Bb") {
			C_to_Bb()
		}
		if rl.GuiButton({50, 250, 200, 50}, "Number -> lilypond") {
			Number_to_lilypond()
		}
	}
}

//升高2个半音
Bb_to_C :: proc() {
	clip := clipboard
	clip, _ = strings.replace_all(clip, "#1", "#d ")
	clip, _ = strings.replace_all(clip, "#2", "f ")
	clip, _ = strings.replace_all(clip, "#3", "g ")
	clip, _ = strings.replace_all(clip, "#4", "#g ")
	clip, _ = strings.replace_all(clip, "#5", "#a ")
	clip, _ = strings.replace_all(clip, "#6", "c\' ")
	clip, _ = strings.replace_all(clip, "#7", "d\' ")

	clip, _ = strings.replace_all(clip, "b1", "#c ")
	clip, _ = strings.replace_all(clip, "b2", "#d ")
	clip, _ = strings.replace_all(clip, "b3", "f ")
	clip, _ = strings.replace_all(clip, "b4", "#f ")
	clip, _ = strings.replace_all(clip, "b5", "#g ")
	clip, _ = strings.replace_all(clip, "b6", "#a ")
	clip, _ = strings.replace_all(clip, "b7", "c\' ")

	clip, _ = strings.replace_all(clip, "1", "d ")
	clip, _ = strings.replace_all(clip, "2", "e ")
	clip, _ = strings.replace_all(clip, "3", "#f ")
	clip, _ = strings.replace_all(clip, "4", "g ")
	clip, _ = strings.replace_all(clip, "5", "a ")
	clip, _ = strings.replace_all(clip, "6", "b ")
	clip, _ = strings.replace_all(clip, "7", "#c\' ")

	clip, _ = strings.replace_all(clip, "c", "1")
	clip, _ = strings.replace_all(clip, "d", "2")
	clip, _ = strings.replace_all(clip, "e", "3")
	clip, _ = strings.replace_all(clip, "f", "4")
	clip, _ = strings.replace_all(clip, "g", "5")
	clip, _ = strings.replace_all(clip, "a", "6")
	clip, _ = strings.replace_all(clip, "b", "7")

	fmt.println(clip)
	rl.SetClipboardText(strings.clone_to_cstring(clip))
}

//降低2个半音
C_to_Bb :: proc() {}

Number_to_lilypond :: proc() {}

