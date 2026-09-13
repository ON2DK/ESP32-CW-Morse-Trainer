$fn=72;

// ESP32 CW TRAINER V2 enclosure - revised front/rear panels
// TFT window is PARAMETRIC. Default 60 x 45 mm; verify against exact visible glass area.
pcb_w=189.25;
pcb_d=114.50;
clear=6;
wall=3;
bottom=3;
outer_w=pcb_w+2*clear;   // 201.25 mm
outer_d=pcb_d+2*clear;   // 126.50 mm
case_h=90;
panel_t=3;

tft_win_w=60.0;
tft_win_h=45.0;
tft_x=outer_w/2;
tft_y=59;
ctrl_y=18;

module base(){
    difference(){
        union(){
            cube([outer_w,outer_d,bottom]);
            cube([wall,outer_d,case_h]);
            translate([outer_w-wall,0,0]) cube([wall,outer_d,case_h]);
            cube([outer_w,wall,bottom+5]);
            translate([0,outer_d-wall,0]) cube([outer_w,wall,bottom+5]);
            for(p=[[9,108],[184.25,22.25],[11.75,22.25],[184.75,106.75]])
                translate([clear+p[0],clear+p[1],bottom]) cylinder(h=6,d=8);
        }
        for(p=[[9,108],[184.25,22.25],[11.75,22.25],[184.75,106.75]])
            translate([clear+p[0],clear+p[1],-0.1]) cylinder(h=bottom+6.2,d=3.2);
    }
}

module lid(){
    difference(){
        union(){
            cube([outer_w,outer_d,3]);
            translate([wall+0.4,wall+0.4,-3]) cube([2,outer_d-2*(wall+0.4),3]);
            translate([outer_w-wall-2.4,wall+0.4,-3]) cube([2,outer_d-2*(wall+0.4),3]);
        }
        for(x=[45:12:155]) translate([x,35,-0.1]) cube([6,56,3.2]);
    }
}

module engrave(txt,x,y,size=3.2) {
    translate([x,y,panel_t-0.7]) linear_extrude(height=0.8)
        text(txt,size=size,halign="center",valign="center",font="Liberation Sans:style=Bold");
}

module headphone_icon(x,y,s=1) {
    translate([x,y,panel_t-0.7]) linear_extrude(height=0.8) scale([s,s]) {
        union() {
            difference() {
                circle(r=5.0);
                circle(r=3.6);
                translate([-6,-6]) square([12,6]);
            }
            translate([-5.1,-1.8]) square([1.8,4.5],center=true);
            translate([ 5.1,-1.8]) square([1.8,4.5],center=true);
        }
    }
}

module front_panel(){
    difference(){
        cube([outer_w,case_h,panel_t]);

        translate([tft_x-tft_win_w/2,tft_y-tft_win_h/2,-0.1])
            cube([tft_win_w,tft_win_h,panel_t+0.2]);

        // Bottom row: MENU / VOLUME / HEADPHONE / PADDLE / STRAIGHT
        translate([25,ctrl_y,-0.1]) cylinder(h=panel_t+0.2,d=7.2);
        translate([59,ctrl_y,-0.1]) cylinder(h=panel_t+0.2,d=7.2);
        translate([97,ctrl_y,-0.1]) cylinder(h=panel_t+0.2,d=6.5);
        translate([139,ctrl_y,-0.1]) cylinder(h=panel_t+0.2,d=10);
        translate([178,ctrl_y,-0.1]) cylinder(h=panel_t+0.2,d=10);

        for(x=[7,outer_w-7]) for(z=[7,case_h-7])
            translate([x,z,-0.1]) cylinder(h=panel_t+0.2,d=3.2);

        engrave("CW_TRAINER_V2",outer_w/2,85,4.0);
        engrave("MENU",25,7,2.8);
        engrave("VOLUME",59,7,2.6);
        headphone_icon(97,7,0.72);
        engrave("PADDLE",139,7,2.5);
        engrave("STRAIGHT",178,7,2.3);
    }
}

module rear_panel(){
    difference(){
        cube([outer_w,case_h,panel_t]);
        translate([40,45,-0.1]) cylinder(h=panel_t+0.2,d=12);     // 12V input
        translate([75,45,-0.1]) cylinder(h=panel_t+0.2,d=6.5);    // power switch
        translate([139,40,-0.1]) cube([18,11,panel_t+0.2]);        // USB-C
        for(x=[7,outer_w-7]) for(z=[7,case_h-7])
            translate([x,z,-0.1]) cylinder(h=panel_t+0.2,d=3.2);

        engrave("CW_TRAINER_V2",outer_w/2,82,4.0);
        engrave("12V INPUT",40,28,2.8);
        engrave("POWER",75,28,2.6);
        engrave("USB-C PROGRAM",148,27,2.7);
    }
}

// Uncomment ONE line for interactive preview if desired:
// base();
// lid();
// front_panel();
// rear_panel();
