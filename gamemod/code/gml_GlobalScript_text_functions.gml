function rot_stick()
{
    if (!var_exists("_stick"))
    {
        _stick = 0;
    }
    _stick += 1;
    ret = butt("left");
    if (_stick < 135)
    {
        ret = butt("down");
    }
    if (_stick < 90)
    {
        ret = butt("right");
    }
    if (_stick < 45)
    {
        ret = butt("up");
    }
    if (_stick > 180)
    {
        _stick = 0;
    }
    return ret;
}

function get_area_name(arg0 = global.area)
{
    switch (arg0)
    {
        case 0:
            return "Frigate Orpheon";
            break;
        case 1:
            return "Tallon Overworld";
            break;
        case 2:
            return "Chozo Ruins";
            break;
        case 3:
            return "Magmoor Caverns";
            break;
        case 4:
            return "Phendrana Drifts";
            break;
        case 5:
            return "Phazon Mines";
            break;
        case 6:
            return "Impact Crater";
            break;
    }
}

function item_descriptions(arg0)
{
    if (dz("Classic Mode"))
    {
        if (arg0 == "Energy Tank")
        {
            return txt("Increases maximum energy capacity by 100.");
        }
        if (arg0 == "Artifact 1")
        {
            return txt("This is the First of Twelve Chozo Artifacts.");
        }
        if (arg0 == "Artifact 2")
        {
            return txt("This is the Second of Twelve Chozo Artifacts.");
        }
        if (arg0 == "Artifact 3")
        {
            return txt("This is the Third of Twelve Chozo Artifacts.");
        }
        if (arg0 == "Artifact 4")
        {
            return txt("This is the Fourth of Twelve Chozo Artifacts.");
        }
        if (arg0 == "Artifact 5")
        {
            return txt("This is the Fifth of Twelve Chozo Artifacts.");
        }
        if (arg0 == "Artifact 6")
        {
            return txt("This is the Sixth of Twelve Chozo Artifacts.");
        }
        if (arg0 == "Artifact 7")
        {
            return txt("This is the Seventh of Twelve Chozo Artifacts.");
        }
        if (arg0 == "Artifact 8")
        {
            return txt("This is the Eighth of Twelve Chozo Artifacts.");
        }
        if (arg0 == "Artifact 9")
        {
            return txt("This is the Ninth of Twelve Chozo Artifacts.");
        }
        if (arg0 == "Artifact 10")
        {
            return txt("This is the Tenth of Twelve Chozo Artifacts.");
        }
        if (arg0 == "Artifact 11")
        {
            return txt("This is the Eleventh of Twelve Chozo Artifacts.");
        }
        if (arg0 == "Artifact 12")
        {
            return txt("This is the Final of Twelve Chozo Artifacts.");
        }
    }
    else
    {
        if (arg0 == "Energy Tank")
        {
            return txt("Increases maximum energy capacity by 100. Collect more to use additional Aeon Powers at once.");
        }
        if (arg0 == "Artifact 1")
        {
            return txt("Aeon Powers Collected:\nAuto-Logger, Debris Scope, Velocity Beam, & Aqua-Recovery.");
        }
        if (arg0 == "Artifact 2")
        {
            return txt("Aeon Powers Collected:\nOffensive Boost, Seeker Beam, Seeker Missile, & Maximum Power.");
        }
        if (arg0 == "Artifact 3")
        {
            return txt("Aeon Powers Collected:\nChain Missile, Boost-Sprint, Swift Boots, & Speed-Ball.");
        }
        if (arg0 == "Artifact 4")
        {
            return txt("Aeon Powers Collected:\nBlazing Spider, Proximity Beam, Quick Bombs, & Flare Ball.");
        }
        if (arg0 == "Artifact 5")
        {
            return txt("Aeon Powers Collected:\nReinforced Suit, Energy Generator, Missile Generator, & Power Bomb Generator.");
        }
        if (arg0 == "Artifact 6")
        {
            return txt("Aeon Powers Collected:\nGatling Beam, Blaze Missile, Frost Missile, & Shock Missile.");
        }
        if (arg0 == "Artifact 7")
        {
            return txt("Aeon Powers Collected:\nStatic Power Bomb, Flare Power Bomb, Frost Power Bomb, & Hefty Beam.");
        }
        if (arg0 == "Artifact 8")
        {
            return txt("Aeon Powers Collected:\nBountiful Pickups, Static Bomb, Flare Bomb, & Frost Bomb.");
        }
        if (arg0 == "Artifact 9")
        {
            return txt("Aeon Powers Collected:\nChip Bomb, Charge Module, Mine Bomb, & Side-Dash.");
        }
        if (arg0 == "Artifact 10")
        {
            return txt("Aeon Powers Collected:\nDamage Discharge, Boost Extender, Boost Charger, & Pickup-Poison.");
        }
        if (arg0 == "Artifact 11")
        {
            return txt("Aeon Powers Collected:\nCleeted Boots, Screw Inferno, Screw Shock, & Screw Blizzard.");
        }
        if (arg0 == "Artifact 12")
        {
            return txt("Aeon Powers Collected:\nDeath Ball, Phazon Shield, Phazon Generator, & Ricochet Cannon.");
        }
    }
    if (arg0 == "Boost Ball")
    {
        return txt("Hold ") + butt("freeaim") + txt(" in Morph Ball form to charge the Boost Ball. Once charged, release ") + butt("freeaim") + txt(" to boost forward at high speeds and launch from curved slopes. A glowing boost will break [spr_tutorial_block_0].");
    }
    if (!global.retro_mode)
    {
        if (arg0 == "Charge Beam")
        {
            return txt("Hold ") + butt("shoot") + txt(" to charge the current beam. Once charged, release ") + butt("shoot") + txt(" to shoot a powerful beam that has enhanced destructive potential.");
        }
    }
    else if (arg0 == "Charge Beam" || arg0 == "Long Beam")
    {
        return txt("Allows all beam weapons to travel greater distances.");
    }
    if (arg0 == "Incinerator")
    {
        return txt("An upgrade for the Plasma Beam. Superheated plasma slowly rips through enemies and causes more severe burns. Cosine-Plasma particles will be released.");
    }
    if (arg0 == "Grapple Beam")
    {
        return txt("Hold ") + butt("grapple") + txt(" to cling to ceilings, walls, and floors. Let go of ") + butt("grapple") + txt(" to release the Grapple Beam & perform a short somersault.");
    }
    if (arg0 == "Gravity Suit")
    {
        return txt("Allows full movement capacity when submerged in water and other liquids.");
    }
    if (arg0 == "Ice Beam")
    {
        return txt("Fires a frigid beam that can freeze enemies and douse [spr_tutorial_block_3]. Press ") + butt("beam_2") + txt(" to activate. Press ") + butt("shoot") + txt(" to fire.");
    }
    if (arg0 == "Power Beam")
    {
        return txt("Basic beam weapon that can be fired quickly. Press ") + butt("beam_0") + txt(" to activate. Press ") + butt("shoot") + txt(" to fire.");
    }
    if (arg0 == "Ice Spreader")
    {
        return txt("An upgrade for the Ice Beam. Freezing particles are released upon impact. Ice-cold shots spread out when traveling.");
    }
    if (arg0 == "Morph Ball")
    {
        return txt("Press ") + butt("ball") + txt(" to transform into a ball that fits in narrow spaces. Press ") + butt("ball") + txt(" again to return to normal form.");
    }
    if (arg0 == "Power Suit")
    {
        return txt("Your basic Power Suit. Provides basic protection from hazards and utilizes a life-support system.");
    }
    if (arg0 == "Phazon Suit")
    {
        return txt("Eliminates all damage from Phazon. Contact with Phazon will charge the Phazon Beam. Hold ") + butt("shoot") + txt(" to release the charged Phazon, which can break [spr_tutorial_block_6].");
    }
    if (arg0 == "Plasma Beam")
    {
        return txt("Fires a superheated beam that can burn enemies and melt [spr_tutorial_block_4]. Press ") + butt("beam_3") + txt(" to activate. Press ") + butt("shoot") + txt(" to fire.");
    }
    if (arg0 == "Screw Attack")
    {
        return txt("Radiates deadly energy when somersaulting. Somersault with " + butt("right") + "+" + butt("jump") + " or " + butt("left") + "+" + butt("jump") + " to inflict massive damage to enemies. Can destroy [spr_tutorial_block_8].");
    }
    if (arg0 == "Space Jump Boots")
    {
        return txt("Press ") + butt("jump") + txt(" in midair to perform a second jump. Automatically somersaults.");
    }
    if (arg0 == "Spazer")
    {
        return txt("An upgrade for the Power Beam. Increased number of projectiles covers a wider range.");
    }
    if (arg0 == "Spider Ball")
    {
        return txt("Hold ") + butt("aimlock") + txt(" in Morph Ball form to climb on walls.");
    }
    if (arg0 == "Super Missile")
    {
        return txt("Replaces the Missile Launcher. Missiles can now destroy [spr_tutorial_block_9]. Use Super Missiles with " + butt("missile") + ".\nHold " + butt("shoot") + txt(" and press ") + butt("missile") + txt(" once the beam is charged to unleash a powerful close-range strike."));
    }
    if (arg0 == "Varia Suit")
    {
        return txt("Allows harm-free travel in extreme heat and weak acids.");
    }
    if (arg0 == "Wave Beam")
    {
        return txt("Fires an energy beam that can shock enemies, travel through solids, and restore power to [spr_tutorial_block_2]. Press ") + butt("beam_1") + txt(" to activate. Press ") + butt("shoot") + txt(" to fire.");
    }
    if (arg0 == "Wavebuster")
    {
        return txt("An upgrade for the Wave Beam. Enhanced projectiles increase duration of enemy shock. Central projectile increases accuracy of beam weapon.");
    }
    if (arg0 == "Morph Ball Bomb")
    {
        return txt("Press ") + butt("shoot") + txt(" in Morph Ball form to plant a Morph Ball Bomb which can destroy [spr_tutorial_block_1]. Jump-Ball ability recovered.");
    }
    if (arg0 == "Missile")
    {
        return txt("Maximum missile capacity increased by 5.");
    }
    if (arg0 == "Missile Launcher")
    {
        return txt("Press ") + butt("missile") + txt(" to use the Missile Launcher. Missiles can open [spr_tutorial_door] and break [spr_tutorial_block_5].");
    }
    if (arg0 == "Power Bomb")
    {
        return txt("Maximum Power Bomb capacity increased by 2.");
    }
    if (arg0 == "Power Bomb Detonator")
    {
        return txt("Press ") + butt("missile") + txt(" in Morph Ball form to detonate. Power Bombs will break [spr_tutorial_block_7].");
    }
    return "Null";
}

