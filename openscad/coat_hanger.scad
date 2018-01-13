bar_length=150;
bar_height=75;
bar_thick=7;
hook_count=3;
hook_angle=45;
hook_thick=5;
hook_length=50;
diam_top=8;
diam_bot=3;
diam_avg=(diam_top+diam_bot)/2;

module hook() {
    rotate([hook_angle,0,0]) {
        cube([hook_thick,hook_length,hook_thick]);
        translate([hook_thick/2,hook_length,hook_thick/2])
        sphere(d=hook_thick*2);
    }
}
module copy_translate(vec=[0,0,0]) {
    children();
    translate(vec)
        children(0);
}

// Back bar
hole_space=bar_length/hook_count;
difference() {
    cube([bar_length, bar_height, bar_thick]);
    translate([hole_space-diam_avg/2,bar_height*.9-diam_avg/2,0]) {
        for(i=[0:hook_count-2]) {
            translate([i*hole_space,0,0])
                cylinder(d1=diam_bot,d2=diam_top,h=bar_thick);
        }
    }
}

// Hooks
hook_space=bar_length/(hook_count+1);
translate([(hook_space/2)-hook_thick,bar_height/4.5,bar_thick/2]) {
    hook_space=hook_space*1.5;
    for(a=[0 : hook_space : hook_space*(hook_count-1)]) {
        translate([a,0,0]) hook();
    }
}