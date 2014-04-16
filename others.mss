#trees [zoom>=15] {
  image-filters: agg-stack-blur(1,1);
  [type='poly'] {
    polygon-fill: green;
    polygon-opacity: 0.3;
  }
  [zoom>=19][type='point'] {
    marker-fill: #b27f36;
    marker-width: 3;
    marker-height: 3;
  }
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

#power_line [zoom >= 14]{
  [power='line'],
  [power='minor_line'][zoom>=15]{
    mainline/line-width:0.5;
    mainline/line-opacity:0.6;
    mainline/line-color:black;
    /*
    [power='line'][zoom>=16] {
      secondline/line-offset:-2;
      thirdline/line-offset: 2;
      secondline/line-width:0.4;
      secondline/line-opacity:0.5;
      secondline/line-color:black;
      thirdline/line-width:0.4;
      thirdline/line-opacity:0.5;
      thirdline/line-color:black;
    }*/
  }
}