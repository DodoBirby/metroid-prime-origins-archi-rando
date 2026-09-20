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
    // -- MW Changes Start
    if (dz("MWLocal"))
    {
        var artifactName = artifact_names(arg0);
        var location = dz("MWArtifact " + artifactName);
        if (location != 0)
        {
            return "The " + artifactName + " is hidden at [NES_Cyan]" + location + "[NES_Peach].";
        }
        return "The " + artifactName + " could not be found on this planet.";
    }
    // -- MW Changes End
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
        return "Impact Crater";
    }
    if (arg0 == 19)
    {
        return "High Command";
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
        return "Metroid Forces";
    }
    if (arg0 == 23)
    {
        return "The Chozo Ghosts";
    }
    if (arg0 == 24)
    {
        return "Compromised";
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
        return "Space Pirate encrypted data decoded.\nLog 01.992.3\nImpossibly, the Zebes base has been taken out. By a lone bounty hunter, no less! Everyone within the base is presumed dead, including our now-former Supreme Leader. Though her reign was fairly short, Mother Brain will presumably be missed.\nHowever, all is not lost! While the mothership Grand Reaper may have been demolished, the research frigates Orpheon, Siriacus, and Vol Paragom were able to retreat, carrying the last of our supply of metroids! The ones on the Frigate Orpheon, among them Specimen Zero, appear to be healthy, but will be put on restricted feeding schedules until supply lines stabilize. The vessel reports a Code Blue at Vortex Outpost; no signs of pursuit.";
    }
    if (arg0 == 1)
    {
        return "Space Pirate encrypted data decoded.\nLog 02.002.2\nHigh Command's first act upon regaining their absolute authority was to send out an alert concerning the Hunter, attached below:\n\n[NES_Red]    --ALL-POINTS ALERT--\n[NES_Yellow]  CLASS PLATINUM-AAA THREAT\n    Bioform [NES_Green]''Samus Aran''[NES_Yellow]\n   Codename: [NES_Green]''The Hunter''\n[NES_Red]  !! EXTERMINATE ON SIGHT !!\n           [spr_cursor_front_1,0]\n[NES_Yellow]Subject is a female homo sapien standing at ~2 meters unarmored. Wields a powered armorsuit of unknown design with integrated arm cannon for energy and ballistics-based projectiles. Armor can fold into a 0.8m sphere and deploy thermonuclear grenades.\n[NES_Green]  REWARD: 2,621,847 SEGURU[NES_Peach]";
    }
    if (arg0 == 2)
    {
        return "Space Pirate encrypted data decoded.\nLog 02.229.2\nIn the process of salvaging what little we can from Zebes, our team detected a massive energy spike from the neighboring Wanderer-class planet Tallon IV. While seeming from a distance to be an unremarkable dying rock, a reconnaissance mission revealed the source of the spike: a gargantuan hotspot of unstable radioactive material with [wave]enormous[/wave] potential. Fate must be smiling upon us, for it appears we have found a suitable replacement for Zebes within the very same star system!";
    }
    if (arg0 == 3)
    {
        if (!dz("Classic Mode"))
        {
            return "Log 03.803.9 - NC\nOn this day, the Space Pirate race has achieved its [shake]ultimate victory!![/shake] By spoofing the connection the Chozo Artifacts hold with the Temple, we managed to break into whatever system manages it all and order it to drain all of its power into the Artifacts, causing the force-field to collapse. The Impact Crater and the meteor within are ripe for plundering!\nSuch a task will have to wait, however. While we have confirmed we can access the meteor, that same field team also confirmed the presence of an overwhelmingly-powerful creature in its core. While it would be preferable to attempt to gain control of it, it will likely attempt to kill us instead, so we will need to assemble the perfect strike team.\nAdditionally, the Artifacts have acquired strange new properties since the collapse of the barrier. [NES_Red]Each Chozo Artifact now grants strange, unique new abilities for its wielder.[NES_Peach] Assuming, of course, said wielder can interface with Chozo technology, which we currently cannot. Science Team wants to crack that before our raid.\n\nCommand has scheduled the assault on the Impact Crater for the end of the cycle. In order to keep interlopers away in the meantime, we've deployed a variation of our [wave]Biometric Statue Security (BSS)[/wave] from Planet Zebes, which is attuned to the three strongest creatures on this planet (excluding Meta Ridley, as the last time he was linked up to one we lost the Zebes base). [NES_Red]In the event that these three bioforms are terminated, the entrance to the Impact Crater will automatically deactivate,[NES_Peach] allowing for evacuation and for the biometric locks to be re-assigned. Of course, it'll always open for someone on the list, so we needn't worry about getting locked out of our own meteor when the time comes.";
        }
        else
        {
            return "Space Pirate encrypted data decoded.\nLog 02.308.0\nField team reports reveal that surrounding the [NES_Yellow]prime[NES_Peach] deposit of material is a bizarre energy field projected by an alien structure built above, presumably Chozo make. Science Team believes that this field is connected to a bunch of pseudo-holographic artifacts we've uncovered while setting up. As such, weaponization research on these artifacts has been dropped in favor of reverse-engineering them. If we break them, so be it, as opening the force-field is our top priority.\n\n[NES_Red][[INFRACTION: ACTIONABLE PUN. RATIONS REDUCED BY 1 CENTIGRAM.][NES_Peach]\n...What pun?\n[NES_Red][[INFRACTION: ADDRESSING DISCIPLINARY NOTES IN OFFICIAL RECORDS. RATIONS REDUCED BY 0.5 GRAMS.][NES_Peach]";
        }
    }
    if (arg0 == 4)
    {
        return "Space Pirate encrypted data decoded.\nLog 02.344.8\nNo matching records of this substance have been found, but the team sent to retrieve a sample codified it as ''Phazon''. Both highly radioactive and a powerful mutagen, phazon is believed to have been introduced to Tallon IV through a meteor impact sometime within the last few decacycles.\nPhazon molecules appear to bind through phazon energy, reinforcing itself with its own radioactive decay in a flagrant disregard of thermodynamics, which our researchers have generally described as ''equally exciting and disturbing''. They have described its mutagenic effects very similarly, with radical changes occurring in mere days rather than generations.\nWe are formally requesting a full Science Team on Tallon IV to take full advantage of this opportunity.";
    }
    if (arg0 == 5)
    {
        return "Space Pirate encrypted data decoded.\nLog 02.401.7\nWe've begun to take our phazon-mining operation full-scale to accommodate our research, and have also begun terraforming nearby zones; Magmoor Caverns will soon boast a geothermal power plant and the Chozo Ruins will be replaced with a glorious new spaceport. While the new phazon-focused Science Team has been cozy on the Orpheon, their new headquarters will be established in Phendrana Drifts, as the arctic climate is perfect for experimenting on metroids. If Command's projections are even partially accurate, we'll surpass Zebes within a decacycle!";
    }
    if (arg0 == 6)
    {
        return "Space Pirate encrypted data decoded.\nLog 02.444.4\nTransfer of the Orpheon's metroid stock to on-planet facilities has been completed. Though 3 had to be put down in a minor breach at landing, the remaining 14 were model bioweapons that didn't get a chance to cause a fuss, including Specimen Zero. High Command is particularly invested in its well-being, given that it's the original bioform pilfered from the G.F.S. Marina and the origin of every metroid we've ever had, through its ability to mitose from beta-ray exposure. They seem to view it as the ''control sample'' for whatever we do with the rabid jelly-sacs.\nSpeaking of, Science Team is eager to begin phazon experiments on metroids. Given that the species feeds directly on raw energy, they've hypothesized that only good things could happen when they are exposed to the substance that breaks physics for prolonged periods of time.\n...Good for us, of course. Beyond being healthy enough to kill things, the wellbeing of the metroids is entirely unimportant.";
    }
    if (arg0 == 7)
    {
        return "Space Pirate encrypted data decoded.\nLog 02.515.8\nLarge swathes of the local parasite population have been sent up to research team Sclera for use as test vermin, which they have proven to excel at. Phazon infusion, when successful, consistently makes subjects bigger, stronger, and more aggressive. A few even grew extra mandibles or poison sacs or suddenly gained the ability to spit fireballs! The main problem, however, is instability. Parasites were picked out specifically for their resilience, and yet not a single one has made it to a fourth infusion. A lot of them die by number 3, and those that survive are so viciously hyperaggressive they have to be put down lest they cause problems.\nClearly, the problem is that our methods are not sophisticated enough. Once we refine the process enough, everything will go smoothly.";
    }
    if (arg0 == 8)
    {
        return "Space Pirate encrypted data decoded.\nLog 02.587.7\nDue to a lack of progress in cracking the Artifact Temple open, we've decided to try digging around our problem, and have moved our mining operations closer to the Impact Crater. Predictably, this caused an immediate increase in our daily yields, which will only grow as we get more personnel and equipment down there.\nHowever, there have also been reports of ''Phazon Madness'', which means we have to dedicate precious resources to making sure our miners don't go crazy instead of using them on important things, like mining more phazon. Until then, mines personnel are advised to keep an eye out for symptoms: loss of equilibrium, erratic respiration, muscle spasms, reproductive dysfunction, and in extreme cases, hallucinations.";
    }
    if (arg0 == 9)
    {
        return "Space Pirate encrypted data decoded.\nLog 02.664.2\nThe Phendrana research outpost, now dubbed ''Glacier One'', is fully operational. Its arctic surroundings make it perfect for experimenting on metroids, as it seems even just sub-zero temperatures are enough to make them sluggish enough to push around without issue, even after phazon infusion. On the other hand, ice buildup from this climate has led to occasional blackouts, and the local predators certainly put our security systems to the test.\nLastly, a concerning pattern has emerged: our metroids are getting weaker. It's hard to say exactly what's causing it between a multitude of factors, but their nigh-invincibility has all but faded from many specimens, both freshly-cloned and pre-existing from the Orpheon. To combat this, Science Team has ordered an immediate transfer of all the healthiest-looking ones to specially-dug quarantine caves in the Mines, away from phazon-handling sites.";
    }
    if (arg0 == 10)
    {
        return "Space Pirate encrypted data decoded.\nLog 02.712.1\nInstallation of security checkpoints is mostly complete, barring the fact that the security doesn't seem to actually be doing much to stop the wildlife. They're not opening the doors, so therefore they're either sneaking in with personnel or using subterranean tunnels, the latter of which we have found several examples of. They're nothing a metal plate or a big space pirate cork can't fix, but it's impossible to know just how many there are.\nWorse than the possibility of infiltration by wildlife, though, is the possibility of test subjects escaping. While realistically the surrounding tundra would render such a thing a non-issue, the possibility of a metroid escaping the facility through some hidden tunnel is something that needn't be taken lightly.\nScience Team intends to deploy security drones across bases and other key locations. Until then, troops are ordered to report all security flaws to their superiors. Our facilities must be impenetrable, both from without and within.";
    }
    if (arg0 == 11)
    {
        return "Space Pirate encrypted data decoded.\nLog 02.891.0\nProject ''Meta Ridley'', the cybernetic reconstruction of Geoform 187, has been a glorious success. Though his defeat on Zebes left him mangled and on the brink of death, Command took pity on him and ordered a full reconstruction. The full list of metagenetic improvements ordered was completed within a cycle, much to 187's extremely violent protest. In fact, it likely could've been done in half the time if he had just [shake]stopped killing the scientists,[/shake] but in the end his pain and our casualties were worth it.\n187 now boasts vastly improved defenses from his previous form, as well as interstellar-grade mobility, now able to survive and traverse the vacuum of space. Impromptu weapons tests in the moments after his completion (no survivors) have also demonstrated the drastic lethality boost his new weapons systems provide. Though he may have been demoted from his previous lofty title, we believe ''Meta Ridley'' will relish his new position on our security force.";
    }
    if (arg0 == 12)
    {
        return "Space Pirate encrypted data decoded.\nLog 02.957.2\nScience Team has made a lot of headway in understanding phazon, and their bolstered confidence has led them to approve Space Pirate testing. Codenamed ''Project Helix'', the goal is to create radical new pirate genomes of awesome power, weaponizing the mutagenic potential of phazon. Preliminary tests have been less than promising; if the infusion process doesn't turn their neurons to sludge, they come out far too rabid to be controlled and need to be euthanized. This has not dissuaded Science Team, however, whom are convinced that the infusion process simply needs to be refined.\nThe metroid division, however, has found much more success. Phazon infusion has led to the creation of newer, taller metroids with resistance to colder climates and more complex hunting behavior. While it certainly would've been nice to discover a little earlier, [shake]before[/shake] our metroid stock degraded, these ''Hunter Metroids'' are nonetheless quite promising.";
    }
    if (arg0 == 13)
    {
        return "Space Pirate encrypted data decoded.\nLog 03.001.9\nWhile initial Project Helix experiments were an unmitigated disaster, a major breakthrough by research team Sclera on the Orpheon managed to turn things around. Sclera managed to isolate an alternate ''strain'' of phazon, codenamed Vertigo, which is far more agreeable with nervous systems and reduces the senseless ferocity to a mere background malice. After parasite testing proved fruitful, a batch was shipped planetside and the results speak for themselves. Our new [wave]''Elite Pirates''[/wave] are now ready for field testing, and Science Team is already brainstorming exciting new weapons systems to further assert their total superiority!";
    }
    if (arg0 == 14)
    {
        return "Space Pirate encrypted data decoded.\nLog 03.156.9\nA major containment failure in the metroid quarantine during a large shipment from Sclera resulted in a lone metroid sinking its teeth into a massive batch of Vertigo Phazon, and over the next 24 hours it underwent an unprecedented metamorphosis into what we now refer to as the ''Metroid Prime''. Outside of discoloration and radical physical deformities, it has seen radical increases in strength, an endless appetite for phazon, and full immunity to cold.\nHowever, its most fascinating new trait is the ability to assimilate technology into itself. During a containment breach after its transformation (one of several), it found an abandoned prototype energy rifle and ate the thing whole. After its recontainment, it was observed to emit the same ring-shaped energy blasts as the rifle.\nNeedless to say, High Command is ecstatic and wants us to learn everything we can about this new weapon.";
    }
    if (arg0 == 15)
    {
        return "Space Pirate encrypted data decoded.\nLog 03.222.8\nExcursions into the Chozo Ruins have led to the discovery of various strange artifacts, many of which have revealed themselves to be weapons technology upon closer analysis. In fact, we have been able to determine that many of these modules are either an exact match for, or uncannily similar to, almost every weapon used by the Hunter according to our collected data on her. It is very likely her armor is a heavily-modified Chozodian Battlesuit.\nAttempts are being made to reverse-engineer her arsenal based on what we've learned. While Beam weapons have been simple to recreate, no progress has been made on literally anything else, unless the shattered skeletons and gruesome disfigurement of the Morph Ball test subjects counts as ''progress''. Science Team has decided the Beams are good enough.\n\nADDENDUM: Discussion of the Morph Ball Incident is now prohibited. Maybe it was funny the first hundred times, but at this point the dead steed has been flayed so thoroughly that even the bones have returned to dust.";
    }
    if (arg0 == 16)
    {
        return "Space Pirate encrypted data decoded.\nLog 03.232.8\nAmong all successful Elite Pirates, Elite Pirate Upsilon has stood out for their absurd tolerance for phazon. They've taken in quantities that would cause any other creature on the planet to explode and have shown absolutely zero signs of cognitive decline in the process. If anything, the absurd phazon intake has proven to be strictly beneficial!\nUpsilon appears to have manifested a short-range teleportation ability, which they typically use to access the nearest phazon deposit to rejuvenate themself, which is another incredible ability they seemingly manifested out of nowhere. The only thing that could possibly be considered a downside is their exponentially-increased size, but they are capable of circumventing many of the complications involved with their teleportation ability.\nUpsilon, now re-classified as [wave]''Omega Pirate''[/wave], is unquestionably the golden child of Project Helix. The team's only real concern is that Omega Pirate may begin to over-rely on phazon access and use it as a crutch.";
    }
    if (arg0 == 17)
    {
        return "Space Pirate encrypted data decoded.\nLog 03.369.4\nProject Helix has been a resounding success thus far. The Elite Pirates are already one-unit armies in their own right, and even an amoeba could see how revolutionary their strength would be with multiple in the same room. A cadre of them would slot cleanly into the backbone of a pirate army, able to break through even the toughest of choke points. Admittedly, they're lacking in higher brain function from all the phazon infusion, but we've noticed that this violence usually isn't directed at anything that has undergone this process. Although there's potential to exploit this to keep them from friendly fire, the higher-ups claim it's far more efficient to just keep them in cryosleep until they're needed. When the day comes (not if, [shake]when[/shake]) that our work is ready for galactic deployment, it'll likely become a Space Pirate national holiday.\nBecause on that day, the Space Pirates will claim our [shake]ultimate victory.[/shake]";
    }
    if (arg0 == 18)
    {
        return "Space Pirate encrypted data decoded.\nLog 03.377.1\nAttempts to find access to the Impact Crater from below have proven completely fruitless, as it appears the force field extends below the surface. Any attempts to pierce it or otherwise damage it have proven futile, but in the process we discovered a strange quirk: phazon and phazon-infused creatures are capable of passing through it effortlessly, but become trapped within. This suggests that the purpose of this field is not to keep invaders out, but to keep the source of the phazon contained.\nThis was unfortunately discovered the hard way; Metroid Prime breached again, and after taking out dozens of troops and absorbing untold amounts of weapons technology, it made its way to the dig site and promptly got itself stuck behind the field. It tried fruitlessly to escape its new prison, but eventually gave up and delved deeper into the Impact Crater.\nSo now we're down the most powerful metroid we have ever laid eyes on. In order to avoid any more major losses to the Impact Crater, we have completely sealed off the tunnel leading to the containment field. Any further experiments on it are to be done topside.";
    }
    if (arg0 == 19)
    {
        return "Space Pirate encrypted data decoded.\nLog 03.402.5\nScience Team finally gave the go-ahead to attempt to recreate Metroid Prime, but no matter what we try, we can't seem to get it right. The closest we've gotten, specimens referred to as [wave]''Fission Metroids''[/wave], are a far-cry from its strength, but show some promise, splitting under physical stress into two copies resistant to all but whatever ambient Beam energy they align with on creation.\nUnfortunately, High Command isn't impressed. Metroid Prime being AWOL within the Impact Crater is perhaps the worst possible result, given its insatiable appetite for phazon. Additionally, the movement of metroids into quarantine caves that enabled this caused several subjects to drop from records and go missing, including Specimen Zero. They've made it clear that, while they are willing to overlook these hiccups thanks to the results our team has put out, further failure will not be tolerated. Command wants what we promised them, or else.";
    }
    if (arg0 == 20)
    {
        return "Space Pirate encrypted data decoded.\nLog 03.420.7\nResearch into metroid biology has failed to give any meaningful results thus far. We can trace the energy flow from their smaller front-fangs to their quadripartite nucleus, yet we [shake]still[/shake] don't know what this energy is. Their prey doesn't lose blood or any vital fluids. Any neural impulses cease, but the amount of energy extracted from the victim far exceeds what they would provide. It doesn't exist [shake]anywhere[/shake] in the body, but the second it's removed they shrivel into a brittle husk! Science Team is convinced that there's some missing piece here, that the key to recreating the [NES_Red]ultimate bioweapon[NES_Peach] is in the energy they consume before phazon exposure, but what could it possibly be? These forsaken things have fed on every damned thing on the planet, and nothing changes.";
    }
    if (arg0 == 21)
    {
        return "Space Pirate encrypted data decoded.\nLog 03.440.4\nWe believe we have a decent picture on the history of the planet's Chozo population, presumably extinct. It's likely this was once a minor stronghold in the late Chozo Empire, ultimately choked out by the phazon meteor. They attempted to fight it, using their unfathomably advanced technology to construct a one-way barrier around the meteor, but the damage had already been done.\nWe have found many strange artifacts among their ruins, and we believe that these artifacts both serve as its power source, as well as its key, allowing direct passage inside once assembled.\nOnce inside, we will reclaim our lost weapon and enough phazon to power our operation for untold eons. While we would prefer to keep the artifacts intact for later use of this field, we have no qualms with destroying them to kill the power as a plan B. Then, we'll do the same with everything else they built. What right do the dead think they have to command the living?";
    }
    if (arg0 == 22)
    {
        return "Space Pirate encrypted data decoded.\nLog 03.550.6\nIt's becoming increasingly clear that attempting to reproduce that specimen is a pointless endeavor. It would be far more economical to focus on the metroids we have. Metroid numbers can be easily replenished, and with proper training, a small force of attack metroids paired with a Pirate troop would wipe out armies on their own. If we can figure out how to undo the ''Tallon Degradation'' and properly shield them from the cold, we wouldn't even need the Pirate troops! Not to mention that a metroid could hypothetically make a good field battery should we figure out how to harvest the energy from their bodies. There's so many ways that metroids could be harnessed for the good of Pirate domination!";
    }
    if (arg0 == 23)
    {
        return "Space Pirate encrypted data decoded.\nLog 03.664.2\nWhile reports of ghosts in the Chozo Ruins are common (and typically laughed at and subsequently infracted), reports of assault by ghosts with [wave]actual evidence[/wave] are new. Credible testimony has come to light on these Chozo Ghosts, confirming their existence and behavioral pattern (localized blackouts, becoming intangible, immunity to conventional weaponry, fireballs), and thus we have temporarily put all field missions to the Chozo Ruins on hold until we can figure out how to kill ghosts.\nScience Team theorizes that this is in response to our attempts to claim technology and Artifacts (of the Impact Crater variety), presumably not being okay with our forces attempting to open the aforementioned Crater. Science Team is also working on a method to put them back in the grave.";
    }
    if (arg0 == 24)
    {
        return "Space Pirate encrypted data decoded.\nLog 03.894.4\nTo the Hunter: It doesn't matter that you can crack our computer systems. You will die by our hands. Do not bother surrendering, as you will not be spared regardless.\n\nTo everyone else:\nThe Orpheon was compromised due to a mass parasite outbreak, and has crashed into the forest near the Impact Crater. Thankfully, the reactor core had the decency to do its meltdown in the vacuum of space, where it wouldn't get in the way of anything. However, that's not the only ship that made planetfall that day.\nThe Hunter has found us. She has already raided Glacier One and is no doubt coming for the Mines next. High Command would like to remind all troops that Aran's capture, dead or alive, is worth 2.6 million seguru.\nTo make matters worse, she's completely cracked our systems. She can break into any computer in the system with zero effort. None of our secrets are safe, mission-critical or benign. [shake]Kill on sight!![/shake]";
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
            return "Strengthens the impact of the Boost Ball, dealing more damage to enemies.";
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
            return "Restore Energy when in water.";
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
