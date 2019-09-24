/// @description Karakter hareketi ve animasyonu

// Klayve girişi
sag = keyboard_check(vk_right);
sol = -keyboard_check(vk_left);
zipla = keyboard_check_pressed(vk_space);

// Girişe tepki
hareket_yonu = sol + sag;
if hareket_yonu != 0 {
    yuz = hareket_yonu;
}
yatay_hiz = hareket_yonu * hareket_hizi;
if (dikey_hiz < 10) dikey_hiz += yer_cekimi;

if (place_meeting(x,y+1,o_kati))
{
    dikey_hiz = zipla * -ziplama_hizi
}

// yatay temas
if (place_meeting(x+yatay_hiz,y,o_kati))
{
    while(!place_meeting(x+sign(yatay_hiz),y,o_kati))
    {
        x += sign(yatay_hiz);
    }
    yatay_hiz = 0;
}
x += yatay_hiz;

// dikey temas
if (place_meeting(x,y+dikey_hiz,o_kati))
{
    while(!place_meeting(x,y+sign(dikey_hiz),o_kati))
    {
        y += sign(dikey_hiz);
    }
    dikey_hiz = 0;
}
y += dikey_hiz;

// sprite animasyonu

image_xscale = yuz;

if (place_meeting(x,y+1,o_kati)) {
    yerde = true;
} else {
    yerde = false
}

if (!yerde) {
    image_speed = 0;
    sprite_index = s_karakter_ziplama;
    if (y > yprevious) {
        image_index = image_number-1;
    }
}
else {
    image_speed = 1;
    if yatay_hiz != 0 {
        sprite_index = s_karakter_yurume;
    } else {
        sprite_index = s_karakter_bekleme;
    }
    
}


