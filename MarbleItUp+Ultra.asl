// Autosplitter for Marble It Up! and Marble It Up! Ultra.
// Created by Ero from previous iterations by TalentedPlatinum and thearst3rd.

// Start and split settings available for all levels, including settings for custom levels.

state("Marble It Up") { }

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");

    var miu = new Dictionary<string, string[]>
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
                "Onward and Upward",
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
                "Thread the Needle",
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
                "Cog Valley",
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
                "Diamond in the Sky",
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
                "The Pit of Despair",
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
                "Stratosphere",
            }
        },
    };

    var miuu = new Dictionary<string, string[]>
    {
        { "Chapter 1: Get Moving", new[]
            {
                "Learning to Roll",
                "Learning to Turn",
                "Bunny Slope",
                "Learning to Jump",
                "Full Speed Ahead",
                "Treasure Trove",
                "Stay Frosty",
                "Round the Bend",
                "Leaf on the Wind",
            }
        },
        { "Chapter 2: The Subtle Joy of Rolling", new[]
            {
                "Duality",
                "Learning to Bounce",
                "Great Wall",
                "Carom",
                "Rush Hour",
                "Over the Garden Wall",
                "Into the Arctic",
                "Wave Pool",
                "Big Easy",
                "Transit",
                "Gravity Knot",
                "Stepping Stones",
            }
        },
        { "Chapter 3: Focus on Flow", new[]
            {
                "Speedball",
                "Mount Marblius",
                "Transmission",
                "Archipelago",
                "Sugar Rush",
                "Slalom",
                "Outskirts",
                "Off Kilter",
                "Icy Ascent",
                "Bad Company",
                "Totally Tubular",
                "Overclocked",
            }
        },
        { "Chapter 4: Kick It Up a Notch", new[]
            {
                "Tether",
                "Aqueduct",
                "Ricochet",
                "Braid",
                "Sun Spire",
                "Thunderdrome",
                "Hyperloop",
                "Gearing Up",
                "Acrophobia",
                "Rime",
                "Cog Valley",
                "Citadel",
            }
        },
        { "Chapter 5: Show Me What You Got", new[]
            {
                "Newton's Cradle",
                "Ex Machina",
                "Gearheart",
                "Kleinsche",
                "Dire Straits",
                "Diamond in the Sky",
                "Glacier",
                "Shift",
                "Conduit",
                "Flip the Table",
                "Energy",
                "Mobius Madness",
            }
        },
        { "Chapter 6: Play for Keeps", new[]
            {
                "Amethyst",
                "Rondure",
                "Isaac's Apple",
                "Penrose Pass",
                "Siege",
                "Flywheel",
                "Symbiosis",
                "Tesseract",
                "Leaps and Bounds",
                "Vertigo",
                "Tossed About",
                "Apogee",
            }
        },
        { "Bonus 1: Keep on Rolling", new[]
            {
                "Rosen Bridge",
                "Onward and Upward",
                "Permutation",
                "Elevator Action",
                "Time Capsule",
                "Triple Divide",
                "Four Stairs",
                "The Need for Speed",
                "River Vantage",
                "Gravity Cube",
                "Epoch",
                "Platinum Playground",
            }
        },
        { "Bonus 2: The Way of the Marble", new[]
            {
                "Ribbon",
                "Castle Chaos",
                "Thread the Needle",
                "Gordian",
                "Bumper Invasion",
                "Bash-tion",
                "Runout",
                "Archiarchy",
                "Crystalline Matrix",
                "Stayin' Alive",
                "Medieval Machinations",
                "The Pit of Despair",
            }
        },
        { "Bonus 3: Keep Your Cool", new[]
            {
                "Contraption",
                "Uphill Both Ways",
                "Retrograde Rally",
                "Warp Core",
                "Cross Traffic",
                "Prime",
                "Halfpipe Heaven",
                "Wanderlust",
                "Boomerang",
                "Kendama",
                "Cirrus",
                "Zenith",
            }
        },
        { "Bonus 4: Challenge Accepted", new[]
            {
                "All Downhill From Here",
                "Danger Zone",
                "Olympus",
                "Head in the Clouds",
                "Centripetal Force",
                "Slick Shtick",
                "Network",
                "Radius",
                "Escalation",
                "Torque",
                "Tangle",
                "Stratosphere",
            }
        },
    };

    settings.Add("miu", true, "Marble It Up!");
    foreach (var chapter in miu)
    {
        settings.Add("miu-" + chapter.Key, true, chapter.Key, "miu");
        foreach (var level in chapter.Value)
        {
            settings.Add("miu-" + level, true, level, "miu-" + chapter.Key);
                settings.Add("miu-" + level + "-start", true, "Start", "miu-" + level);
                settings.Add("miu-" + level + "-complete", true, "Split on completion", "miu-" + level);
        }
    }

    settings.Add("miuu", true, "Marble It Up! Ultra");
    foreach (var chapter in miuu)
    {
        settings.Add("miuu-" + chapter.Key, true, chapter.Key, "miuu");
        foreach (var level in chapter.Value)
        {
            settings.Add("miuu-" + level, true, level, "miuu-" + chapter.Key);
                settings.Add("miuu-" + level + "-start", true, "Start", "miuu-" + level);
                settings.Add("miuu-" + level + "-complete", true, "Split on completion", "miuu-" + level);
                settings.Add("miuu-" + level + "-treasure", true, "Split on Treasure Box collection", "miuu-" + level);
        }
    }

    settings.Add("misc", false, "Miscellaneous");
        settings.Add("start-other", false, "Start on unknown/custom levels", "misc");
        settings.Add("split-other-complete", false, "Split on unknown/custom level completion", "misc");
        settings.Add("split-other-treasure", false, "Split on unknown/custom level Treasure Box collection", "misc");

    vars.CompletedSplits = new HashSet<string>();

}

