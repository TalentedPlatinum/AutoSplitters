state("Marble It Up") {
	string128 chapterName : "mono-2.0-bdwgc.dll", 0x491DC8, 0x10, 0xB40, 0x28, 0x10, 0x14;
	string128 levelName   : "mono-2.0-bdwgc.dll", 0x491DC8, 0x10, 0xB40, 0x30, 0x10, 0x14;
	int mode              : "mono-2.0-bdwgc.dll", 0x491DC8, 0x10, 0xC30, 0x48, 0x2B0;
}

startup {
	var chapterDictionary = new Dictionary<string, string[]> {
		{ "Chapter 1: Master the Basics", new string[] {
			"Learning To Roll",
			"Learning To Turn",
			"Learning To Jump",
			"Precious Gems",
			"Up the Wall",
			"Super Jump",
			"Full Speed Ahead",
			"Stay Frosty",
			"Onward and Upward" }
		},
		{ "Chapter 2: The Subtle Joy of Rolling", new string[] {
			"Duality",
			"Transit",
			"Great Wall",
			"Bump in the Night",
			"Over the Garden Wall",
			"Wave Pool",
			"Big Easy",
			"Archipelago",
			"Triple Divide",
			"Thread the Needle" }
		},
		{ "Chapter 3: Beat the Clock", new string[] {
			"Sugar Rush",
			"Elevator Action",
			"Speedball",
			"Icy Ascent",
			"River Vantage",
			"Off Kilter",
			"Four Stairs",
			"Totally Tubular",
			"Time Capsule",
			"Cog Valley" }
		},
		{ "Chapter 4: Kick It Up a Notch", new string[] {
			"Bumpter Invasion",
			"Braid",
			"Sun Spire",
			"Epoch",
			"Retrograde Rally",
			"Gearheart",
			"Acrophobia",
			"Dire Straits",
			"Ex Machina",
			"Diamond in the Sky" }
		},
		{ "Chapter 5: Show Me What You Got", new string[] {
			"Newton's Cradle",
			"Archiarchy",
			"Stayin' Alive",
			"Gordian",
			"Crystalline Matrix",
			"Contraption",
			"Uphill Both Ways",
			"Flip the Table",
			"Vertigo",
			"Warp Core",
			"The Pit of Despair" }
		},
		{ "Chapter 6: Play for Keeps", new string[] {
			"Danger Zone",
			"Platinum Playground",
			"Radius",
			"Head in the Clouds",
			"Centripetal Force",
			"Escalation",
			"Confluence",
			"Olympus",
			"Tangle",
			"Stratosphere" }
		}
	};

	foreach (string chapter in chapterDictionary.Keys) {
		settings.Add(chapter);
		foreach (string level in chapterDictionary[chapter]) {
			settings.Add(level, true, level, chapter);
		}
	}

}

split {
	return old.mode == 1 && current.mode == 4 && settings[current.chapterName] && settings[current.levelName];
}