package main

import "core:fmt"
import "core:strings"
import rl "vendor:raylib"

clipboard: string

main :: proc() {
	rl.SetTraceLogLevel(.WARNING)
	rl.InitWindow(300, 250, "tanspose")
	defer rl.CloseWindow()

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		defer rl.EndDrawing()
		rl.ClearBackground(rl.RAYWHITE)

		if rl.GuiButton({50, 50, 95, 50}, "Bb -> C (#)") {
			clipboard = string(rl.GetClipboardText())
			Bb_to_C_sharp()
		}
		if rl.GuiButton({155, 50, 95, 50}, "Bb -> C (b)") {
			clipboard = string(rl.GetClipboardText())
			Bb_to_C_flat()
		}
		if rl.GuiButton({50, 150, 95, 50}, "C -> Bb (#)") {
			clipboard = string(rl.GetClipboardText())
			C_to_Bb_sharp()
		}
		if rl.GuiButton({155, 150, 95, 50}, "C -> Bb (b)") {
			clipboard = string(rl.GetClipboardText())
			C_to_Bb_flat()
		}
	}
}

//升高2个半音
Bb_to_C_sharp :: proc() {
	clip := clipboard

	clip, _ = strings.replace_all(clip, "#1", "{b}, ")
	clip, _ = strings.replace_all(clip, "#2", "{#c} ")
	clip, _ = strings.replace_all(clip, "#3", "{#d} ")
	clip, _ = strings.replace_all(clip, "#4", "{e} ")
	clip, _ = strings.replace_all(clip, "#5", "{#f} ")
	clip, _ = strings.replace_all(clip, "#6", "{#g} ")
	clip, _ = strings.replace_all(clip, "#7", "{#a} ")

	clip, _ = strings.replace_all(clip, "b1", "{a}, ")
	clip, _ = strings.replace_all(clip, "b2", "{b}, ")
	clip, _ = strings.replace_all(clip, "b3", "{#c} ")
	clip, _ = strings.replace_all(clip, "b4", "{d} ")
	clip, _ = strings.replace_all(clip, "b5", "{e} ")
	clip, _ = strings.replace_all(clip, "b6", "{#f} ")
	clip, _ = strings.replace_all(clip, "b7", "{#g} ")

	clip, _ = strings.replace_all(clip, "1", "{#a}, ")
	clip, _ = strings.replace_all(clip, "2", "{c} ")
	clip, _ = strings.replace_all(clip, "3", "{d} ")
	clip, _ = strings.replace_all(clip, "4", "{#d} ")
	clip, _ = strings.replace_all(clip, "5", "{f} ")
	clip, _ = strings.replace_all(clip, "6", "{g} ")
	clip, _ = strings.replace_all(clip, "7", "{a} ")

	clip, _ = strings.replace_all(clip, "{c}", "1")
	clip, _ = strings.replace_all(clip, "{d}", "2")
	clip, _ = strings.replace_all(clip, "{e}", "3")
	clip, _ = strings.replace_all(clip, "{f}", "4")
	clip, _ = strings.replace_all(clip, "{g}", "5")
	clip, _ = strings.replace_all(clip, "{a}", "6")
	clip, _ = strings.replace_all(clip, "{b}", "7")

	clip, _ = strings.replace_all(clip, "{#c}", "#1")
	clip, _ = strings.replace_all(clip, "{#d}", "#2")
	clip, _ = strings.replace_all(clip, "{#e}", "4")
	clip, _ = strings.replace_all(clip, "{#f}", "#4")
	clip, _ = strings.replace_all(clip, "{#g}", "#5")
	clip, _ = strings.replace_all(clip, "{#a}", "#6")
	clip, _ = strings.replace_all(clip, "{#b}", "1")

	clip, _ = strings.replace_all(clip, ", \'", "")
	clip, _ = strings.replace_all(clip, "\' ,", "")

	fmt.println(clip)
	rl.SetClipboardText(strings.clone_to_cstring(clip))
}