onStart
{
    vars.CompletedSplits.Clear();
}

init
{
    switch (game.MainWindowTitle)
    {
        case "":
            vars.Log("Game has no main window yet. Retrying.");
            return vars.Helper.Reject();
        case "MarbleItUp": version = "miu"; break;
        case "MarbleItUpUltra": version = "miuu"; break;
        default:
            throw new NotSupportedException("Game with title '" + game.MainWindowTitle + "' is not known.");
    }

    vars.Helper.TryLoad = (Func<dynamic, bool>)(mono =>
    {
        mono.Images.Clear();

        if (version == "miu")
        {
            vars.Helper["Level"] = mono.MakeString("LevelSelect", "instance", "level", "name");
            vars.Helper["Loading"] = mono.Make<bool>("LevelSelect", "loading");
            vars.Helper["Mode"] = mono.Make<int>("MarbleManager", "instance", "Player", "Mode");
        }
        else
        {
            vars.Helper["Level"] = mono.MakeString("LevelManager", "CurrentLevel", "name");
            vars.Helper["Loading"] = mono.Make<bool>("LevelSelect", "loading");
            vars.Helper["GotTrophy"] = mono.Make<bool>("GamePlayManager", "_Instance", "GotTrophy");
            vars.Helper["LevelState"] = mono.Make<int>("SpeedrunData", "levelState");
        }

        return true;
    });

    vars.CheckForSplit = (Func<string, bool>)(key => settings[key] && vars.CompletedSplits.Add(key));
}

start
{
    return !old.Loading && current.Loading
        && (settings[version + "-" + current.Level + "-start"] || settings["start-other"]);
}

split
{
    if (version == "miuu")
    {
        return old.LevelState != 1 && current.LevelState == 1
            && (vars.CheckForSplit(version + "-" + current.Level + "-complete") || settings["split-other-complete"])
            || !old.GotTrophy && current.GotTrophy
            && (vars.CheckForSplit(version + "-" + current.Level + "-treasure") || settings["split-other-treasure"]);
    }
    else
    {
        return old.Mode == 1 && current.Mode == 4
            && (vars.CheckForSplit(version + "-" + current.Level + "-complete") || settings["split-other-complete"]);
    }
}
