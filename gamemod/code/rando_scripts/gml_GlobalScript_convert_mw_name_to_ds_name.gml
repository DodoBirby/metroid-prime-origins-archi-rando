function convert_mw_name_to_ds_name(mw_name)
{
    switch mw_name
    {
        case "Artifact of Truth":
            return "Artifact 1";
        case "Artifact of Strength":
            return "Artifact 2";
        case "Artifact of Elder":
            return "Artifact 3";
        case "Artifact of Wild":
            return "Artifact 4";
        case "Artifact of Lifegiver":
            return "Artifact 5";
        case "Artifact of Chozo":
            return "Artifact 6";
        case "Artifact of Warrior":
            return "Artifact 7";
        case "Artifact of Nature":
            return "Artifact 8";
        case "Artifact of Sun":
            return "Artifact 9";
        case "Artifact of World":
            return "Artifact 10";
        case "Artifact of Spirit":
            return "Artifact 11";
        case "Artifact of Newborn":
            return "Artifact 12";
        default:
            return mw_name;
    }
}