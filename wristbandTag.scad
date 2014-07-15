module nfc(){
	color("green")
	linear_extrude(height=0.6)
	circle(r=25/2);
}

module plate(){
	difference(){
	color("red")
	linear_extrude(height=2.0){
		minkowski(){
			circle(r=5);
			square(18, center=true);
		}
	}
	rotate([0,90,0]){
		translate([-2.5,10,0])
		cylinder(h=30,r=1.6,center=true);
		translate([-2.5,-10,0])
		cylinder(h=30,r=1.6,center=true);
	}
	rotate([0,50,0]){
		translate([-8.5,10,0])
		cylinder(h=30,r=2,center=true);
		translate([-8.5,-10,0])
		cylinder(h=30,r=2,center=true);
	}
	rotate([0,-50,0]){
		translate([8.5,10,0])
		cylinder(h=30,r=2,center=true);
		translate([8.5,-10,0])
		cylinder(h=30,r=2,center=true);
	}
}
translate([-20/2,7.5,0]){
	cube([20,1,3]);
}
translate([-20/2,-8.5,0]){
	cube([20,1,3]);
}

translate([-10/2,11.5,0]){
	cube([10,1.5,3]);
}
translate([-10/2,-13,0]){
	cube([10,1.5,3]);
}
translate([-20/2,-8.5,0]){
	cube([20,1,3]);
}
}
difference(){
plate();
translate([0,0,0.3])
nfc();
}