function artifact_names(arg0)
{
    if (arg0 == 0)
    {
        return "Artifact of Truth";
    }
    if (arg0 == 1)
    {
        return "Artifact of Strength";
    }
    if (arg0 == 2)
    {
        return "Artifact of Elder";
    }
    if (arg0 == 3)
    {
        return "Artifact of Wild";
    }
    if (arg0 == 4)
    {
        return "Artifact of Lifegiver";
    }
    if (arg0 == 6)
    {
        return "Artifact of Chozo";
    }
    if (arg0 == 5)
    {
        return "Artifact of Warrior";
    }
    if (arg0 == 7)
    {
        return "Artifact of Nature";
    }
    if (arg0 == 8)
    {
        return "Artifact of Sun";
    }
    if (arg0 == 9)
    {
        return "Artifact of World";
    }
    if (arg0 == 10)
    {
        return "Artifact of Spirit";
    }
    if (arg0 == 11)
    {
        return "Artifact of Newborn";
    }
    return "Null";
}

function artifact_names_short(arg0)
{
    if (arg0 == 0)
    {
        return "Truth";
    }
    if (arg0 == 1)
    {
        return "Strength";
    }
    if (arg0 == 2)
    {
        return "Elder";
    }
    if (arg0 == 3)
    {
        return "Wild";
    }
    if (arg0 == 4)
    {
        return "Lifegiver";
    }
    if (arg0 == 6)
    {
        return "Chozo";
    }
    if (arg0 == 5)
    {
        return "Warrior";
    }
    if (arg0 == 7)
    {
        return "Nature";
    }
    if (arg0 == 8)
    {
        return "Sun";
    }
    if (arg0 == 9)
    {
        return "World";
    }
    if (arg0 == 10)
    {
        return "Spirit";
    }
    if (arg0 == 11)
    {
        return "Newborn";
    }
    return "Null";
}

function artifact_hints(arg0)
{
    if (arg0 == 0)
    {
        return "The Artifact of Truth awaits those who truly seek it.";
    }
    if (arg0 == 1)
    {
        return "The heat of Magmoor was a test for many warriors. A [NES_Cyan]Shrine[NES_Peach] in their honor holds the Artifact of Strength.";
    }
    if (arg0 == 2)
    {
        return "Invaders have claimed Phendrana as their own. A [NES_Cyan]Tower[NES_Peach] sits atop their fortress. Collapse it to reveal the chamber where the Artifact of Elder is held.";
    }
    if (arg0 == 3)
    {
        return "A [NES_Cyan]Sunchamber[NES_Peach] high atop our ruined home became the nest of a great beast, and a source of corruption. Many Chozo spirits have been drawn to this tainted place. Release their bond to the world to claim the Artifact of Wild.";
    }
    if (arg0 == 4)
    {
        return "There is a tower within the Ruins where [NES_Cyan]Light[NES_Peach] always shines. Move through the waters there to find the Artifact of Lifegiver.";
    }
    if (arg0 == 5)
    {
        return "A room of [NES_Cyan]Research[NES_Peach] lies within the mines. A corrupted invader is trapped there. Defeat this creature to claim the Artifact of Chozo.";
    }
    if (arg0 == 6)
    {
        return "In one of Tallon's far corners, a [NES_Cyan]Grove[NES_Peach] of life lies. Reveal the pillar beneath the waves to find the Artifact of Warrior.";
    }
    if (arg0 == 7)
    {
        return "A molten [NES_Cyan]Lake[NES_Peach] lies within the tunnels of Magmoor. Shatter the column at the lake's center to reveal the Artifact of Nature.";
    }
    if (arg0 == 8)
    {
        return "Near Phendrana's shores, a [NES_Cyan]Temple[NES_Peach] stands. Thaw the frozen waters flowing from the Elder to find the Artifact of Sun.";
    }
    if (arg0 == 9)
    {
        return "Within the ruins of our home, we honor our fallen Elders in a great [NES_Cyan]Hall[NES_Peach]. A chamber beneath the statue holds the Artifact of World.";
    }
    if (arg0 == 10)
    {
        return "A tall cave stands at Phendrana's [NES_Cyan]Edge[NES_Peach]. Seek the unseen entrance at its top to find the Artifact of Spirit.";
    }
    if (arg0 == 11)
    {
        return "Invaders mine the depths in their greed. Forge a path through a [NES_Cyan]Tunnel[NES_Peach] of the Great Poison to claim the Artifact of Newborn.";
    }
    return "Null";
}

function pirate_data_name(arg0)
{
    if (arg0 == 0)
    {
        return "Fall of Zebes";
    }
    if (arg0 == 1)
    {
        return "The Hunter";
    }
    if (arg0 == 2)
    {
        return "Contact";
    }
    if (arg0 == 3)
    {
        return "Artifact Site";
    }
    if (arg0 == 4)
    {
        return "Phazon Analysis";
    }
    if (arg0 == 5)
    {
        return "Phazon Program";
    }
    if (arg0 == 6)
    {
        return "Metroid Studies";
    }
    if (arg0 == 7)
    {
        return "Parasite Larva";
    }
    if (arg0 == 8)
    {
        return "Mining Status";
    }
    if (arg0 == 9)
    {
        return "Glacial Wastes";
    }
    if (arg0 == 10)
    {
        return "Security Breaches";
    }
    if (arg0 == 11)
    {
        return "Project Meta Ridley";
    }
    if (arg0 == 12)
    {
        return "Phazon Infusion";
    }
    if (arg0 == 13)
    {
        return "The Elite Pirates";
    }
    if (arg0 == 14)
    {
        return "The Metroid Prime";
    }
    if (arg0 == 15)
    {
        return "Hunter Weapons";
    }
    if (arg0 == 16)
    {
        return "The Omega Pirate";
    }
    if (arg0 == 17)
    {
        return "Special Forces";
    }
    if (arg0 == 18)
    {
        return "Prime Breach";
    }
    if (arg0 == 19)
    {
        return "Prime Mutations";
    }
    if (arg0 == 20)
    {
        return "Metroid Morphology";
    }
    if (arg0 == 21)
    {
        return "Chozo Studies";
    }
    if (arg0 == 22)
    {
        return "The Chozo Artifacts";
    }
    if (arg0 == 23)
    {
        return "Metroid Forces";
    }
    if (arg0 == 24)
    {
        return "The Chozo Ghosts";
    }
    // -- MW Changes Start
    if (arg0 == 25)
    {
        return "Phazon Suit Hiding Spot";
    }
    // -- MW Changes End
    return "Null";
}

