// Originally created by TalentedPlatinum.
// Website: https://github.com/TalentedPlatinum/AutoSplitters.

state("Marble It Up") {}

startup
{
	vars.Log = (Action<object>)(output => print("[Marble It UP!] " + output));

	var chapters = new Dictionary<string, string[]>
	{
		{ "Chapter 1: Master the Basics", new[]
			{
				"Learning To Roll",
				"Learning To Turn",
				"Learning To Jump",
				"Precious Gems",
				"Up the Wall",
				"Super Jump",
				"Full Speed Ahead",
				"Stay Frosty",
				"Onward and Upward"
			}
		},
		{ "Chapter 2: The Subtle Joy of Rolling", new[]
			{
				"Duality",
				"Transit",
				"Great Wall",
				"Bump in the Night",
				"Over the Garden Wall",
				"Wave Pool",
				"Big Easy",
				"Archipelago",
				"Triple Divide",
				"Thread the Needle"
			}
		},
		{ "Chapter 3: Beat the Clock", new[]
			{
				"Sugar Rush",
				"Elevator Action",
				"Speedball",
				"Icy Ascent",
				"River Vantage",
				"Off Kilter",
				"Four Stairs",
				"Totally Tubular",
				"Time Capsule",
				"Cog Valley"
			}
		},
		{ "Chapter 4: Kick It Up a Notch", new[]
			{
				"Bumper Invasion",
				"Braid",
				"Sun Spire",
				"Epoch",
				"Retrograde Rally",
				"Gearheart",
				"Acrophobia",
				"Dire Straits",
				"Ex Machina",
				"Diamond in the Sky"
			}
		},
		{ "Chapter 5: Show Me What You Got", new[]
			{
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
				"The Pit of Despair"
			}
		},
		{ "Chapter 6: Play for Keeps", new[]
			{
				"Danger Zone",
				"Platinum Playground",
				"Radius",
				"Head in the Clouds",
				"Centripetal Force",
				"Escalation",
				"Confluence",
				"Olympus",
				"Tangle",
				"Stratosphere"
			}
		}
	};

	foreach (var chapter in chapters)
	{
		settings.Add(chapter.Key);
		foreach (var level in chapter.Value)
			settings.Add(level, true, level, chapter.Key);
	}

	using (var prov = new Microsoft.CSharp.CSharpCodeProvider())
	{
		var param = new System.CodeDom.Compiler.CompilerParameters
		{
			GenerateInMemory = true,
			ReferencedAssemblies = { "LiveSplit.Core.dll", "System.dll", "System.Core.dll", "System.Xml.dll", "System.Xml.Linq.dll" }
		};

		string mono = File.ReadAllText(@"Components\mono.cs"), helpers = File.ReadAllText(@"Components\mono_helpers.cs");
		var asm = prov.CompileAssemblyFromSource(param, mono, helpers);
		vars.Unity = Activator.CreateInstance(asm.CompiledAssembly.GetType("Unity.Game"));
	}
}

// onStart
// {
// 	vars.TotalTime = 0f;
// }

init
{
	// vars.TotalTime = 0f;

	vars.Unity.TryOnLoad = (Func<dynamic, bool>)(helper =>
	{
		var str = helper.GetClass("mscorlib", "String");

		// var cs = helper.GetClass("Assembly-CSharp", "ChapterSelect");
		// var miuChap = helper.GetClass("Assembly-CSharp", "MIU.MarbleChapter");

		var ls = helper.GetClass("Assembly-CSharp", "LevelSelect");
		var miuLvl = helper.GetClass("Assembly-CSharp", "MIU.MarbleLevel");

		var mm = helper.GetClass("Assembly-CSharp", "MarbleManager");
		var mc = helper.GetClass("Assembly-CSharp", "MarbleController");

		// vars.Unity.MakeString(128, cs.Static, cs["instance"], cs["chapter"], miuChap["name"], str["m_FirstChar"]).Name = "chapter";
		vars.Unity.MakeString(128, ls.Static, ls["instance"], ls["level"], miuLvl["name"], str["m_firstChar"]).Name = "level";
		vars.Unity.Make<bool>(ls.Static, ls["loading"]).Name = "loading";
		vars.Unity.Make<int>(mm.Static, mm["instance"], mm["Player"], mc["Mode"]).Name = "mode";
		// vars.Unity.Make<float>(mm.Static, mm["instance"], mm["Player"], mc["ElapsedTime"]).Name = "time";

		return true;
	});

	vars.Unity.Load(game);
}

update
{
	if (!vars.Unity.Loaded) return false;

	vars.Unity.Watchers.UpdateAll(game);

	// current.Chapter = vars.Unity.Watchers["chapter"].Current;
	current.Level = vars.Unity.Watchers["level"].Current;
	current.Loading = vars.Unity.Watchers["loading"].Current;
	current.Mode = vars.Unity.Watchers["mode"].Current;
	// current.Time = vars.Unity.Watchers["time"].Current;
}

start
{
	return current.Level == "Learning To Roll" && !old.Loading && current.Loading;
}

split
{
	return old.Mode == 1 && current.Mode == 4 && settings[current.Level];
}

reset
{
	return current.Level == "Learning To Roll" && !old.Loading && current.Loading;
}

// gameTime
// {
// 	if (old.Time > current.Time)
// 		vars.TotalTime += old.Time;

// 	return TimeSpan.FromSeconds(vars.TotalTime + current.Time);
// }

// isLoading
// {
// 	return true;
// }

exit
{
	vars.Unity.Reset();
}

shutdown
{
	vars.Unity.Reset();
}
