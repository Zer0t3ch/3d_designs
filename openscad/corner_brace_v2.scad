size=40;
thick=3;
hole_d=5;

module rotate_copy(vec=[0,90,0]) {
    children();
    rotate(vec) children();
}

module hole() cylinder(d=hole_d, h=thick+6);

module hole_array() {
    translate([size/4,size/4,-(thick+1)]) {
        hole();
        translate([size/2,0,0]) hole();
        translate([0,size/2,0]) hole();
        translate([size/2,size/2,0]) hole();
        translate([size/4,size/4,0]) hole();
    }
}

difference() {
    cube(size+thick);
    translate([thick,thick,thick]) {
        cube(size+thick);
        rotate_copy([0,0,-90])
        rotate_copy([0,-90,0])
        hole_array();
    }
}