function pirate_data_log(arg0)
{
    if (arg0 == 0)
    {
        return "Space Pirate encrypted data decoded.\nLog 09.992.3 - B\nWe lost our frickin’ colony on Zebes. Literally everyone there is dead - Either from the Hunter or the absolute wreckage that was created. In orbit above Zebes were our space stations Orpheon, Siriacus, and Vol Paragom; they all have retreated to other locations. This station, Frigate Orpheon, is docked here at Vortex Outpost. Interesting creatures in our storage have all survived, including Metroids. Experiments galore shall begin on these lifeforms. Frigate Orpheon seems safe and out of the Hunter’s radar.";
    }
    if (arg0 == 1)
    {
        return "Space Pirate encrypted data decoded.\nLog 10.023.7 - B\nHigh Command has been wildly alert since the fall of Zebes. Samus Aran, also known as the Hunter, is all High Command has been concerned with lately. She totes a rad suit of armor featuring deadly beams and weapons. We have all been told to kill the Hunter on-sight, which I’m sure will go swimmingly with our combat abilities. There is a nice bounty on her head, but she’s a walking deathtrap.";
    }
    if (arg0 == 2)
    {
        return "Space Pirate encrypted data decoded.\nLog 10.229.2 - B\nLower Command took interest in an energy spike coming from planet Tallon IV. I was dispatched to Tallon IV with a few others as a research team to assess the place. The peaceful planet was delightful until we reached the source of the energy spike. A gooey radioactive substance was our culprit, one with bad vibes. It doesn’t matter though, because this substance was deemed as one with [wave]amazing potential[/wave]. Overall, this mission nominated Tallon IV as the site of our next headquarters.";
    }
    if (arg0 == 3)
    {
        if (!dz("Classic Mode"))
        {
            return "Space Pirate encrypted data decoded.\nLog 10.308.0 - B\nSuccess!! The Space Pirate Field Team just had a huge victory. We finally destroyed the Chozo Cipher that held us back from the Impact Crater, and now have access to the unlimited source of energy within.\nWe have erected our own cipher in its place, to protect the fruits of our labor. The cipher is connected to the life force of the Conquering Three guardians of this planet.\n[NES_Red]Our Space Pirate Cipher will automatically unlock in an emergency if the Conquering Three are compromised.[NES_Peach] This is to allow for the swift collection of internal resources before retreating.";
        }
        else
        {
            return "Space Pirate encrypted data decoded.\nLog 10.308.0 - B\nOur field team has reported back on the alien structure sitting atop a crater on the surface of Tallon IV. Our studies indicate that the race that built it imbued it with a powerful barrier. This makes us curious as to what they may be hiding - We believe it is preventing us from accessing a large power source deep within the crater. The barrier appears to be fueled by Chozo artifacts that we cannot fully obtain. We have few of these artifacts, and are studying them hard. If we wish to make great progress towards energy production, it is critical that we dismantle this barrier quickly. We will happily destroy the Chozo artifacts if we need to.";
        }
    }
    if (arg0 == 4)
    {
        return "Space Pirate encrypted data decoded.\nLog 10.344.8 - B\nWe just came up with a name for this wonderful new power source - Phazon. It is a V-index mutagen with next to no available research done on it. It seems an object that crashed on the surface of Tallon IV is the source of the Phazon. Phazon makes things resist its poisonous nature, but in exchange for the sanity or mutation of the creatures it empowers. We find these mutations to be absolutely bonkers! Creatures evolve on the fly and possess incredible strength. We are determined to form a competent Science Team on Tallon IV in the near future.";
    }
    if (arg0 == 5)
    {
        return "Space Pirate encrypted data decoded.\nLog 10.401.7 - B\nWe’re chipping at the Phazon that we can find, although it is a slow process. In the works is the destruction of the Chozo Ruins as well. Biotech research is growing promisingly. Our main base on the surface is the remote Phendrana Drifts. It will soon be ours: A base of science, command, flight, and war. If the higher ups aren’t full of it, we will become the dominant race here in mere days - Or rather, whatever a decacycle is.. This is a glorious time for the Space Pirate race.";
    }
    if (arg0 == 6)
    {
        return "Space Pirate encrypted data decoded.\nLog 10.444.4 - B\nWe have successfully contained and delivered Metroids to our Tallon IV research facilities. We had to fully murder 3 of our Metroids during an incident at the landing site, but the others were contained like a pet in a cage. We are going to fill the Metroids to the brim with Phazon, because whatever happens is probably going to be awesome. They are creatures of energy, and we want them to eat Phazon for its strange energy. The smartest of our kind foresee major power level spikes and larger bodies for Metroids. Will the Metroids be stable? We don’t know and definitely don’t care.";
    }
    if (arg0 == 7)
    {
        return "Space Pirate encrypted data decoded.\nLog 10.515.8 - B\nWe have been screwing around with the native life of Tallon IV, testing loads and loads of Phazon on them to see what happens. Muscle, size, and a mean spirit seem to be common reactions to Phazon. The creatures evolve on the spot sometimes, becoming bearers of Phazon-infused body parts and accessories. We made sure to choose the best of the best creatures for this research - Their growth is promising, perhaps we could weaponize them for use on any planet. Currently, however, everything we do this to dies within 4 Phazon infusions… And become incredibly mean - no - [shake]evil[/shake] - during the third infusion. Saying they die may be misleading, because we are actually euthanizing them out of fear for our lives. Regardless, we are totally hopeful that our studies will be groundbreaking. We are a smart bunch.";
    }
    if (arg0 == 8)
    {
        return "Space Pirate encrypted data decoded.\nLog 10.587.7 - B\nWe realized the Chozo barrier that blocks the crater only actually blocks the top of it… So we’re drilling directly into the bottom of the funky-shaped crater. We are getting a heck of a lot more Phazon due to this mining. The additional personnel and technology we have available makes this increase possible! Sometimes our people go totally mad due to the Phazon, so we are locking those guys up in a dark basement with some life support systems that seem to subdue them. Going Phazon-mad messes with our gait, makes us twitchy, makes breathing a totally hard task, and even causes us to hallucinate some wild stuff. Phazon seems to be a little more wack than we anticipated, so we should probably stop rushing… [wave]Probably…[/wave]";
    }
    if (arg0 == 9)
    {
        return "Space Pirate encrypted data decoded.\nLog 10.664.2 - B\nWe made a research outpost! We named it Glacier One!! It is located in Phendrana Drifts and is almost fully operational. It is a great place for raising Metroids as it is very cold, and Metroids certainly do not like the cold. They become sluggish and easy to control - Even those infused with Phazon! The smaller Metroids are doing just fine in our delicate glass tubes, but the ones that turned scary have been placed in caves to prevent our untimely deaths. The icy environment around Glacier One keeps screwing up our security doors, and the predators native to Phendrana keep having us for tasty snacks and wrecking our labs. We kind of need a bigger army to keep this up.";
    }
    if (arg0 == 10)
    {
        return "Space Pirate encrypted data decoded.\nLog 10.712.1 - B\nWe are pretty far along in terraforming and retrofitting security checkpoints on the planet. But the local creatures are murdering us en-masse. The creatures don’t seem to be using doors, so it’s a complete mystery as to how they’re infiltrating our lovely bases. One guy said they could be using [wave]secret[/wave] tunnels. We’re plugging anything that looks like a tunnel up with big Space Pirate corks, and I cannot even imagine why that’s not working. With our tight schedule, we really don’t have time to handle these security breaches.";
    }
    if (arg0 == 11)
    {
        return "Space Pirate encrypted data decoded.\nLog 10.891.0 - B\nProject Meta Ridley, the reconstruction of geoform 187, is finally complete. After the Hunter absolutely obliterated him on planet Zebes, we decided to take what was left and make it a super-cool cyborg. It didn’t take long, but Ridley was extremely upset with us the whole time. It definitely was painful and agonizing, but the metagenic process was a huge success anyways. Totally worth the pirates he killed in a pained rage. We think he’s pretty strong now, super-duper mobile, and an absolute force on the battlefield. We even sewed some armor into his body, hence the name Meta Ridley. We think he will love his new job as the most important member of our security force.";
    }
    if (arg0 == 12)
    {
        return "Space Pirate encrypted data decoded.\nLog 10.957.2 - B\nWe’ve decided to get cocky with our use of Phazon. We’re even mixing it with our own DNA now, it’s awesome. Somebody named this process Project Helix for some reason. Project Helix is going to produce some totally rad new forms of Space Pirates. Test subjects aren’t being harmed, which is a big step for us. Some say we should be wary of Phazon-induced craziness, however. I think they’re dumb, we just have to keep refining our techniques. Space Pirate mental health is our number one (or maybe two) concern in this process.";
    }
    if (arg0 == 13)
    {
        return "Space Pirate encrypted data decoded.\nLog 11.001.9 - B\nProject Helix started out horribly, to be frank. It basically melted our people’s brains from the inside out, even though it made them totally strong. We’re going to call these ‘Elite Pirates’ , though none have reached full growth. They keep killing everything around them too. Our neighboring research team, named Sclera, have been studying parasites. They used a Phazon strain called Vertigo and managed to successfully enhance these parasites without murdering them! So we are now fusing Vertigo Phazon with our own DNA and it seems to be pretty successful. The newest Elite Pirate are growing well and are ready to be whipped into shape.";
    }
    if (arg0 == 14)
    {
        return "Space Pirate encrypted data decoded.\nLog 11.156.9 - B\nWhile casually mining, some of our crew stumbled upon what we are calling the Metroid Prime. Unfortunately the Metroid Prime immediately killed our miners, but we luckily held it back with our security team and drones. We got him all tied up and did some studies. Our findings are super fascinating. It kind of seems to be a Metroid, but also it’s definitely not a Metroid. This thing can absorb and produce a huge amount of Phazon without going crazy or dying! Actually, scratch that, it is totally going a little crazy. But still, no dying! We are still managing to contain it using refrigeration, so our request to study it more has been approved. What could go wrong?";
    }
    if (arg0 == 15)
    {
        return "Space Pirate encrypted data decoded.\nLog 11.222.8 - B\nWe really want Samus Aran’s arsenal. Like, we [shake]really[/shake] want it badly. So we have been collecting data on her while she’s been assaulting us, hoping to return the favor soon. There is hope for us in reverse-engineering her beam weapons, but the Power Suit technology baffles us. We tried to engineer a Morph Ball form for ourselves, and broke about 7 Space Pirates’ bones in the process. They are now suffering and the science team is ready to move on and call that a loss.";
    }
    if (arg0 == 16)
    {
        return "Space Pirate encrypted data decoded.\nLog 11.232.8 - B\nThere’s this Elite Pirate, we named it Upsilon. It is extremely resistant to the harmful effects of Phazon, so we’re pumping him full of it. The results have been encouraging. Its diet of Phazon has made it quite the big one, but it has not driven it mad! It’s using its weapons with deadly force like it’s no big deal. Upsilon can even heal itself! It just slurps up some nearby Phazon and grows whatever it needs back. As of right now, we’re actually going to start calling it Omega Pirate. It will be the new standard for our soldiers. Hopefully it won’t get addicted to Phazon, because that would suck.";
    }
    if (arg0 == 17)
    {
        return "Space Pirate encrypted data decoded.\nLog 11.369.4 - B\nI think we can become an indestructible force to be reckoned with. Project Helix’s Elite Pirate are obviously the new standard of our armies, and will establish Space Pirate dominance wherever we please. They are naturally resistant to many attacks, and they tote multitudes of weapons at once; something that is normally hindered by the fact that we have 3 fingers per hand. The Elite Pirates aren’t very fast, but they overcompensate in other areas that matter. Alongside our other varieties of fighting pirates, we are destined to win all our battles.";
    }
    if (arg0 == 18)
    {
        return "Space Pirate encrypted data decoded.\nLog 11.377.1 - B\nThe Metroid Prime escaped! Out the front door!! Oh no!!! It seems that it was allured by a nice puddle of tasty Phazon, and used a previously unheard of strength to shatter its containment tank. It went ahead and ate [shake]all of the Phazon[/shake]. It was kind of scary. After that, it did something totally bonkers: It took our weapons and utilized them.. On us! Even scarier! The weapons it absorbed are now a part of the Metroid Prime, so it looks like it would be harmed to remove them. Despite our fear, this is still intriguing. The higher-ups have demanded that we study this scary thing. I’m scared.";
    }
    if (arg0 == 19)
    {
        return "Space Pirate encrypted data decoded.\nLog 11.402.5 - B\nThere’s a lot of Prime Mutation going on here. The Metroid Prime has taken residence in the Impact Crater, where it feeds and grows relentlessly. The Metroid Prime has developed some cool-looking armor now, and we can barely recognize it. It somehow is producing defense screens as well; it’s like it has turned our technology into organic matter. These defense screens all have particularly obvious weaknesses, but it compensates by changing defense screens a whole lot. This development has us very confused and scared; we worry that the Metroid Prime will soon make itself invincible to all weaponry. If that happened, it wouldn’t be our Metroid Prime anymore.";
    }
    if (arg0 == 20)
    {
        return "Space Pirate encrypted data decoded.\nLog 11.420.7 - B\nTo say our research into Metroid biology has been slow-going would be an understatement. Through dissection, our team has deduced that the creature’s twin mandibles extract ‘energy’ from its prey which is syphoned directly to its nucleic core , though what exactly this ‘energy’ is continues to confound us. Victims do not appear to be missing blood or any other essential fluids; perhaps identifying whatever it is they’ve been leeched of is beyond our current scientific capabilities… or perhaps it’s the victims souls?! The answer to this could not only prove invaluable in combating the Metroids, it could also be a major step in our evolution as a species. How exciting--and terrifying!";
    }
    if (arg0 == 21)
    {
        return "Space Pirate encrypted data decoded.\nLog 11.440.4 - B\nWe’ve been studying the lifeforms known as the Chozo - and results are in! First, they are probably extinct. Second, we think that Tallon IV once housed an incredible Chozo Empire, which was shattered by the meteor strike. The tarnishment of their planet led to the Chozo’s end. On an interesting note, there remain pieces of this now lost society. It’s honestly no use to us and we plan to destroy it - We will soon have everything these dead birds have to offer us and following that, we will cleanse the planet of the eyesore that is their architecture. The dead shouldn’t get in the way of the living, I say!";
    }
    if (arg0 == 22)
    {
        return "Space Pirate encrypted data decoded.\nLog 11.452.8 - B\nOne facet of this planet that has piqued our interest is the vast number of relics our team has discovered, remnants of the fallen Chozo Empire! Though we can only speculate as to what sort of archaic rituals these idols might’ve been used in, our scientists have nonetheless identified them as artifacts resonating with immense power! Now if we could only figure out how to harness that power for something useful, we’d be in business… Command has the Science Team experimenting towards fusing the artifacts with the planet’s abundant Phazon supply, suspecting the two are connected somehow. If nothing else, we know the artifacts have something to do with the Chozo Temple, the last obstacle in our path to the sealed-off Impact Crater. Let’s hope our science team is on the cusp of a breakthrough with regards to these phenomena… that is, if they value their jobs!";
    }
    if (arg0 == 23)
    {
        return "Space Pirate encrypted data decoded.\nLog 11.550.6 - B\nWe keep on studying these Metroids, day and night, and progress is still only a trickle. One thing is likely - It seems way more possible to tame the Metroids as opposed to harnessing their power. We actually wouldn’t need to study them at all if we could figure out a good way to tame them. Few Metroids can kill hundreds, or even thousands. Another benefit of taming them would be their defenses - We would only have to figure out a way to shield them from the cold in order for them to become invincible. Harnessing the energy they consume would be endlessly fruitful; providing us with energy galore. This is why we need to shift our focus toward taming Metroids, not becoming them.";
    }
    if (arg0 == 24)
    {
        return "Space Pirate encrypted data decoded.\nLog 11.664.2 - B\nThis is not a joke. There are ghosts in the Chozo Ruins. There are ghosts and they are everywhere. Many of us have been assaulted by these frickin’ ghosts. So many of us. Very few of us have survived these encounters. They go in-and-out and in-and-out, attacking and attacking to no end. Nothing seems to hurt them, and everything seems to provoke them. Perhaps they are defending their Chozo relics and artifacts? It’s not like we could ask them, but it must be fair to assume. They’re selfish for hoarding their artifacts, and we will find a way to destroy them. Watch out, Chozo Ghosts.";
    }
    // -- MW Changes Start
    if (arg0 == 25)
    {
        return "Space Pirate encrypted data decoded.\nLog 11.999.3 - B\nWe hid the Phazon suit at " + dz("MWPhazonHint");
    }
    // -- MW Changes End
    return "Null";
}

