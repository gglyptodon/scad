//variables
//main block
	bw = 28;
	bl = 24;
	bh = 20;
//small block
	sbw = bw - 11.3;
	sbl = bl;
	sbh = 4;
//hole infos
	rbase = 5/2;
	rtop = 3/2;
	hinset = 5;
	h1x = 11.3;
	h2x = 23;
	h1z = 6;
	h2z = 4;
//extra triangle-esque piece
	tr = 6;
	tl = 4;
	txl = 10;
module tspacer(){
	intersection(){
		cube([bw-sbw,txl,sbh]);
		union(){
			cube([bw-sbw,tl,sbh]);
			translate([0,tr/2+1,-2]) rotate([0,90,0]) cylinder(r=tr,h=bw-sbw);
		}
	}
}

//rotate whole thing and subtract ground
	xtheta = atan(bh/200);

//main
module fullspacer(){
	difference(){
	//remove translate from next line to print at full size
		translate([0,0,-17.5]) rotate([xtheta,0,0]){
			translate([0,-bl,0]) union(){
				//main block
				cube([bw,bl,bh]);
				//small block
				translate([0,0,bh]) cube([sbw,sbl,sbh]);
				//hole 1
				translate([h1x,bl-hinset,bh+sbh]) cylinder(r1 = rbase,r2=rtop,h=h1z);
				//hole 2
				translate([h2x,bl-hinset,bh]) cylinder(r1 = rbase,r2=rtop,h=h2z);
				//semi-trangular spacer
				translate([sbw,0,bh]) tspacer();
			}
		}
		color("red") translate([0,-bl*2,-bh]) cube([bw,bl*2,bh]);
	}
}

mirror([1,1,0])fullspacer();



