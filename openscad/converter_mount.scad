diam=3.5;
margin=3;
thick=1.5;
angle=45;
corner_offset=[margin+diam/2,margin+diam/2,0];
standoff_thick=1;
standoff_height=6;

// Modules
module hole() cylinder(d=diam, h=thick);
module support() {
    difference() {
        cylinder(d=support_thick,h=beam_height);
        translate([support_thick/-2,support_thick/-2,beam_height-thick*2])
        rotate([0,-45,0])
            cube([support_thick,support_thick,thick*2]);
    }
}

// Base Platform
bdist=[49,35.5,0];
bsize=[bdist[0]+margin*2+diam,bdist[1]+margin*2+diam];
difference() {
    cube([bsize[0],bsize[1],thick]);
    translate(corner_offset) {
        hole();
        translate(bdist)
            hole();
    }
    translate([bsize[0]/4,bsize[1]/4,0])
        cube([bsize[0]/2,bsize[1]/2,thick]);
}

// Converter platform
cdist=[29,53];
csize=[cdist[0]+margin*2+diam,cdist[1]+margin*2+diam];
translate([margin+diam*2,(bsize[1]-csize[1])/2,0])
rotate([0,-1*angle,0]) {
    difference() {
        cube([csize[0],csize[1],thick]);
        translate(corner_offset) {
            hole();
            translate([cdist[0],0,0])
                hole();
            translate([0,cdist[1],0])
                hole();
            translate([cdist[0],cdist[1],0])
                hole();
        }
        translate([csize[0]/4,csize[1]/4,0]) {
            cube([csize[0]/2,csize[1]/2,thick]);
        }
    }
    // Standoffs
    translate(corner_offset) {
        for(i=[0:1]) {
            for(j=[0:1]) {
                translate([cdist[0]*i,cdist[1]*j,0])
                difference() {
                    cylinder(d=diam+standoff_thick*2,h=standoff_height);
                    cylinder(d=diam,h=standoff_height);
                }
            }
        }
    }
}

// Support Beams
support_thick=5;
beam_height=17;
translate([bdist[0]/2,corner_offset[1],0]) {
    support();
    translate([0,bdist[1],0])
        support();
}