function chozo_lore_name(arg0)
{
    if (arg0 == 0)
    {
        return "Beginnings";
    }
    if (arg0 == 1)
    {
        return "Infestation";
    }
    if (arg0 == 2)
    {
        return "Binding";
    }
    if (arg0 == 3)
    {
        return "Cradle";
    }
    if (arg0 == 4)
    {
        return "Cipher";
    }
    if (arg0 == 5)
    {
        return "Worm";
    }
    if (arg0 == 6)
    {
        return "Fountain";
    }
    if (arg0 == 7)
    {
        return "Exodus";
    }
    if (arg0 == 8)
    {
        return "Hatchling's Spell";
    }
    if (arg0 == 9)
    {
        return "Hatchling";
    }
    if (arg0 == 10)
    {
        return "Meteor Strike";
    }
    if (arg0 == 11)
    {
        return "Contain";
    }
    if (arg0 == 12)
    {
        return "The Turned";
    }
    if (arg0 == 13)
    {
        return "Hope";
    }
    if (arg0 == 14)
    {
        return "Statuary";
    }
    if (arg0 == 15)
    {
        return "Newborn";
    }
    return "Null";
}

function chozo_lore_log(arg0)
{
    if (arg0 == 0)
    {
        return "Our colony on Tallon IV continues to grow. Though we Chozo are renowned for our technology, we few have instead chosen a life of simplicity. We build our sanctuary here as part of the world. Rather than leveling the ancient forests to erect temples of metal, we build around the noble trees and crafts structures of rough stones and woven branches. Here, we will not dominate or stand above nature; we will be one with it, just another thread in the wild web. For too long have us Chozo looked to move past our biological limits. Here, we embrace them. We will come to understand ourselves and our roles in the universe.";
    }
    if (arg0 == 1)
    {
        return "Our situation has grown even more dire, and we no longer look to any hope. The poison brought them here. The greedy invaders came down from space and stormed the Cradle. Thankfully, its powers are beyond their comprehension. Though they might try, they cannot yet bring the Cradle down. But it does not matter. They have delusions of using the power of the Great Poison for their ambitions; the invaders do not yet know that the poison cannot be controlled. It will only bring them death. Yet they persist, mastering the planet and defiling the ruins of our sanctuary. There is nothing else to be done but to await our fate, whatever it may be.";
    }
    if (arg0 == 2)
    {
        return "The Cipher still holds the Great Poison back. The Invaders, fearing its power, sought its destruction. Their efforts were in vain, as the Cipher proved more powerful still. But the invaders are crafty, and we do not know the upper limits of their capabilities. So we scattered the twelve Artifacts across the world. The invaders have taken some, but most remain unfound. Those they have acquired, they attempt to unmake, hoping to learn more of their power. But the artifacts prove too illusive for them, and we can sense the fear growing in the Invaders’ hearts. They know that the Artifacts possess great power. One day, when the Defender comes to destroy the Worm, the Artifacts will be reunited and made whole again. We must protect them, and work to guide the Defender to them.";
    }
    if (arg0 == 3)
    {
        return "It was the suffering of Tallon IV that replaced the veil. The world that gave us so much, that allowed us to look beyond, now lies corrupted. The waters are tainted and poison the trees. The creatures wither and die, and those that survive become twisted. Even we Chozo cannot resist it. Our connection to this world is for better and worse, it seems, and our ethereal forms offer no protection. Slowly, we will succumb along with the heart of the world. Already, many Chozo have succumbed, and where our faded spirits go we cannot guess. Our last and only hope lies in the Cradle, the temple that will stem the spread of this poison. It is now near completion, hovering as a dark shadow over the Impact Crater. Our survival, and the survival of Tallon IV, depends on our success.";
    }
    if (arg0 == 4)
    {
        return "We work tirelessly on the temple. None can say for sure how long these evils can be contained. As we grow weaker, the Worm festers, growing ever stronger in its poisoned pit. Only the gathering of the twelve artifacts of our Cipher. Its power is great, its twelve links coming together to create a mystic key. Still, it is not all powerful. Its reach is limited, and we are slowly succumbing to the poison. We will soon not be ourselves. And with our selves gone, the Cipher will be unguarded, and there will be nothing else we Chozo can do to save Tallon IV.";
    }
    if (arg0 == 5)
    {
        return "We Chozo of Tallon IV tell of the prophecy of the Worm. A creature of untold power will come, borne in a poison womb, and devour the world until it rots. It would seem that it is us unfortunate Chozo who must see the prophecy become reality. We built the Cradle to hold back the poison, but as we worked we spied it, writhing and growing in the poison’s embrace. We are powerless to stop it. We can only work and watch and wait. But, there is yet some hope. The prophecy, too, speaks of a Defender who will come to us and purge the world of these ills. The end is approaching. Will the Defender come? Is the Newborn the one who will free us? We cannot know, and so we do what we can to aid her. Even if we cannot be saved, she carries our legacy as the armor of our people. For even as nothingness approaches, we Chozo still have our pride. We will leave our mark in the universe.";
    }
    if (arg0 == 6)
    {
        return "When we discovered the Wellspring, we knew that it must be the jewel of our city. Its clear waters spoke in our minds and showed us the faults of our reality. And so we built the fountain around its life-giving waters, and sent them flowing throughout our world. In the reflections of the waters, we began to glimpse beyond. We peeked behind the curtain and looked into the clouded mists of past and future. In some visions we see the fountain itself, pouring out putrid poison in place of its waters. When or why or if this may be, we cannot yet guess.";
    }
    if (arg0 == 7)
    {
        return "At last our time has come. When we first came to Tallon IV, we Chozo had hoped to find a sanctuary where we could rest our souls and reconnect with the natural way of life, devoid of our technological dependencies. And so we built our city from crude rock and branch, and began to look inward. We leave our city now as we made it: one with the world on which it is built. We have no need of it anymore, and offer it as our final prideful mark on the physical world. For we have drawn aside the veil of physicality. We are withdrawing, now, beyond the illusion to be as one with the universe. But we will never forget our sacred home here, on Tallon IV, that allowed us to understand. Even beyond the veil, we will watch this world from afar.";
    }
    if (arg0 == 8)
    {
        return "The Hatchling is here, with us. How can this be? Are these some dream? Visions? Beyond the veil, time and space have flowed into each other as one cosmic ocean. We are immersed in the waters, but cannot trust all we see in it. The Hatchling, too, appears immersed in the waters, faded like us. Yet, at times we can see her more clearly, undiluted by the intercourse of space and time. We see her face, and remember the child from our homeworld, long ago. Is this what she has become? A warrior, clad in Chozo armor and wielding our relics? Does she search for us as we were before? Does she long for her parents? Does she even still live?";
    }
    if (arg0 == 9)
    {
        return "Is what we see before our eyes true? As we continued our ceaseless struggle against the Great Poison, she came to us. The Hatchling, Samus, the last hope of the Chozo legacy has come. Is she the Defender, come at the last hour to free our spirits of the Great Poison? When our strength and pride fades, will the prophecy be fulfilled? The Poison prevents us from seeing the truth. We can only hope that we do not learn too late.";
    }
    if (arg0 == 10)
    {
        return "Ripped from Beyond the Veil, we Chozo have been forced back to Tallon IV. A dark meteor came, bringing with it a corruption unlike anything we have ever known. This corruption evaded our detection from Beyond the Veil, and so we let the meteor pass uninhibited. But then it took root and spread its corruption as a Great Poison. This poison, too, could exist Beyond the Veil, and so it spread and ripped us from our new home. Now we wander our bygone sanctuary, skulking as shades of our past selves. Trapped in the prison of our former paradise, we search for our purpose.";
    }
    if (arg0 == 11)
    {
        return "This world of life that was once our sanctuary is now alien to us. For so long we have lived Beyond the Veil, and now we fear we may never be able to return while the Great Poison continues to corrupt Tallon IV. And it would seem that the connection we forged in our mortal lives has bound us to this same fate. The Poison corrupts us, breaking our wills and overwhelming our minds. We who have understood timelessness must now race to make our last stand. We will contain this darkness. As always, we Chozo return to our great works. The source of the Poison will be locked away, deep in a temple. At its heart, we will place a Cipher, an ethereal lock powered by Twelve Artifacts containing all the knowledge and power we Chozo Ghosts can muster. The work has begun. We can only hope we are not too late.";
    }
    if (arg0 == 12)
    {
        return "Many of us have faded, now. We survivors cannot help but envy this mercy. Those of us that remain know it is only a matter of time. Soon our minds will break and the poison will corrupt us all. Some of us have been driven mad, haunting our world with a murderous blindness. They have no recollection of their former selves and do no honor to our works. The Turned seek to disrupt the Cradle, despite having exerted so much of their energy to build it with us. They despise all life, and they never sleep. Soon all of us Chozo will do the same.";
    }
    if (arg0 == 13)
    {
        return "We cannot help but think of the Newborn. She dominates all of our thoughts, even as our minds swirl reality before our very eyes. Even then, she remains. She is here, that much must be true. And she charges fearlessly forward, hunting the corrupted. Whether she truly is the defender of prophecy, we cannot know. Perhaps she is. Or perhaps she is merely filling that role. Our fate is now bound to her. What fools we were to despair! We are Chozo, and we will not sit idle and hopeless as our world crumbles before us. Though we are weakened, our powers are still great, perhaps greater than we understood. The Invaders and the poison they seek to control will feel our wrath. We are not cowards who will sit idly by. We will fight with the Newborn, even to the bitterest end.";
    }
    if (arg0 == 14)
    {
        return "Perhaps it is some spark of our Chozo pride, but we cannot help but continue to hone our statuary. Our civilization has done so for millennia across countless planets. Some we placed to mark our presence, settling planets and bringing them peace. Others we give purposes beyond the understanding of other creatures - conduits that bring strength and good fortune. Others still are silent sentinels, towering and terrible, who guard our secret technology. Though we seek to reconnect with the natural universe here, we could not help but bring some few of our prized relics. The statues will protect them for us. With their guard, only true friends of the Chozo who honor and respect us will know our wisdom. Those who would work against us, they will know our wrath.";
    }
    if (arg0 == 15)
    {
        return "The Cradle has been completed at last. It has been successful in staying the spread of the poison from the Impact Crater. Yet it is helpless against that which was not contained; the poison continues to spread and fester deep below the ground. Despite our vast knowledge, we Chozo cannot destroy it. Our power continues to wane– even now, the poison feeds on our minds. Our forms drift about time and space, our minds decaying as past and future blend before our eyes. Yet one image remains constant, if unclear. It is the Hatchling, the Newborn, braving the road of corruption and cleansing the choking shadows with her light. She walks as a warrior, armed in the machines our kind crafted for battle, and yet we can see the young child still in her eyes. Has she already come and gone, a glimmer of false hope? Or is she here, in front of my eyes even now, standing before us as our savior in our spirit's final hour? We cannot know, for the poison clouds our vision.";
    }
    return "Null";
}

