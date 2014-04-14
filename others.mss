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