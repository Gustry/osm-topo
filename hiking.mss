.elevation::natural[type="peak"][zoom>=12],
.elevation::natural[type="saddle"][zoom>=12]{
	[type = 'peak']{marker-file:url(img/natural-peak.png);}
    [type = 'saddle']{marker-file:url(img/mountain_pass.svg);}
    marker-allow-overlap:false;
    text-name: "[name]";
    text-size: 10;
    text-fill: brown;
    text-dy: 5;
    text-face-name: @sans_bold;
    text-allow-overlap:false;
    ele/text-name: "[ele]";
    ele/text-size: 9;
    ele/text-fill: brown;
    ele/text-dy: 6;
    ele/text-face-name: @sans_italic;
    ele/text-allow-overlap:false;
    [name != ''] {
    	ele/text-dy: 18;
  	}
}

.elevation [zoom>13]{
  [type='survey_point']{
    marker-width:1;
    marker-fill:#000000; 
    marker-type:ellipse;
    ele/text-name: "[ele]";
    ele/text-size: 9;
    ele/text-fill: black;
    //ele/text-dy: 6;
    ele/text-face-name: @sans;
    ele/text-placement-type:simple;
    ele/text-placements:E,8,7;
    ele/text-allow-overlap:false;
  }
}

#hiking_route [zoom>=12]{
  line-width:1;
  line-color:#168;
}

#aerialways {
  [aerialway = 'cable_car'],
  [aerialway = 'gondola'],
  [aerialway = 'goods'] {
    [zoom >= 14] {
     line-pattern-file: url('img/cable_car.png');
      text-name: [name];
       text-placement: line;
       text-face-name: @sans;
	   text-halo-fill: fadeout(white, 50%);
     text-halo-radius: 1;
    }
  }

  [aerialway = 'chair_lift'],
  [aerialway = 'drag_lift'],
  [aerialway = 't-bar'],
  [aerialway = 'j-bar'],
  [aerialway = 'platter'],
  [aerialway = 'rope_tow'] {
     [zoom >= 13] {
      line-pattern-file: url('img/chair_lift.png');
      [zoom >= 16]
      {
       text-name: [name];
       text-placement: line;
       text-face-name: @sans;
	   text-halo-fill: fadeout(white, 50%);
       text-halo-radius: 1;
      }
    }
  }
}

#topo_name[zoom>=14] {
  //polygon-fill:#000000;
  name/text-name: [name];
  name/text-placement: interior;
  name/text-face-name: @sans;
  name/text-halo-fill: fadeout(white, 50%);
  name/text-halo-radius: 1;
}

#natural {
  ::ridge[natural = 'ridge'][zoom>=12]{
    text-size:10;
    [zoom>=12][length > 1500]{ text-size:11;}
    [zoom>=12][length > 3000]{ text-size:13;}
    [zoom>=15][length > 1500]{ text-size:13;}
    [zoom>=15][length > 3000]{ text-size:15;}    
    text-name: [name];
    text-placement: line;
    text-face-name: @sans;
	text-halo-fill: fadeout(white, 50%);
    text-halo-radius: 1;
  }
  
  ::cliff[natural = 'cliff'][zoom >= 13] {
    line-pattern-smooth:1;
    line-pattern-file: url('img/cliff.png');
    [zoom >= 15] {
      line-pattern-file: url('img/cliff2.png');
    }
  }
}


#poi_hiking [zoom>=14]{  
  [type='wayside_cross']{
    marker-transform: "scale(0.9)";
    [zoom>=15] { marker-transform: "scale(1,1)";}
    [zoom>=17] { marker-transform: "scale(1.5)";}
    [zoom>=18] { marker-transform: "scale(2)";}
    marker-file:url(img/cross.svg);
  }
  [type='guidepost'][zoom>=15]{
    marker-transform: "scale(0.3)";
    [zoom>=17] { marker-transform: "scale(0.4)";}
    [zoom>=18] { marker-transform: "scale(0.5)";}
    marker-file:url(img/guidepost.png);
  }
  text-name: "[name]";
  text-size: 9;
  text-dy: 10;
  text-face-name: @sans;
  text-halo-radius: 1;
  text-placement: interior;
  text-allow-overlap:true;
  ele/text-name: "[ele]";
  ele/text-size: 9;
  ele/text-dy: 10;
  ele/text-face-name: @sans;
  ele/text-halo-radius: 1;
  ele/text-placement: interior;
  ele/text-allow-overlap:true;
  [name != ''] {
    ele/text-dy: 21;
  }
}


#test {
  marker-width:6;
  marker-fill:#f45;
  marker-line-color:#813;
  marker-allow-overlap:true;
}