function creature_name(arg0)
{
    if (arg0 == 0)
    {
        return "Parasite";
    }
    if (arg0 == 1)
    {
        return "Auto Turret";
    }
    if (arg0 == 2)
    {
        return "Zoomer";
    }
    if (arg0 == 3)
    {
        return "Geemer";
    }
    if (arg0 == 4)
    {
        return "Sap Sac";
    }
    if (arg0 == 5)
    {
        return "Bloodflower";
    }
    if (arg0 == 6)
    {
        return "Seedling";
    }
    if (arg0 == 7)
    {
        return "Scarab";
    }
    if (arg0 == 8)
    {
        return "Beetle";
    }
    if (arg0 == 9)
    {
        return "Plated Beetle";
    }
    if (arg0 == 10)
    {
        return "War Wasp";
    }
    if (arg0 == 11)
    {
        return "Ram War Wasp";
    }
    if (arg0 == 12)
    {
        return "Barbed War Wasp";
    }
    if (arg0 == 13)
    {
        return "Hive";
    }
    if (arg0 == 14)
    {
        return "Eyon";
    }
    if (arg0 == 15)
    {
        return "Plazmite";
    }
    if (arg0 == 16)
    {
        return "Shriekbat";
    }
    if (arg0 == 17)
    {
        return "Tangle Weed";
    }
    if (arg0 == 18)
    {
        return "Venom Weed";
    }
    if (arg0 == 19)
    {
        return "Blastcap";
    }
    if (arg0 == 20)
    {
        return "Reaper Vine";
    }
    if (arg0 == 21)
    {
        return "Stone Toad";
    }
    if (arg0 == 22)
    {
        return "Plated Parasite";
    }
    if (arg0 == 23)
    {
        return "Oculus";
    }
    if (arg0 == 24)
    {
        return "Plated Puffer";
    }
    if (arg0 == 25)
    {
        return "Hive Mecha";
    }
    if (arg0 == 26)
    {
        return "Incinerator Drone";
    }
    if (arg0 == 27)
    {
        return "Chozo Ghost";
    }
    if (arg0 == 28)
    {
        return "Golden Guard";
    }
    if (arg0 == 29)
    {
        return "Grizby";
    }
    if (arg0 == 30)
    {
        return "Burrower";
    }
    if (arg0 == 31)
    {
        return "Puffer";
    }
    if (arg0 == 32)
    {
        return "Triclops";
    }
    if (arg0 == 33)
    {
        return "Magmoor";
    }
    if (arg0 == 34)
    {
        return "Puddle Spore";
    }
    if (arg0 == 35)
    {
        return "Crystallite";
    }
    if (arg0 == 36)
    {
        return "Ice Parasite";
    }
    if (arg0 == 37)
    {
        return "Ice Shriekbat";
    }
    if (arg0 == 38)
    {
        return "Pulse Bombu";
    }
    if (arg0 == 39)
    {
        return "Scatter Bombu";
    }
    if (arg0 == 40)
    {
        return "Ice Burrower";
    }
    if (arg0 == 41)
    {
        return "Ice Beetle";
    }
    if (arg0 == 42)
    {
        return "Flickerbat";
    }
    if (arg0 == 43)
    {
        return "Jelzap";
    }
    if (arg0 == 44)
    {
        return "Baby Sheegoth";
    }
    if (arg0 == 45)
    {
        return "Sheegoth";
    }
    if (arg0 == 46)
    {
        return "Sentry Drone";
    }
    if (arg0 == 47)
    {
        return "Space Pirate";
    }
    if (arg0 == 48)
    {
        return "Shadow Pirate";
    }
    if (arg0 == 49)
    {
        return "Flying Pirate";
    }
    if (arg0 == 50)
    {
        return "Aqua Sac";
    }
    if (arg0 == 51)
    {
        return "Tallon Crab";
    }
    if (arg0 == 52)
    {
        return "Aqua Reaper";
    }
    if (arg0 == 53)
    {
        return "Aqua Drone";
    }
    if (arg0 == 54)
    {
        return "Aqua Pirate";
    }
    if (arg0 == 55)
    {
        return "Mega Turret";
    }
    if (arg0 == 56)
    {
        return "Glider";
    }
    if (arg0 == 57)
    {
        return "Power Trooper";
    }
    if (arg0 == 58)
    {
        return "Wave Trooper";
    }
    if (arg0 == 59)
    {
        return "Ice Trooper";
    }
    if (arg0 == 60)
    {
        return "Plasma Trooper";
    }
    if (arg0 == 61)
    {
        return "Elite Pirate";
    }
    if (arg0 == 62)
    {
        return "Phazon Elite";
    }
    if (arg0 == 63)
    {
        return "Metroid";
    }
    if (arg0 == 64)
    {
        return "Hunter Metroid";
    }
    if (arg0 == 65)
    {
        return "Fission Metroid";
    }
    if (arg0 == 66)
    {
        return "Phazon Hunter";
    }
    if (arg0 == 67)
    {
        return "Plated Hunter";
    }
    if (arg0 == 68)
    {
        return "Hunter Larva";
    }
    if (arg0 == 69)
    {
        return "Alpha Hunter";
    }
    if (arg0 == 70)
    {
        return "Gamma Hunter";
    }
    if (arg0 == 71)
    {
        return "Zeta Hunter";
    }
    if (arg0 == 72)
    {
        return "Lumigek";
    }
    if (arg0 == 73)
    {
        return "Phazon Blastcap";
    }
    if (arg0 == 74)
    {
        return "Phazon Burrower";
    }
    if (arg0 == 75)
    {
        return "Parasite Queen";
    }
    if (arg0 == 76)
    {
        return "Flaahgra";
    }
    if (arg0 == 77)
    {
        return "Thardus";
    }
    if (arg0 == 78)
    {
        return "Omega Pirate";
    }
    if (arg0 == 79)
    {
        return "Meta Ridley";
    }
    if (arg0 == 80)
    {
        return "Metroid Prime Exo";
    }
    if (arg0 == 81)
    {
        return "Metroid Prime Core";
    }
    return "Null";
}

