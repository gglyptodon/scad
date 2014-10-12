
#adapter plate for trelock zl500

length = 39.5;
radius = lenght/2;
thickness = 4.5;
width = 17.3;
 
r = 39.5/2;
t = 4.5;
l = 17.3;
fudge = 0.1;
module platform(length,thickness,width){
intersection(){
	translate([length/2,width/2,0])cylinder(r=length/2,thickness+3,15, center=false);
	translate([0,1,3])cube([length,width,3.8], center=false);
}
}
platform(length, thickness, width);