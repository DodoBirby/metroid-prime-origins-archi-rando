function mw_set_sprite_to_custom_item()
{
    var item = ds_map_find_value(global.mwLocations, self.key);
    if (is_undefined(item))
    {
        // varia as temporary since I don't have an archi sprite yet
        sprite_index = sprItemVaria;
        image_speed = 0;
        self.upgrade_name = "Archipelago Item";
        self.description = "You feel as if this item is not for you.";
        return;
    }
    self._fanfare = bgmFanfareItem;
    self.upgrade_name = item;
    self.description = item_descriptions(item);
    self.is_aeon = false;
    switch item
    {
        case "Morph Ball Bomb":
            sprite_index = sprItemBomb;
            break;
        case "Morph Ball":
            sprite_index = sprItemMorphBall;
            break;
        case "Charge Beam":
            sprite_index = sprItemChargeBeam_strip3;
            break;
        case "Wave Beam":
            sprite_index = sprItemWave_strip3;
            break;
        case "Ice Beam":
            sprite_index = sprItemIce_strip3;
            break;
        case "Plasma Beam":
            sprite_index = sprItemPlasma_strip3;
            break;
        case "Spazer":
            sprite_index = sprItemSpazer;
            break;
        case "Wavebuster":
            sprite_index = sprItemWavebuster;
            break;
        case "Ice Spreader":
            sprite_index = sprItemIceSpreader;
            break;
        case "Incinerator":
            sprite_index = sprItemFlamethrower;
            break;
        case "Varia Suit":
            sprite_index = sprItemVaria;
            break;
        case "Gravity Suit":
            sprite_index = sprItemGravity_strip3;
            break;
        case "Phazon Suit":
            sprite_index = sprItemPhazon_strip3;
            break;
        case "Boost Ball":
            sprite_index = sprItemBoostBall;
            break;
        case "Space Jump Boots":
            sprite_index = sprItemSpaceJump_strip3;
            break;
        case "Screw Attack":
            sprite_index = sprItemScrewAttack_strip3;
            break;
        case "Spider Ball":
            sprite_index = sprItemSpiderBall;
            break;
        case "Grapple Beam":
            sprite_index = sprItemGrappleBeam;
            break;
        case "Super Missile":
            sprite_index = sprItemSuperMissile_strip3;
            break;
        case "Artifact of Truth":
            sprite_index = sprChozoArtifacts;
            image_index = 0;
            image_speed = 0;
            self.description = item_descriptions("Artifact 1");
            self._fanfare = bgmFanfareArtifact;
            self.is_aeon = true;
            break;
        case "Artifact of Strength":
            sprite_index = sprChozoArtifacts;
            image_index = 1;
            image_speed = 0;
            self.description = item_descriptions("Artifact 2");
            self._fanfare = bgmFanfareArtifact;
            self.is_aeon = true;
            break;
        case "Artifact of Elder":
            sprite_index = sprChozoArtifacts;
            image_index = 2;
            image_speed = 0;
            self.description = item_descriptions("Artifact 3");
            self._fanfare = bgmFanfareArtifact;
            self.is_aeon = true;
            break;
        case "Artifact of Wild":
            sprite_index = sprChozoArtifacts;
            image_index = 3;
            image_speed = 0;
            self.description = item_descriptions("Artifact 4");
            self._fanfare = bgmFanfareArtifact;
            self.is_aeon = true;
            break;
        case "Artifact of Lifegiver":
            sprite_index = sprChozoArtifacts;
            image_index = 4;
            image_speed = 0;
            self.description = item_descriptions("Artifact 5");
            self._fanfare = bgmFanfareArtifact;
            self.is_aeon = true;
            break;
        case "Artifact of Chozo":
            sprite_index = sprChozoArtifacts;
            image_index = 5;
            image_speed = 0;
            self.description = item_descriptions("Artifact 6");
            self._fanfare = bgmFanfareArtifact;
            self.is_aeon = true;
            break;
        case "Artifact of Warrior":
            sprite_index = sprChozoArtifacts;
            image_index = 6;
            image_speed = 0;
            self.description = item_descriptions("Artifact 7");
            self._fanfare = bgmFanfareArtifact;
            self.is_aeon = true;
            break;
        case "Artifact of Nature":
            sprite_index = sprChozoArtifacts;
            image_index = 7;
            image_speed = 0;
            self.description = item_descriptions("Artifact 8");
            self._fanfare = bgmFanfareArtifact;
            self.is_aeon = true;
            break;
        case "Artifact of Sun":
            sprite_index = sprChozoArtifacts;
            image_index = 8;
            image_speed = 0;
            self.description = item_descriptions("Artifact 9");
            self._fanfare = bgmFanfareArtifact;
            self.is_aeon = true;
            break;
        case "Artifact of World":
            sprite_index = sprChozoArtifacts;
            image_index = 9;
            image_speed = 0;
            self.description = item_descriptions("Artifact 10");
            self._fanfare = bgmFanfareArtifact;
            self.is_aeon = true;
            break;
        case "Artifact of Spirit":
            sprite_index = sprChozoArtifacts;
            image_index = 10;
            image_speed = 0;
            self.description = item_descriptions("Artifact 11");
            self._fanfare = bgmFanfareArtifact;
            self.is_aeon = true;
            break;
        case "Artifact of Newborn":
            sprite_index = sprChozoArtifacts;
            image_index = 11;
            image_speed = 0;
            self.description = item_descriptions("Artifact 12");
            self._fanfare = bgmFanfareArtifact;
            self.is_aeon = true;
            break;
        case "Energy Tank":
            self._fanfare = bgmFanfareMinorItem;
            sprite_index = sprItemEnergyTank_strip3;
            break;
        case "Power Bomb":
            self._fanfare = bgmFanfareMinorItem;
            sprite_index = sprItemPowerBomb_strip3;
            break;
        case "Missile Tank":
            self._fanfare = bgmFanfareMinorItem;
            sprite_index = sprItemMissile_strip3;
            self.description = item_descriptions("Missile");
            break;
        default:
            sprite_index = spr_hive_mecha;
            self.description = "I've messed something up here.";
            break;
    }
}