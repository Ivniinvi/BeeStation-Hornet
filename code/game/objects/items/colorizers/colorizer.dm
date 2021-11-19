
/obj/item/colorizer
    name = "ERROR Colorizer"
    desc = "This colorizer will apply a new set of colors to an item."
    icon = 'icons/obj/crayons.dmi'
    icon_state = "rainbowcan"

    var/list/allowed_items = list()
    var/apply_icon = null
    var/apply_icon_state = null
    var/apply_item_state = null
    var/apply_righthand_file = null
    var/apply_lefthand_file = null


/obj/item/colorizer/attack_self(mob/user)
    . = ..()
    var/obj/item/O = user.get_inactive_held_item()
    if(O && is_type_in_list(O, allowed_items))
        if(apply_icon)
            O.icon = apply_icon
        if(apply_icon_state)
            O.icon_state = apply_icon_state
        if(apply_item_state)
            O.item_state = apply_item_state
        if(apply_righthand_file)
            O.righthand_file = apply_righthand_file
        if(apply_lefthand_file)
            O.righthand_file = apply_lefthand_file
        to_chat(user, "<span class='notice'>Color applied!</span>")
        qdel(src)
    else
        to_chat(user, "<span class='warning'>This colorizer is not compatible with that item!</span>")