function creature_log(arg0)
{
    if (arg0 == 0)
    {
        return "Morphology: Parasite\nInfamous swarming pest known all over the galaxy.\n\nA Tallon IV native, these scavengers can be pretty harmless when alone. Their strength is in numbers, and boy these things can pack a punch if they square off against a foe. They would ram a creature and rupture their stomachs, exploding in a shower of corrosive bile. Thankfully my Power Suit's shielding should protect me from them. Though, upon closer examination, these ones look mutated, altered somehow.";
    }
    if (arg0 == 1)
    {
        return "Subject: Auto Defense Turret\nAutomated point defense gun.\nOriginally manufactured by a Federation contractor that specializes in distributing equipment to colonial supervisors. As such, it packs a punch but is dirt cheap and not very durable. While automated, it depends on an external system to feed it friend-or-foe data.";
    }
    if (arg0 == 2)
    {
        return "Morphology: Zoomer\nLightly-armored scavenging mollusk.\nThis creature can be found almost anywhere there are Space Pirate settlements. I have no idea why they are so fascinated with them. Their spiky shells protect them from would-be predators, and are known to carry disease-carrying pathogens they collect while eating and are immune to. Perhaps their hardiness and ability to spread anywhere and ruin everything is something the Pirates admire?";
    }
    if (arg0 == 3)
    {
        return "Morphology: Geemer\nScavenging mollusk with plated armor and retractable spikes.\nA relative of the Zoomer, with a sturdier shell and spikes coated in lethal bacteria. Contrary to popular belief, Geemers and Zoomers are not the same species. One guy published an article in a science magazine with inaccurate information one time, and now half of the galaxy is convinced they're identical. Having grown up seeing both varieties on Zebes, I can tell the difference.";
    }
    if (arg0 == 4)
    {
        return "Morphology: Sap Sac\nBioluminescent pocket of explosive chemicals.\nAn energy storage organ for some of the vines that pervade this planet. If ruptured, the chemicals react with the air and produce a sizable explosion. I hear that some restaurants hire bounty hunters who specialize in extracting these organs intact, for adding to their dishes. Maybe once this mission is over, I'll treat myself.";
    }
    if (arg0 == 5)
    {
        return "Morphology: Bloodflower\nGiant plants that eject toxic spores towards threats.\nThe brain-like threat-detection system is located at its base. When it senses danger, the flower opens and spews a toxic sludge at the threat.  The receptors, noticably, do not have sufficient shielding to this toxin, unlike the rest of its body. Its beauty is what inspired the team name and icon for the famous Daiban Bloodflowers tennis team.";
    }
    if (arg0 == 6)
    {
        return "Morphology: Seedling\nPlant-based bottom-feeder.\nOften mistaken for a mollusk, this creature is actually pretty famous for its evolutionary uniqueness. Its ancestor was a plant that learned how to uproot and move itself around. The needles it can spew contain an known skin irritant. Despite that, there is still a market for acupuncture using these needles. Not for me.";
    }
    if (arg0 == 7)
    {
        return "Morphology: Scarab\nExplosive swarming insectoid.\nFrom infancy, a scarab is hardwired to think of the swarm and its survival first, before one's own. Its horn is able to anchor a scarab to solid rock, preventing it from being pried away and taken by predators or strong winds. Its back is unarmored. When it senses a foe is close by, it will self-destruct and expel its acidic guts towards the enemy. One scarab's explosion can cause burns on the skin; a swarm's mass explosion could drain energy shields quite rapidly.";
    }
    if (arg0 == 8)
    {
        return "Morphology: Beetle\nCuriously aggressive and massive beetles inhabit many areas here on Tallon IV. They are quick to defend their territory, and seem to be part of large family of species.";
    }
    if (arg0 == 9)
    {
        return "Morphology: Plated Beetle\nA curious mutation in the beetle family; this beetle has developed a protective plate on its head that can be used to deflect attack and ram foes with greater force. I must be careful where I aim at this fellow.";
    }
    if (arg0 == 10)
    {
        return "Morphology: War Wasp\nI have never felt more rage towards the logic of a reproductive cycle. War Wasps emerge from their hives with seeming endlessness, and nothing I can do will stop them [wave]as long as their hive exists...[/wave]";
    }
    if (arg0 == 11)
    {
        return "Morphology: Ram War Wasp\nA mutation of the hellish species known as War Wasps, these ones have formed a relationship with a piece of Chozo technology; they defend their reinforced home in exchange for its defensive capabilities. Perhaps they were bred for the Chozo trial? I need to investigate the Hive Mecha as well.";
    }
    if (arg0 == 12)
    {
        return "Morphology: Barbed War Wasp\nThe curiously enraging family of War Wasps have now developed projectiles! How wonderful! Unlike the Ram War Wasps, their relationship to Chozo technology seems to be that of an infestation - I don't think they are part of a trial. I need to investigate the Incinerator Drone as well.";
    }
    if (arg0 == 13)
    {
        return "Morphology: Hive\nA dreaded sight to see: The home of the War Wasps! An uncountable amount of mature War Wasps rest inside, ready to attack for the sake of their territory.";
    }
    if (arg0 == 14)
    {
        return "Subject: Eyon\nChozo defense turret installed in select areas of the Chozo city. Their firing rate varies per individual Eyon, and can be interrupted with basic weapons. Perhaps concentrated energy can actually destroy these creatures.";
    }
    if (arg0 == 15)
    {
        return "Morphology: Plazmite\nAn adorable little lightning bug! They inhabit dark areas and bring light to them. The effect of their glow is exponentially increased with greater numbers of living Plazmites.";
    }
    if (arg0 == 16)
    {
        return "Morphology: Shriekbat\nExtremely territorial, extremely quick, extremely explosive little ceiling-dwelling bats.";
    }
    if (arg0 == 17)
    {
        return "Morphology: Tangle Weed\nPredatorial plant life that entangles prey and slowly consumes them. Harmless to my Power Suit, however.";
    }
    if (arg0 == 18)
    {
        return "Morphology: Venom Weed\nAdvanced version of the Tangle Weed. This one's venom is actually toxic enough to damage my Power Suit, and I should steer clear of them when they are active.";
    }
    if (arg0 == 19)
    {
        return "Morphology: Blastcap\nSelf-destructive mushroom that emits extremely toxic spores. Their shimmy speed is directly correlated to how close I am to one of them. If my weapon kills the Blastcap in one hit, it won't emit the toxic spores!";
    }
    if (arg0 == 20)
    {
        return "Morphology: Reaper Vine\nAgressive and territorial spank-weeds that hide within the walls of the Chozo city. I am unable to gather if they are part of some large organism... And I shudder at the thought.";
    }
    if (arg0 == 21)
    {
        return "Morphology: Stone Toad\nBasic, tank-like lifeforms that sit and wait for prey to come directly into their range of suction. Once a Stone Toad inhales its prey, it takes a moment to assess whether it can digest its prey. If it cannot digest it, it releases the prey unharmed. What bizzare behavior for such a massive predator.";
    }
    if (arg0 == 22)
    {
        return "Morphology: Plated Parasite\nEvolved form of the Parasite that has developed a protective coating on its outer shell. Interestingly, it has lost the hivelike behavior I saw in Parasites on the Frigate Orpheon";
    }
    if (arg0 == 23)
    {
        return "Morphology: Oculus\nCurious, hopping crustacean that has a seemingly impenetrable shell. They love to stand in the way, and all there is to do is navigate around these invincible creatures.";
    }
    if (arg0 == 24)
    {
        return "Subject: Plated Puffer\nThis machine-like creature is likely Chozo made. It seems to be dispatched in areas of high-security in the Chozo city.";
    }
    if (arg0 == 25)
    {
        return "Subject: Hive Mecha\nI cannot tell whether this machine is a Chozo-made trial of skill or a malfunctioning structure having been taken over by Ram War Wasps. Its behavior seems so intricate and rehearsed, and [wave]so[/wave] dependent on the fate of the Ram War Wasps. Is this a trial for the Missiles? Or is this all coincidence? I should investigate the Ram War Wasps further.";
    }
    if (arg0 == 26)
    {
        return "Subject: Incinerator Drone\nSimilarly to the Hive Mecha, this is Chozo technology interacting with a unique species of War Wasps. Unlike the Hive Mecha, I have serious doubts that this is an intentional Chozo trial of skill. This is a trash incinerator that is attempting to function during a serious War Wasp infestation within its devices. I should investigate the Barbed War Wasps as well.";
    }
    if (arg0 == 27)
    {
        return "Morphology: Chozo Ghost\nOtherworldly aparitions that have manifested from the lost and enraged spirits of the previous Chozo inhabitants of Tallon IV. They defend their home mercilessly. I have found they are only weak to the firepower of the Power Beam and related weapons. Readings on their composition suggest the Screw Attack could do some serious damage as well.";
    }
    if (arg0 == 28)
    {
        return "Morphology: Golden Guard\nMysterious and angry, the Golden Guard is a unique Chozo Ghost that defends the Sunchamber in the Chozo Ruins. I don't sense the same merciless aggression from the Golden Guard; this feels like a test of skill.";
    }
    if (arg0 == 29)
    {
        return "Morphology: Grizby\nBestowed the ultimate name, Grizby is a feeble little arachnid that eats microorganisms on the ground it sweeps. It has sturdy armor that may be vulnerable to concussive damage, but it's almost too cute to find out!";
    }
    if (arg0 == 30)
    {
        return "Morphology: Burrower\nIt's really hard to hit this little bug. It appears from the ground to attack and quickly burrows away and out of sight.";
    }
    if (arg0 == 31)
    {
        return "Subject: Puffer\nA small front line of security developed by the Space Pirates for use in their Magmoor Caverns fortress. Puffers endlessly float around their post, poisoning the air and exploding upon contact with intruders.";
    }
    if (arg0 == 32)
    {
        return "Morphology: Triclops\nThese little bugs have the [shake]audacity[/shake] to pick me up in Morph Ball form and place me further from  my destination? And the worst of all, they play me around like a ball! A BALL! Did I mention they can also somehow wormhole me to another of their pals? Forget recording some sort of natural behavior, these guys are natural annoyances.";
    }
    if (arg0 == 33)
    {
        return "Morphology: Magmoor\nJust how long is this thing's torso? Magmoors are the namesake of Magmoor Caverns, and they defend its lava-filled shores with a firey rage. I notice two shot patterns in these guys: A quickly-charged single fireball, and a longer-charged wave of fireballs that I should be wary of.";
    }
    if (arg0 == 34)
    {
        return "Morphology: Puddle Spore\nThey sploosh and splash, in and out of the lava for days and days to come. How admirable! If I am able to strike their inner core with a weapon, they will go into a defensive state which I can use as a platform. Overall, just a lovely experience with a wild organism.";
    }
    if (arg0 == 35)
    {
        return "Morphology: Crystallite\nSmall, iceberg-resembling mollusk. Its body is made of ice; it uses this to defend itself from predators and camouflage themselves in the icy region of Phendrana. The Crystallite is capable of freezing its targets upon contact with them.";
    }
    if (arg0 == 36)
    {
        return "Morphology: Ice Parasite\nAnother variety of these galaxy-wide vermin. Ice Parasites have adapted to live in and camouflage in the snow. Despite looking much more built-up, the Ice Parasite's defenses are on par with the typical parasite.";
    }
    if (arg0 == 37)
    {
        return "Morphology: Ice Shriekbat\nSturdy, frigid-bodied creatures that pursue invaders within their territory. Their wings cut and freeze me at the same time; these are certainly the bigger cousin of the Shriekbat.";
    }
    if (arg0 == 38)
    {
        return "Morphology: Pulse Bombu\nA bloated, energized representation of a molecule. This sentient molecule creates shocking clouds in its environment to mark its territory and keep their areas tidy. What strange habits for a sphere!";
    }
    if (arg0 == 39)
    {
        return "Morphology: Scatter Bombu\nAnother bloated and energized representation of a molecule. This sentient molecule occupies tight spaces and generates obstacles that can paralyze its victims. It is unknown what the Scatter Bombu does with the creatures it captures.";
    }
    if (arg0 == 40)
    {
        return "Morphology: Ice Burrower\nThe frosty variant of our friend, the Burrower. The Ice Burrower boasts a stronger exoskeleton and a higher concentration of attack particles. Otherwise, its instincts and behavior are very similar to the heat-oriented Burrower.";
    }
    if (arg0 == 41)
    {
        return "Morphology: Ice Beetle\nHops around madly. Icy and cool. It's a Beetle.";
    }
    if (arg0 == 42)
    {
        return "Morphology: Flickerbat\nI think I've seen the Flickerbat's flight pattern before, but I can't put my finger on it. The faintest memory I have of this movement pattern involves something about a Castle; but I digress. Swarms of Flickerbats travel at high speeds and survey the entire outdoor  Phendrana region.";
    }
    if (arg0 == 43)
    {
        return "Morphology: Jelzap\nWatch out for those jaws! Ouch...";
    }
    if (arg0 == 44)
    {
        return "Morphology: Baby Sheegoth\nBaby form of the apex predator of the Phendrana Region, the Sheegoth. Sheegoths have evolved to thrive in the cold while utilizing ice to catch prey and defend from attackers. The Baby Sheegoth's rough skin is highly resistant to all weaponry, but there is a noticable weak spot on its back.";
    }
    if (arg0 == 45)
    {
        return "Morphology: Sheegoth\nOh my... This thing  is scary, and I'm rather uncomfortable living in the same universe as this monster. Besides being absolute nightmare fuel, the Sheegoth boasts very rough skin that is resistant to attack. It also uses the crystal formation on its back to draw in and nullify energy-based projectiles, such as beams. Scans indicate that there is a weak spot on the Sheegoth's belly, where concussive attacks will deal the most damage.";
    }
    if (arg0 == 46)
    {
        return "Subject: Sentry Drone\nBasic security robot constructed by the Space Pirates in Glacier One. These Sentry Drones serve many duties besides defense; they patrol territory, weld metal, and sound alarms.";
    }
    if (arg0 == 47)
    {
        return "Morphology: Space Pirate\nThe bane of my career as a bounty hunter - This here is one of a giant variety of Space Pirates. Unlike the crustacean-resembling Space Pirates that colonized Zebes, these freaks look more like insects, almost. Each Space Pirate is equipped with a rapid-fire blaster and several small hand grenades.";
    }
    if (arg0 == 48)
    {
        return "Morphology: Shadow Pirate\nThe same as a Space Pirate, except Shadow Pirates are invisible from a certain distance. Shadow Pirates seem to be the general scouts of the pirate fortress, as they stand posted in hallways and defend against any that cross their path. I need to be wary of their energy saber attack, as it is a rather large projectile.";
    }
    if (arg0 == 49)
    {
        return "Morphology: Flying Pirate\nWho gave the Space Pirate jetpacks? These explosive adversaries tote rapid-fire energy blasters and heat-seeking missiles. They will go absolutely crazy with these projectiles as they maintain a high & safe distance from their target. I can't forget - Their jetpacks release a deadly explosion upon death, which I should steer clear from.";
    }
    if (arg0 == 50)
    {
        return "Morphology: Aqua Sac\nI let the aquatic blue appearance of this fascinating plant life distract me from the dangerous nature of plants on Tallon IV. Just a little stroke, and the Aqua Sac explodes, killing itself. I don't understand their purpose in this ecosystem, but at least they are pretty when they glow.";
    }
    if (arg0 == 51)
    {
        return "Morphology: Tallon Crab\nDoesn't it look like it should be holding an orb with an ''S'' engraved on it?";
    }
    if (arg0 == 52)
    {
        return "Morphology: Aqua Reaper\nThe tentacles of some large, dormant aquatic beast. They mindlessly swing around and seem to be just another strange organism. Yet scans indicate that the inside of the Aqua Reaper does not contain all the organs it would need to support its own life. I think this implies that it's part of something bigger... Let's not find out.";
    }
    if (arg0 == 53)
    {
        return "Subject: Aqua Drone\nA Sentry Drone equipped with water-resistant armor and aquatic weaponry. Aqua Drones were created and stored on the Space Pirate Frigate Orpheon. It seems they are keeping their post even after the frigate's crashed landing and flooding.";
    }
    if (arg0 == 54)
    {
        return "Morphology: Aqua Pirate\nWho took the Flying Pirates' jetpacks and turned them into super-scuba-thrusters? These guys are somehow bulkier and faster than the Flying Pirates, despite being underwater. One thing I'll never understand; how do they release that firey explosion underwater?";
    }
    if (arg0 == 55)
    {
        return "Subject: Mega Turret\nEnhanced point-defense cannon with energy shields.\nIt looks like the Pirates decided to upgrade their Auto Turrets with energy shields, to compensate for the weak plating. And threw in some extra firepower. Personally, that's how I would design a turret, so it's like these Pirates are stealing ideas from me. I currently don't know whether to feel insulted or flattered.";
    }
    if (arg0 == 56)
    {
        return "Morphology: Glider\nJust the cutest little flying fish thing you've ever seen. It loves being swung from and will freeze in its path to act as a hook for grappling devices.";
    }
    if (arg0 == 57)
    {
        return "Morphology: Power Trooper\nSpace Pirates armed with sturdy armor that resists most weapons, except for kinetic beam weapons. The Power Trooper's blade emits a projectile with fast-traveling kinetic energy that packs a punch.";
    }
    if (arg0 == 58)
    {
        return "Morphology: Wave Trooper\nA bunch of Space Pirates set with sturdy armor that resists most weapons, except for electric beam weapons. The Wave Trooper's saber emits a projectile with oscillating electric energy that travels through solids easily.";
    }
    if (arg0 == 59)
    {
        return "Morphology: Ice Trooper\nSelect Space Pirates set up with sturdy armor that resists most weapons, except for freezing beam weapons. The Ice Trooper's sword emits a projectile with frigid, ice-cold energy that can freeze me.";
    }
    if (arg0 == 60)
    {
        return "Morphology: Plasma Trooper\nAdvanced Space Pirates donning sturdy armor that resists most weapons, except for high-heat beam weapons. The Plasma Trooper's blade emits a projectile with burning, piercing energy that can set my suit on fire.";
    }
    if (arg0 == 61)
    {
        return "Morphology: Elite Pirate\nA bio-engineered Space Pirate soldier with the defenses of a fortress and the firepower of a tank. This Space Pirate has undergone extreme prolonged exposure to Phazon. Elite Pirates that reacted well to the Phazon have been put into cryosleep until they are needed as defense, because the Phazon has caused most of them to become violent in nature.";
    }
    if (arg0 == 62)
    {
        return "Morphology: Phazon Elite\nA highly advanced Elite Pirate that reacted very well to Phazon infusion, compared to the other elites. The Phazon Elite's mind has not fully become controlled by Phazon Madness, which causes this elite to be faster and a better strategist than other Elite Pirates. My scans indicate just a hint of Chozo technology within this pirate's arsenal.";
    }
    if (arg0 == 63)
    {
        return "Morphology: Metroid\n[NES_Red]NOTE TO SELF:\n[NES_Peach]To get a Metroid off of your head, use Morph Ball Bombs.\nThe Tallon Metroid, while similar to the Zebesian Metroid, is an overall much more docile creature (by comparison, that is). While Zebesian Metroids mercilessly and relentlessly syphon energy from their victims, the Tallon Metroid uses intimidation and charge attacks before siphoning energy from their prey.\nInterestingly the Tallon Metroid not only has a weakness to cold; it does not deflect any weapons unlike their Zebesian relatives and can be dispatched without the use of ice.";
    }
    if (arg0 == 64)
    {
        return "Morphology: Hunter Metroid\nStrange mutated Metroids that pursue their targets from above, and drop down when it is least expected. The Hunter Metroid is stealthy, but also predatorial. I need to be careful as these Metroids gain invulnerability after siphoning energy from something.\nNow that I think about it, I wonder what they're hunting.";
    }
    if (arg0 == 65)
    {
        return "Morphology: Fission Metroid\nSo colorful! I can't let myself be fooled by the fun colors; Fission Metroids are very deadly. They are similar to Tallon Metroids, except for their heightened defensive capabilities. Fission Metroids all have one specific elemental weakness; they resist all other attacks.";
    }
    if (arg0 == 66)
    {
        return "Morphology: Phazon Hunter\nA Tallon Metroid that has been mutated by some means with Phazon. This Metroid is much more aggressive and behaves similarly to the Metroids I fought on planet Zebes. It is only vulnerable to the Phazon Beam.";
    }
    if (arg0 == 67)
    {
        return "Morphology: Plated Hunter\nThe Phazon Hunter grew a plate on its face, and now needs to be damaged from behind. The Plated Hunters travel more carefully compared to Phazon Hunters, likely in compensation for the heavy plate it has grown. This Metroid can only be damaged with pure Phazon.";
    }
    if (arg0 == 68)
    {
        return "Morphology: Hunter Larva\nBaby Phazon Hunter Metroid that have yet to develop any defensive capabilities. They are vulnerable to all firepower and leave behind usable pools of Phazon when defeated. I may need to use these pools to my advantage when I need Phazon and there's none around.";
    }
    if (arg0 == 69)
    {
        return "Morphology: Alpha Hunter\nThe second stage of an adult Phazon Hunter. It has lost its ability to siphon energy, and in fact looks like it has fully fallen into Phazon Madness. This Phazon Hunter does not seem concerned with survival; it seems concerned with killing things and killing things alone. The strange thing I have noticed, is that this creature leaves its prey behind to rot... Not very metroid-like.";
    }
    if (arg0 == 70)
    {
        return "Morphology: Gamma Hunter\nThe Phazon Hunter gets even bigger in its third phase. Now a quadruped, this Metroid doesn't act like a Metroid at all - It lets gravity do its thing, it fights with well-curated melee attacks, and, like its predecessor, does not siphon energy from prey.\nI'm beginning to wonder if the Phazon Hunters are Metroids at all.";
    }
    if (arg0 == 71)
    {
        return "Morphology: Zeta Hunter\n[shake]Oh my space! What the hell is that thing?[/shake] I need to kill it. Now. I can't live comfortably in a universe where this thing is living and breathing. Man, I thought the Sheegoths were terrifying, but these guys make me want to blow up Tallon IV. Regardless, like its younger forms, the Zeta Hunter is only vulnerable to Phazon-based attacks.";
    }
    if (arg0 == 72)
    {
        return "Morphology: Lumigek\nGlowing geckos that are minding their own business. They are not aggressive at all; they simply travel in packs and feed on small insects and plant life. Fascinatingly, their home in the Impact Crater implies that these guys can resist Phazon...";
    }
    if (arg0 == 73)
    {
        return "Morphology: Phazon Blastcap\nWatch out! This mushroom is filled to the brim with pure Phazon. Despite this deadly capability, I can use these to my advantage by powering the Phazon Beam.";
    }
    if (arg0 == 74)
    {
        return "Morphology: Phazon Burrower\nA burrower that has absorbed plenty, and I mean plenty, of Phazon. I don't recognize any signs of Phazon Madness in this creature. The Phazon Burrower mutated from Phazon, resulting in increased defense and strength. However, unlike most other organisms, it doesn't seem to have its behavior influenced by Phazon at all.";
    }
    if (arg0 == 75)
    {
        return "Morphology: Parasite Queen\nBreeder Parasite, extremely mutated.\nThis specimen bears a lot of the hallmarks of the female Parasite, including the birthing channel at the end of its tail-like abdomen. However, it is much larger than any Parasite could get. Additionally, this subject can produce an excess of its corrosive bile and project it from its mouth. That's something Parasites do not do. Anywhere. So that means the Pirates are making bioweapons out of creatures.\nMy scans are detecting a mutagenic substance present in this queen's nervous system. Can't match it against anything in the Federation database. I'm going to have to study this when I'm able to devote more time to [shake]not dying![/shake]";
    }
    if (arg0 == 76)
    {
        return "Morphology: Flaahgra\nFlaahgra is the source of the toxic waters found in the Chozo Ruins. Flaahgra is a mutant Bloodflower that has evolved to extend out of its bud and grow a brand new body. This new body is aggressive, strong, and has high defenses. Flaahgra has roots planted deep in the structures of the Chozo Ruins, and it will control these roots to attack from afar. My scans indicate that Flaahgra is vulnerable to most weapons, but must be attacked on its head. The water in the Chozo Ruins can be purified upon Flaahgra's destruction.";
    }
    if (arg0 == 77)
    {
        return "Morphology: Thardus\nA big pile of rocks, huh? Thardus started as that; a pile of rocks. Then, Phazon veered its ugly face towards this pile of rocks, and thus, Thardus was born. Having no true living host, the evil aggression and power of Phazon is showcased in its control of these boulders. My scans indicate that Thardus is additionally using Chozo technology similar to both the Morph Ball and Spider Ball abilities. There is a chance that I can extract the Chozo technology from Thardus's husk upon defeat!";
    }
    if (arg0 == 78)
    {
        return "Morphology: Omega Pirate\nThe biggest, baddest, angriest, most Phazon-filled Elite Pirate of them all. The power and intellect on this pirate is absolutely insane - Not only is it a skilled warrior, but I have noticed it speaking my language, among others. This is likely the most intelligent and grounded being to be infused with so much Phazon, as it still thinks rationally and obeys commands. This piques my curiosity as to whether there may be a good, productive use for Phazon.";
    }
    if (arg0 == 79)
    {
        return "Morphology: Meta Ridley\n[shake]HOW IS HE ALIVE???[/shake]\nI swear I killed him on Zebes... It looks like the Pirates managed to resurrect him by infusing a number of cybernetic appendages and armor plating to his body. Scans indicate his chest area has thinner armor plating; just as well, there's hardly any heart to protect anyway. I also detect a number of weapons systems infused, including a Seeker Missile Launcher, a fiery Plasma Beam generator, a Meson Grenade Launcher, and a Firewave Projector attached to his talons. Plus, his claws look reinforced. Dangerous in melee range, dangerous from a distance. Steel yourself, Samus... Don't let it get to you.";
    }
    if (arg0 == 80)
    {
        return "Morphology: Metroid Prime Exo\nWhat is this thing? Why does it have Pirate Trooper technology in its arsenal? How is it living within so much Phazon?\nThe Metroid Prime's exoskeleton is similar to that of the Space Pirate Troopers. The armor takes 4 different forms: Kinetic, Electric, Frost, and Plasma. It will use attacks based on these elements, but it also will have a distinct weakness to whatever element it is currently utilizing.  I can sense a sinister being within this exoskeleton, and it is my duty to keep a true peace in space.";
    }
    if (arg0 == 81)
    {
        return "Morphology: Metroid Prime Core\nThis is it. This is the source of the Phazon. This is the embodiment of evil and suffering. This is the being that wiped out and punished the unlucky Chozo of Tallon IV.\nThe Metroid Prime is invulnerable to all conventional weapons. However, this follows the same trend as the exoskeleton - It is weak to the weapon it is using. The weapon, in this case, is pure Phazon.\nI have serious doubts that this is actually a Metroid. Perhaps it is imitating the life cycle of Metroids? I'm not sure, but I am confident that it is what spawned all the Phazon Hunters here; as it is able to spawn Phazon Hunter larvae with ease.";
    }
    return "Null";
}

