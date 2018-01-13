diff=0.1;
size=10;
extra=size/5;

difference() {
    cube(size);
    translate([extra, extra, extra])
        cube([size-extra*2,size-extra*2,size]);
}

translate([size*1.5,0,0]) {
    cube([size,size,extra]);
    translate([extra+diff/2,extra+diff/2,extra])
        cube([size-extra*2-diff/2,size-extra*2-diff/2,size-extra*2-diff/2]);
}