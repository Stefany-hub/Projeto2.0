window.feed = function(callback) {
    var tick = {};
    tick.plot0 = count;
    callback(JSON.stringify(tick));
  };

  var myConfig = {
    type: "gauge",
    globals: {
      fontSize: 15
    },
    plotarea: {
      marginTop: 40
    },
    plot: {
      size: '100%',
      valueBox: {
        placement: 'center',
        text: '%v', //default
        fontSize: 25,
        rules: [{
            rule: '%v <= 25',
            text: '%v<br>Nível 0'
          },
          {
            rule: '%v > 25  && %v < 50',
            text: '%v<br>Nível 1'
          },
          {
            rule: '%v >= 50  && %v < 75',
            text: '%v<br>Nível 2'
          },
          {
            rule: '%v >= 75',
            text: '%v<br>Nível 3'
          }
        ]
      }
    },
    tooltip: {
      borderRadius: 1
    },
    scaleR: {
      aperture: 180,
      minValue: 0,
      maxValue: 100,
      step: 10,
      center: {
        visible: false
      },
      tick: {
        visible: false
      },
      item: {
        offsetR: 0,
        rules: [{
          rule: '%i == 9',
          offsetX: 15
        }]
      },
      labels: ['0','10','20','30','40','50','60','70','80','90','100'],
      ring: {
        size: 25,
        rules: [{
            rule: '%v <= 25',
            backgroundColor: 'green'
          },
          {
            rule: '%v > 25 && %v < 50',
            backgroundColor: 'yellow'
          },
          {
            rule: '%v >= 50 && %v < 75',
            backgroundColor: 'orange'
          },
          {
            rule: '%v >= 75',
            backgroundColor: 'red'
          }
        ]
      }
    },
    refresh: {
      type: "feed",
      transport: "js",
      url: "feed()",
      interval: 1500,
      resetTimeout: 1000
    },
    series: [{
      values: [0], // starting value
      backgroundColor: 'black',
      indicator: [10, 10, 10, 10, 0.75],
      animation: {
        effect: 2,
        method: 1,
        sequence: 4,
        speed: 900
      },
    }]
  };

  zingchart.render({
    id: 'myChart',
    data: myConfig,
    height: 300,
    width: '100%'
  });