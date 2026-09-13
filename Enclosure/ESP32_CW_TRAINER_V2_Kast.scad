
$fn=72;
pcb_w=189.25;
pcb_d=114.50;
clear=6;
wall=3;
bottom=3;
outer_w=pcb_w+2*clear;   // 201.25
outer_d=pcb_d+2*clear;   // 126.50
case_h=48;
panel_t=3;

module base(){
    difference(){
        union(){
            cube([outer_w,outer_d,bottom]);
            // side walls only; front/rear panels are separate
            cube([wall,outer_d,case_h]);
            translate([outer_w-wall,0,0]) cube([wall,outer_d,case_h]);
            // rear/front lower retaining lips
            cube([outer_w,wall,bottom+5]);
            translate([0,outer_d-wall,0]) cube([outer_w,wall,bottom+5]);
            // PCB standoffs, positions from KiCad mounting holes
            for(p=[[9,108],[184.25,22.25],[11.75,22.25],[184.75,106.75]])
                translate([clear+p[0],clear+p[1],bottom])
                    cylinder(h=6,d=8);
        }
        // M3 pilot/clearance holes in standoffs and bottom
        for(p=[[9,108],[184.25,22.25],[11.75,22.25],[184.75,106.75]])
            translate([clear+p[0],clear+p[1],-0.1])
                cylinder(h=bottom+6.2,d=3.2);
    }
}

module lid(){
    difference(){
        union(){
            cube([outer_w,outer_d,3]);
            // shallow inner locating rails
            translate([wall+0.4,wall+0.4,-3]) cube([2,outer_d-2*(wall+0.4),3]);
            translate([outer_w-wall-2.4,wall+0.4,-3]) cube([2,outer_d-2*(wall+0.4),3]);
        }
        // ventilation slots above PCB
        for(x=[45:12:155])
            translate([x,35,-0.1]) cube([6,56,3.2]);
    }
}

module front_panel(){
    difference(){
        cube([outer_w,case_h,panel_t]);
        // Hole centers: x positions chosen for a clear front layout
        // DC input 12 mm
        translate([22,24,-0.1]) cylinder(h=panel_t+0.2,d=12);
        // ON/OFF toggle 6.5 mm
        translate([52,24,-0.1]) cylinder(h=panel_t+0.2,d=6.5);
        // rotary encoder 7 mm
        translate([86,24,-0.1]) cylinder(h=panel_t+0.2,d=7);
        // volume pot 7 mm
        translate([120,24,-0.1]) cylinder(h=panel_t+0.2,d=7);
        // paddle 6.35 mm jack: preliminary 10 mm panel hole
        translate([158,24,-0.1]) cylinder(h=panel_t+0.2,d=10);
        // straight key 6.35 mm jack: preliminary 10 mm panel hole
        translate([184,24,-0.1]) cylinder(h=panel_t+0.2,d=10);
        // M3 panel mounting holes
        for(x=[7,outer_w-7]) for(z=[7,case_h-7])
            translate([x,z,-0.1]) cylinder(h=panel_t+0.2,d=3.2);
    }
}

module rear_panel_blank(){
    difference(){
        cube([outer_w,case_h,panel_t]);
        for(x=[7,outer_w-7]) for(z=[7,case_h-7])
            translate([x,z,-0.1]) cylinder(h=panel_t+0.2,d=3.2);
        // USB programming access, deliberately generous rectangular opening
        translate([outer_w/2-9,12,-0.1]) cube([18,12,panel_t+0.2]);
    }
}