Bb_to_C_flat :: proc() {
	clip := clipboard

	clip, _ = strings.replace_all(clip, "#1", "{b}, ")
	clip, _ = strings.replace_all(clip, "#2", "{#c} ")
	clip, _ = strings.replace_all(clip, "#3", "{#d} ")
	clip, _ = strings.replace_all(clip, "#4", "{e} ")
	clip, _ = strings.replace_all(clip, "#5", "{#f} ")
	clip, _ = strings.replace_all(clip, "#6", "{#g} ")
	clip, _ = strings.replace_all(clip, "#7", "{#a} ")

	clip, _ = strings.replace_all(clip, "b1", "{a}, ")
	clip, _ = strings.replace_all(clip, "b2", "{b}, ")
	clip, _ = strings.replace_all(clip, "b3", "{#c} ")
	clip, _ = strings.replace_all(clip, "b4", "{d} ")
	clip, _ = strings.replace_all(clip, "b5", "{e} ")
	clip, _ = strings.replace_all(clip, "b6", "{#f} ")
	clip, _ = strings.replace_all(clip, "b7", "{#g} ")

	clip, _ = strings.replace_all(clip, "1", "{#a}, ")
	clip, _ = strings.replace_all(clip, "2", "{c} ")
	clip, _ = strings.replace_all(clip, "3", "{d} ")
	clip, _ = strings.replace_all(clip, "4", "{#d} ")
	clip, _ = strings.replace_all(clip, "5", "{f} ")
	clip, _ = strings.replace_all(clip, "6", "{g} ")
	clip, _ = strings.replace_all(clip, "7", "{a} ")

	clip, _ = strings.replace_all(clip, "{c}", "1")
	clip, _ = strings.replace_all(clip, "{d}", "2")
	clip, _ = strings.replace_all(clip, "{e}", "3")
	clip, _ = strings.replace_all(clip, "{f}", "4")
	clip, _ = strings.replace_all(clip, "{g}", "5")
	clip, _ = strings.replace_all(clip, "{a}", "6")
	clip, _ = strings.replace_all(clip, "{b}", "7")

	clip, _ = strings.replace_all(clip, "{#c}", "b2")
	clip, _ = strings.replace_all(clip, "{#d}", "b3")
	clip, _ = strings.replace_all(clip, "{#e}", "4")
	clip, _ = strings.replace_all(clip, "{#f}", "b5")
	clip, _ = strings.replace_all(clip, "{#g}", "b6")
	clip, _ = strings.replace_all(clip, "{#a}", "b7")
	clip, _ = strings.replace_all(clip, "{#b}", "1")

	fmt.println(clip)
	rl.SetClipboardText(strings.clone_to_cstring(clip))
}

