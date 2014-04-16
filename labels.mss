/* LABELS.MSS CONTENTS:
 * - place names
 * - area labels
 * - waterway labels 
 */

/* Font sets are defined in palette.mss */

/* Mapnik does not yet support character-spacing adjustments for 
   labels placed along a line. We can fake this using the replace()
   function in the text-name parameter by replacing each character
   with itself followed by one or more spaces. */

// =====================================================================
// AREA LABELS
// =====================================================================

#area_label {
  // Bring in labels gradually as one zooms in, bases on polygon area
  [zoom>=10][area>102400000],
  [zoom>=11][area>25600000],
  [zoom>=13][area>1600000],
  [zoom>=14][area>320000],
  [zoom>=15][area>80000],
  [zoom>=16][area>20000],
  [zoom>=17][area>5000],
  [zoom>=18][area>=0] {
    text-name: "[name]";
    text-halo-radius: 1;
    text-face-name:@sans;
    text-size: 11;
    text-wrap-width:30;
    text-fill: #888;
    text-halo-fill: #fff;
    // Specific style overrides for different types of areas:
    [type='park'][zoom>=10] {
      text-face-name: @sans_lt_italic;
      text-fill: @park * 0.6;
      text-halo-fill: lighten(@park, 10);
    }
    [type='golf_course'][zoom>=10] {
      text-fill: @sports * 0.6;
      text-halo-fill: lighten(@sports, 10);
    }
    [type='cemetery'][zoom>=10] {
      text-fill: @cemetery * 0.6;
      text-halo-fill: lighten(@cemetery, 10);
    }
    [type='hospital'][zoom>=10] {
      text-fill: @hospital * 0.6;
      text-halo-fill: lighten(@hospital, 10);
    }
    [type='college'][zoom>=10],
    [type='school'][zoom>=10],
    [type='university'][zoom>=10] {
      text-fill: @school * 0.6;
      text-halo-fill: lighten(@school, 10);
    }
    [type='water'][zoom>=10] {
      text-fill: @water * 0.6;
      text-halo-fill: lighten(@water, 10);
    }
  }
  [zoom=15][area>1600000],
  [zoom=16][area>80000],
  [zoom=17][area>20000],
  [zoom=18][area>5000] {
    text-name: "[name]";
    text-size: 13;
    text-wrap-width: 60;
    text-character-spacing: 1;
    text-halo-radius: 1;
  }
  [zoom=16][area>1600000],
  [zoom=17][area>80000],
  [zoom=18][area>20000] {
    text-size: 15;
    text-character-spacing: 2;
    text-wrap-width: 120;
  }
  [zoom>=17][area>1600000],
  [zoom>=18][area>80000] {
    text-size: 20;
    text-character-spacing: 3;
    text-wrap-width: 180;
  }
}
   
#poi[type='university'][zoom>=15],
#poi[type='hospital'][zoom>=16],
#poi[type='school'][zoom>=17],
#poi[type='library'][zoom>=17] {
  text-name:"[name]";
  text-face-name:@sans;
  text-size:10;
  text-wrap-width:30;
  text-fill: @poi_text;
}


/* ================================================================== */
/* WATERWAY LABELS
/* ================================================================== */

#waterway_label[type='river'][zoom>=13],
#waterway_label[type='canal'][zoom>=15],
#waterway_label[type='stream'][zoom>=15] {
  text-name: '[name]';
  text-face-name: @sans_italic;
  text-fill: @water * 0.75;
  text-halo-fill: fadeout(lighten(@water,5%),25%);
  text-halo-radius: 1;
  text-placement: line;
  text-min-distance: 400;
  text-size: 10;
  [type='river'][zoom=14],
  [type='canal'][zoom=16],
  [type='stream'][zoom=18] {
    text-name: "[name].replace('([\S\ ])','$1 ')";
  }
  [type='river'][zoom=15],
  [type='canal'][zoom=17] {
    text-size: 11;
    text-name: "[name].replace('([\S\ ])','$1 ')";
  }
  [type='river'][zoom>=16],
  [type='canal'][zoom=18] {
    text-size: 14;
    text-name: "[name].replace('([\S\ ])','$1 ')";
    text-spacing: 300;
  }
}

/* ================================================================== */
/* ROAD LABELS
/* ================================================================== */

