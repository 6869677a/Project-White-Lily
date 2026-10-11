-- w0rmerVNGine 2.0 story showcase.
-- Character definitions live here once. Scenes only change what needs to change.
--
-- Character image convention:
--   assets/characters/<id>_<expression>.png
-- Expressions: neutral, happy, worried, sad, angry, surprised, shocked.
--
-- Per-scene characterChanges are PATCHES. Unspecified properties persist.
-- Set visible=false to hide a character; visible=true brings them back.
-- Sprite properties: expression/mood, x=left|center|right|number, y,
-- offsetY, scale/size, mirror/flip, alpha, dim, rotation, z/layer, visible.
-- Legacy scene.sprites arrays remain supported for older stories.

return {
    startScene = "hallway",

    characterDefinitions = {
        maya = {
            character = "maya",
            expression = "neutral",
            x = "left",
            scale = 0.78,
            z = 10,
            visible = true
        },
        alex = {
            character = "alex",
            expression = "neutral",
            x = "right",
            scale = 0.78,
            mirror = true,
            z = 10,
            visible = true
        }
    },

    hallway = {
        type = "dialogue",
        background = "assets/backgrounds/hallway.png",
        music = "assets/music/tense.ogg",
        characterChanges = {
            maya = { expression = "worried" },
            alex = { expression = "neutral" }
        },
        speaker = "Maya",
        text = "Alex? You actually came. I was starting to think that message was a mistake.",
        next = "alex_arrives"
    },

    alex_arrives = {
        type = "dialogue",
        background = "assets/backgrounds/hallway.png",
        music = "assets/music/tense2.ogg",
        characterChanges = {
            maya = { expression = "worried" },
            alex = { expression = "happy", x = "right", mirror = true }
        },
        speaker = "Alex",
        text = "It wasn't a mistake. You said you found something in the old lab. That usually means trouble.",
        next = "the_signal"
    },

    the_signal = {
        type = "dialogue",
        background = "assets/backgrounds/hallway.png",
        characterChanges = {
            maya = { expression = "surprised" },
            alex = { expression = "neutral" }
        },
        speaker = "Maya",
        text = "The terminal powered on by itself. No network cable, no battery. Then it printed my name... and a timestamp for tomorrow.",
        next = "alex_skeptical"
    },

    alex_skeptical = {
        type = "dialogue",
        background = "assets/backgrounds/hallway.png",
        characterChanges = {
            maya = { expression = "worried" },
            alex = { expression = "worried", dim = false }
        },
        speaker = "Alex",
        text = "A timestamp isn't proof. Tell me exactly what it said. Don't skip anything.",
        next = "the_message"
    },

    the_message = {
        type = "dialogue",
        background = "assets/backgrounds/hallway.png",
        characterChanges = {
            maya = { expression = "shocked", alpha = 1 },
            alex = { expression = "neutral", dim = true }
        },
        speaker = "Maya",
        text = "It said: 'When the lights go out, do not open the door.' And then the whole building went dark.",
        next = "lights_out"
    },

    lights_out = {
        type = "dialogue",
        background = "assets/backgrounds/hallway.png",
        characterChanges = {
            maya = { expression = "worried", alpha = 0.92, dim = false },
            alex = { expression = "angry", dim = false, z = 20 }
        },
        speaker = "Alex",
        text = "Stay behind me. We have two options: check the lab, or get out while the emergency lights still work.",
        next = "decision"
    },

    decision = {
        type = "choice",
        background = "assets/backgrounds/hallway.png",
        characterChanges = {
            maya = { expression = "worried", x = "left", visible = true },
            alex = { expression = "neutral", x = "right", mirror = true, visible = true }
        },
        text = "What should Maya and Alex do?",
        choices = {
            { text = "Go back to the lab and inspect the terminal", next = "go_lab" },
            { text = "Head for the exit before the lights fail", next = "go_exit" }
        }
    },

    go_lab = {
        type = "dialogue",
        background = "assets/backgrounds/hallway.png",
        characterChanges = {
            maya = { expression = "surprised", x = 420, scale = 0.72, rotation = -0.02 },
            alex = { expression = "angry", x = 900, scale = 0.82, mirror = true }
        },
        speaker = "Maya",
        text = "The terminal is still running. There's a new line on the screen: 'Good. You chose to come back.'",
        next = "lab_reveal"
    },

    lab_reveal = {
        type = "dialogue",
        background = "assets/backgrounds/hallway.png",
        characterChanges = {
            maya = { expression = "shocked", rotation = 0 },
            alex = { expression = "shocked", dim = true }
        },
        speaker = "Alex",
        text = "That terminal has no input device. Maya... something is answering us in real time.",
        next = "lab_ending"
    },

    lab_ending = {
        type = "ending",
        background = "assets/backgrounds/hallway.png",
        characterChanges = {
            maya = { expression = "worried", dim = false, visible = true },
            alex = { expression = "shocked", dim = false, visible = true }
        },
        text = "ENDING: THE SIGNAL. The terminal prints one final line: 'Thank you for choosing to stay.'"
    },

    go_exit = {
        type = "dialogue",
        background = "assets/backgrounds/hallway.png",
        characterChanges = {
            maya = { expression = "worried", x = "left", alpha = 1 },
            alex = { expression = "happy", x = "right", mirror = true, dim = false }
        },
        speaker = "Maya",
        text = "The exit sign flickers ahead. For the first time tonight, the hallway seems to have an end.",
        next = "exit_reveal"
    },

    exit_reveal = {
        type = "dialogue",
        background = "assets/backgrounds/hallway.png",
        characterChanges = {
            maya = { expression = "sad" },
            alex = { expression = "surprised" }
        },
        speaker = "Alex",
        text = "The doors are locked. A final message glows on the access panel: 'Leaving was always part of the test.'",
        next = "exit_ending"
    },

    exit_ending = {
        type = "ending",
        background = "assets/backgrounds/hallway.png",
        characterChanges = {
            maya = { expression = "sad", dim = true },
            alex = { expression = "worried", dim = false }
        },
        text = "ENDING: NO EXIT. The hallway lights return. The exit sign now points behind them."
    }
}