//降低2个半音
C_to_Bb_sharp :: proc() {
	clip := clipboard

	clip, _ = strings.replace_all(clip, "#1", "{#d} ")
	clip, _ = strings.replace_all(clip, "#2", "{f} ")
	clip, _ = strings.replace_all(clip, "#3", "{g} ")
	clip, _ = strings.replace_all(clip, "#4", "{#g} ")
	clip, _ = strings.replace_all(clip, "#5", "{#a} ")
	clip, _ = strings.replace_all(clip, "#6", "{c}\' ")
	clip, _ = strings.replace_all(clip, "#7", "{d}\' ")

	clip, _ = strings.replace_all(clip, "b1", "{#c} ")
	clip, _ = strings.replace_all(clip, "b2", "{#d} ")
	clip, _ = strings.replace_all(clip, "b3", "{f} ")
	clip, _ = strings.replace_all(clip, "b4", "{#f} ")
	clip, _ = strings.replace_all(clip, "b5", "{#g} ")
	clip, _ = strings.replace_all(clip, "b6", "{#a} ")
	clip, _ = strings.replace_all(clip, "b7", "{c}\' ")

	clip, _ = strings.replace_all(clip, "1", "{d} ")
	clip, _ = strings.replace_all(clip, "2", "{e} ")
	clip, _ = strings.replace_all(clip, "3", "{#f} ")
	clip, _ = strings.replace_all(clip, "4", "{g} ")
	clip, _ = strings.replace_all(clip, "5", "{a} ")
	clip, _ = strings.replace_all(clip, "6", "{b} ")
	clip, _ = strings.replace_all(clip, "7", "{#c}\' ")

	clip, _ = strings.replace_all(clip, "{c}", "1")
	clip, _ = strings.replace_all(clip, "{d}", "2")
	clip, _ = strings.replace_all(clip, "{e}", "3")
	clip, _ = strings.replace_all(clip, "{f}", "4")
	clip, _ = strings.replace_all(clip, "{g}", "5")
	clip, _ = strings.replace_all(clip, "{a}", "6")
	clip, _ = strings.replace_all(clip, "{b}", "7")

	clip, _ = strings.replace_all(clip, "{#c}", "#1")
	clip, _ = strings.replace_all(clip, "{#d}", "#2")
	clip, _ = strings.replace_all(clip, "{#e}", "4")
	clip, _ = strings.replace_all(clip, "{#f}", "#4")
	clip, _ = strings.replace_all(clip, "{#g}", "#5")
	clip, _ = strings.replace_all(clip, "{#a}", "#6")
	clip, _ = strings.replace_all(clip, "{#b}", "1")

	clip, _ = strings.replace_all(clip, ", \'", "")
	clip, _ = strings.replace_all(clip, "\' ,", "")
	clip, _ = strings.replace_all(clip, ", , \' \'", "")
	clip, _ = strings.replace_all(clip, "\' \' , ,", "")

	fmt.println(clip)
	rl.SetClipboardText(strings.clone_to_cstring(clip))
}
C_to_Bb_flat :: proc() {
	clip := clipboard

	clip, _ = strings.replace_all(clip, "#1", "{#d} ")
	clip, _ = strings.replace_all(clip, "#2", "{f} ")
	clip, _ = strings.replace_all(clip, "#3", "{g} ")
	clip, _ = strings.replace_all(clip, "#4", "{#g} ")
	clip, _ = strings.replace_all(clip, "#5", "{#a} ")
	clip, _ = strings.replace_all(clip, "#6", "{c}\' ")
	clip, _ = strings.replace_all(clip, "#7", "{d}\' ")

	clip, _ = strings.replace_all(clip, "b1", "{#c} ")
	clip, _ = strings.replace_all(clip, "b2", "{#d} ")
	clip, _ = strings.replace_all(clip, "b3", "{f} ")
	clip, _ = strings.replace_all(clip, "b4", "{#f} ")
	clip, _ = strings.replace_all(clip, "b5", "{#g} ")
	clip, _ = strings.replace_all(clip, "b6", "{#a} ")
	clip, _ = strings.replace_all(clip, "b7", "{c}\' ")

	clip, _ = strings.replace_all(clip, "1", "{d} ")
	clip, _ = strings.replace_all(clip, "2", "{e} ")
	clip, _ = strings.replace_all(clip, "3", "{#f} ")
	clip, _ = strings.replace_all(clip, "4", "{g} ")
	clip, _ = strings.replace_all(clip, "5", "{a} ")
	clip, _ = strings.replace_all(clip, "6", "{b} ")
	clip, _ = strings.replace_all(clip, "7", "{#c}\' ")

	clip, _ = strings.replace_all(clip, "{c}", "1")
	clip, _ = strings.replace_all(clip, "{d}", "2")
	clip, _ = strings.replace_all(clip, "{e}", "3")
	clip, _ = strings.replace_all(clip, "{f}", "4")
	clip, _ = strings.replace_all(clip, "{g}", "5")
	clip, _ = strings.replace_all(clip, "{a}", "6")
	clip, _ = strings.replace_all(clip, "{b}", "7")

	clip, _ = strings.replace_all(clip, "{#c}", "b2")
	clip, _ = strings.replace_all(clip, "{#d}", "b3")
	clip, _ = strings.replace_all(clip, "{#e}", "4")
	clip, _ = strings.replace_all(clip, "{#f}", "b5")
	clip, _ = strings.replace_all(clip, "{#g}", "b6")
	clip, _ = strings.replace_all(clip, "{#a}", "b7")
	clip, _ = strings.replace_all(clip, "{#b}", "1")

	fmt.println(clip)
	rl.SetClipboardText(strings.clone_to_cstring(clip))
}

