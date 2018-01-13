module peg(sh=3, hh=1, sd=3, hd=6) {
    cylinder(h=sh, d=sd);
    translate([0,0,sh-0.01]) {
        cylinder(h=hh, d=hd);
    }
}

plate_dim = [95,34,2];
hole_diam = 5;

difference() {
    cube(plate_dim, false);
    translate([0,17,-.001]) {
        translate([15,0,0])
            cylinder(h=plate_dim[2]+.002,d=hole_diam);
        translate([47.5,0,0])
            cylinder(h=plate_dim[2]+.002,d=hole_diam);
        translate([80,0,0])
            cylinder(h=plate_dim[2]+.002,d=hole_diam);
    }
}

translate([0,0,plate_dim[2]-0.1]) {
    translate([3,3,0]) {        peg();
        translate([89,0,0])     peg();
        translate([0,28,0])     peg();
        translate([89,28,0])    peg();
    }
}