function cursor_helmet(arg0 = abs(ds_zero("Varia Suit")) + abs(ds_zero("Gravity Suit")) + abs(ds_zero("Phazon Suit")))
{
    if (!var_exists("helmet") || global.key_accept || global.key_cancel)
    {
        helmet = "Front";
    }
    if (global.key_down)
    {
        helmet = "Down";
    }
    if (global.key_up)
    {
        helmet = "Up";
    }
    if (global.key_left)
    {
        helmet = "Left";
    }
    if (global.key_right)
    {
        helmet = "Right";
    }
    if (helmet == "Front")
    {
        return "[spr_cursor_front_" + string(arg0) + "]";
    }
    if (helmet == "Down")
    {
        return "[spr_cursor_down_" + string(arg0) + "]";
    }
    if (helmet == "Up")
    {
        return "[spr_cursor_up_" + string(arg0) + "]";
    }
    if (helmet == "Left")
    {
        return "[spr_cursor_left_" + string(arg0) + "]";
    }
    if (helmet == "Right")
    {
        return "[spr_cursor_right_" + string(arg0) + "]";
    }
}

function aeon_descriptions(arg0)
{
    switch (arg0)
    {
        case "Debris Scope":
            return "Reveals special blocks within a small radius.";
            break;
        case "Velocity Beam":
            return "Increases the traveling speed of Beam Weapons.";
            break;
        case "Auto-Logger":
            return "Automatically records new creatures and lore into the logbook.";
            break;
        case "Speed-Ball":
            return "Allows the Morph Ball to roll faster than normal walking speed.";
            break;
        case "Offensive Boost":
            return "Allows the Boost Ball to deal damage to enemies. Damage is exchanged with the target if they are not destroyed.";
            break;
        case "Seeker Beam":
            return "Creates target-homing behavior in the Arm Cannon's Beam weapons.";
            break;
        case "Seeker Missile":
            return "Adds heat-seeking capabilities to the Arm Cannon's Missiles.";
            break;
        case "Maximum Power":
            return "Increases the power of all weapons and equipment.";
            break;
        case "Chain Missile":
            return "Shoot Missiles faster by rapid-firing.";
            break;
        case "Boost-Sprint":
            return "Exit Morph Ball mode after a successful Boost Ball. Will cause the user to sprint at high speeds.";
            break;
        case "Ricochet Cannon":
            return "Applies ricochet capabilities to the Arm Cannon's Power Beam and Ice Beam.";
            break;
        case "Aqua-Recovery":
            return "Restore Energy when standing still in water.";
            break;
        case "Blazing Spider":
            return "The Spider Ball will leave a trail of plasma in its path.";
            break;
        case "Proximity Beam":
            return "A powerful, close-range burst of energy will be released when using the Charge Beam.";
            break;
        case "Quick Bombs":
            return "Morph Ball Bombs will detonate more quickly.";
            break;
        case "Flare Ball":
            return "Burning embers are released upon use of the Boost Ball.";
            break;
        case "Reinforced Suit":
            return "Increases the defensive capabilities of the Power Suit.";
            break;
        case "Energy Generator":
            return "Automatically recovers Energy at a slow pace.";
            break;
        case "Missile Generator":
            return "Automatically regenerates Missile ammunition at a slow pace.";
            break;
        case "Power Bomb Generator":
            return "Automatically regenerates Power Bomb ammunition at a slow pace.";
            break;
        case "Gatling Beam":
            return "Raises the firing rate of Beam Weapons.";
            break;
        case "Blaze Missile":
            return "Grants the ability to burn enemies with Missiles.";
            break;
        case "Frost Missile":
            return "Grants the ability to freeze enemies with Missiles.";
            break;
        case "Shock Missile":
            return "Grants the ability to paralyze enemies with Missiles.";
            break;
        case "Static Power Bomb":
            return "Enhances the Power Bomb with an electrified, destructive shock.";
            break;
        case "Flare Power Bomb":
            return "Enhances the Power Bomb with a firey, destructive energy.";
            break;
        case "Frost Power Bomb":
            return "Enhances the Power Bomb with a freezing, destructive force.";
            break;
        case "Hefty Beam":
            return "Thickens and slows Beam equipment to become more powerful in exchange for accuracy.";
            break;
        case "Bountiful Pickups":
            return "Doubles the chance that pickups will spawn.";
            break;
        case "Static Bomb":
            return "Electrifies the explosion of the Morph Ball Bomb to paralyze targets.";
            break;
        case "Flare Bomb":
            return "Ignites the explosion of the Morph Ball Bomb in flames to burn targets.";
            break;
        case "Frost Bomb":
            return "Cools the explosion of the Morph Ball Bomb to freeze targets.";
            break;
        case "Chip Bomb":
            return "Morph Ball Bombs can deal minor damage before they explode.";
            break;
        case "Charge Module":
            return "Increases the efficiency of the Charge Beam, allowing shorter charge times.";
            break;
        case "Mine Bomb":
            return "Bombs will detonate immediately when making contact with a target.";
            break;
        case "Side-Dash":
            return "Jump once more after using the Space Jump to execute a backflip move.";
            break;
        case "Damage Discharge":
            return "Releases destructive energy when injured, damaging nearby adversaries.";
            break;
        case "Boost Extender":
            return "Prolongs the effect of the Boost Ball when the Morph Ball takes off.";
            break;
        case "Boost Charger":
            return "Halves the amount of time needed to charge the Boost Ball.";
            break;
        case "Pickup-Poison":
            return "Collecting Pick-Ups will leave behind a damaging cloud of poison that can injure targets.";
            break;
        case "Cleeted Boots":
            return "Helps keep footing when struck; the effects of knock-back will be nullified after taking minor or average damage.";
            break;
        case "Screw Inferno":
            return "The Screw Attack will release embers that burn nearby targets.";
            break;
        case "Screw Shock":
            return "The Screw Attack will shock and paralyze nearby targets.";
            break;
        case "Screw Blizzard":
            return "The Screw Attack will emit sub-zero particles that freeze nearby targets.";
            break;
        case "Death Ball":
            return "The Morph Ball will emit an electrified, damaging aura when rolling.";
            break;
        case "Phazon Shield":
            return "Incoming damage is significantly reduced when the Phazon Beam is charged.";
            break;
        case "Phazon Generator":
            return "Randomly generates pools of Phazon, which can be absorbed to charge the Phazon Beam.";
            break;
        case "Swift Boots":
            return "Makes the user's movement generally faster.";
            break;
    }
    return "Null";
}