#motorway_label[zoom>=11][zoom<=14][reflen<=8] {
  shield-name: "[ref]";
  shield-size: 9;
  shield-face-name: @sans_bold;
  shield-fill: #fff;
  shield-file: url(img/shield-motorway-1.png);
  [type='motorway'] {
    [reflen=1] { shield-file: url(img/shield-motorway-1.png); }
    [reflen=2] { shield-file: url(img/shield-motorway-2.png); }
    [reflen=3] { shield-file: url(img/shield-motorway-3.png); }
    [reflen=4] { shield-file: url(img/shield-motorway-4.png); }
    [reflen=5] { shield-file: url(img/shield-motorway-5.png); }
    [reflen=6] { shield-file: url(img/shield-motorway-6.png); }
    [reflen=7] { shield-file: url(img/shield-motorway-7.png); }
    [reflen=8] { shield-file: url(img/shield-motorway-8.png); }
  }
  [type='trunk'] {
    [reflen=1] { shield-file: url(img/shield-trunk-1.png); }
    [reflen=2] { shield-file: url(img/shield-trunk-2.png); }
    [reflen=3] { shield-file: url(img/shield-trunk-3.png); }
    [reflen=4] { shield-file: url(img/shield-trunk-4.png); }
    [reflen=5] { shield-file: url(img/shield-trunk-5.png); }
    [reflen=6] { shield-file: url(img/shield-trunk-6.png); }
    [reflen=7] { shield-file: url(img/shield-trunk-7.png); }
    [reflen=8] { shield-file: url(img/shield-trunk-8.png); }
  }
  [zoom=11] { shield-min-distance: 60; } //50
  [zoom=12] { shield-min-distance: 80; } //60
  [zoom=13] { shield-min-distance: 120; } //120
  [zoom=14] { shield-min-distance: 180; }
}

#motorway_label[type='motorway'][zoom>9],
#motorway_label[type='trunk'][zoom>9] {
  text-name:"[name]";
  text-face-name:@sans_bold;
  text-placement:line;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:10;
  [zoom=11] { text-min-distance:70; }
  [zoom=12] { text-min-distance:80; }
  [zoom=13] { text-min-distance:100; }
}

#mainroad_label[type='primary'][zoom>12],
#mainroad_label[type='secondary'][zoom>13],
#mainroad_label[type='tertiary'][zoom>13] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:11;
}

#minorroad_label[zoom>=15] {
  text-size:9;
  text-fill:@road_text;
  [zoom>=17]{
    text-size:12;
  }
  [zoom>=18]{
    text-size:14;
  }
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:11;
}

/* ================================================================== */
/* ONE-WAY ARROWS
/* ================================================================== */

#motorway_label[oneway!=0][zoom>=16],
#mainroad_label[oneway!=0][zoom>=16],
#minorroad_label[oneway!=0][zoom>=16] {
  marker-placement:line;
  marker-max-error: 0.5;
  marker-spacing: 200;
  marker-file: url(img/icon/oneway.svg);
  [oneway=-1] { marker-file: url(img/icon/oneway-reverse.svg); }
  [zoom=16] { marker-transform: "scale(0.5)"; }
  [zoom=17] { marker-transform: "scale(0.75)"; }
}


/* ****************************************************************** */
/*
#continent {
  [place = 'continent'][zoom >= 1][zoom < 3] {
    text-name: "[name]";
    text-size: 10;
    text-fill: #9d6c9d;
    text-face-name: @book-fonts;
    text-halo-radius: 1;
    text-wrap-width: 20;
  }
}

*/
.country {
  [place = 'continent'][zoom >= 2][zoom < 4] {
    text-name: "[name]";
    text-size: 12;
    text-fill: grey;
    text-face-name: @sans_italic;
    text-halo-radius: 1;
    text-wrap-width: 20;
    text-label-position-tolerance: 20;
  }
  [place = 'country'][zoom >= 2][zoom < 6] {
    text-name: "[name]";
    text-size: 8;
    text-fill: #6c216c;
    text-face-name: @sans_italic;
    text-halo-radius: 1;
    text-wrap-width: 20;
    text-label-position-tolerance: 10;
    [zoom=5] {
      text-size: 11;
    }
  }
}

.state {
  [place = 'state'][zoom >= 5][zoom < 9] {
    text-size: 8;
    text-fill: #6c216c;
    text-face-name: @sans;
    text-halo-radius: 1;
    text-wrap-width: 0;
text-name: "[name]";
    text-label-position-tolerance: 10;
    [zoom >= 7] {
      text-size: 12;
      text-min-distance: 10;
      text-label-position-tolerance: 15;
      text-face-name: @sans_italic;
    }
  }
}

/*
#placenames-islands {
  [zoom >= 4][zoom < 9][way_area>1000000000],
  [zoom >= 5][zoom < 9][way_area>500000000],
  [zoom >= 6][zoom < 9][way_area>100000000],
  [zoom >= 7][zoom < 9][way_area>30000000] {
    text-name: "[name]";
    text-size: 8;
    text-face-name: @oblique-fonts;
    text-halo-radius: 1;
    text-wrap-width: 0;
    text-min-distance: 10;
  }
}
*/
.placenames {
  [place = 'city'] {
    [zoom=4][is_capital='country'] {
        marker-height: 2;
        marker-width: 2;
        marker-fill: #6c216c;
        marker-ignore-placement: true;
    }
    [zoom >= 5][zoom < 15][is_capital='country'],
    [zoom >= 6][zoom < 15] {
[is_capital='country'] { text-size: 11; text-face-name: @sans_bold; }
      text-face-name: @sans;
      text-name: "[nom]";
      text-size: 10;
      text-fill: #000;
text-halo-radius: 2;
   text-halo-fill: fadeout(white, 30%);
[zoom >= 6][zoom <= 7] {
        text-dy: -4;
        marker-height: 3;
        marker-width: 3;
        marker-fill: black;
        marker-ignore-placement: true;
}
      [zoom >= 9] {
        text-size: 12;
      }
      [zoom >= 11] {
        text-name: "[name]";
        text-size: 14;
        text-face-name: @sans_italic;
        text-label-position-tolerance: 10;
      }
    }
  }
  [place = 'town'] {
    [zoom >= 5][is_capital='country'],
    [zoom >= 6] {
[is_capital!=''] {
[is_capital='country'] { text-face-name: @sans_bold; }
}
      text-face-name: @sans;
      text-name: "[nom]";
      text-size: 9;
      text-fill: #000;
      text-halo-radius: 2;
      text-halo-fill: fadeout(white, 30%);
      text-wrap-width: 20;
      text-min-distance: 20;
      text-label-position-tolerance: 5;
      [zoom>=7] {
       text-min-distance: 10;
      }
    }
    [zoom >= 11] {
      text-name: "[nom]";
      [zoom >= 12] { text-name: "[name]"; }
      text-size: 11;
      text-placement-type: simple;
      text-placements: "N,S,NE,SE,NW,SW,11,10,9";
      text-horizontal-alignment: auto;
      text-vertical-alignment: auto;
	  text-label-position-tolerance: 10;
    }
    [zoom >= 14] {
      text-face-name: @sans_italic;
      text-name: "[name]";
      text-size: 14;
      text-fill: #777777;
    }
  }
}

#placenames-small-lz::village [zoom >= 6][zoom <= 11][place = 'village'] { // remplissage dans les faibles zooms (6-11)
text-name: "[nom]";
    text-size: 8.5;
    text-fill: #333;
    text-face-name: @sans;
	text-halo-radius: 1.5;
    text-halo-fill: fadeout(white, 30%);
    text-min-distance: 25;
    text-label-position-tolerance: 5;
}

#peak-lz[zoom >= 6][zoom <= 11][{ // remplissage dans les faibles zooms (6-11)
    text-size: 8.5;
	text-halo-radius: 1.5;
   	text-halo-fill: fadeout(white, 30%);
    text-min-distance: 25;
    text-label-position-tolerance: 10;
  
    text-name: "[name]";
    text-fill: brown;
    text-face-name: @sans_bold;
}

#placenames-small::village [zoom >= 11] {
  [place = 'village'] {
text-name: "[nom]";
    text-size: 8.5;
    text-fill: #333;
    text-face-name: @sans;
text-halo-radius: 1.5;
   text-halo-fill: fadeout(white, 30%);
    text-label-position-tolerance: 5;
    
    [pop>1000],
    [zoom>=12] {
      text-size: 9;
text-halo-radius: 2;
text-label-position-tolerance: 10;
    }
    [zoom >= 15] {
      text-name: "[name]";
      text-size: 12;
      text-fill: #777;
    }
  }
}

#placenames-small::suburb [zoom >= 12] {
[place = 'neighbourhood'][zoom>=14],
[place = 'suburb'] {
    text-name: "[nom]";
    text-size: 8.5;
    text-fill: #666;
    text-face-name: @sans_italic;
text-halo-radius: 1;
   text-halo-fill: fadeout(white, 30%);
    text-label-position-tolerance: 5;
    [zoom >= 15] {
      text-name: "[name]";
      text-size: 12;
    }
  }
}

/*
#placenames-small-lz::smaller [place = 'hamlet'][zoom >= 12] { // remplissage dans les faibles zooms (12 et +)
text-name: "[nom]";
    text-size: 8.5;
    text-fill: #666;
    text-face-name: @book-fonts;
text-halo-radius: 1;
   text-halo-fill: fadeout(white, 30%);
    text-min-distance: 25;
    text-label-position-tolerance: 5;
}*/

#placenames-small::hamlet [zoom >= 14] {
  [place = 'hamlet'],
  [place = 'locality'],
  [place = 'isolated_dwelling'],
  [place = 'farm'] {
text-name: "[nom]";
    text-fill: #666;
    text-face-name: @sans_italic;
text-halo-radius: 1;
   text-halo-fill: fadeout(white, 30%);
    [zoom >= 16] {
      text-name: "[name]";
      text-size: 11;
    }
  }
}

#poi_label_lz[zoom>=13]{
  text-name: "[name]";
  text-face-name: @sans_italic;
  text-halo-radius: 1;
  text-size:9;
  text-fill: @poi-lz;
  text-halo-fill: @poi-lz-halo;
  [zoom>=15]{text-size:10;}
  [zoom>=16]{text-size:12;}
  text-min-distance: 2;
  text-label-position-tolerance: 10;
}