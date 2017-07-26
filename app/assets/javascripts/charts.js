function change_theme() {
  Highcharts.theme = {
     colors: ['#00bcd4', '#4caf50', '#9c27b0', '#ff9800', '#f44336', '#ff0066', '#eeaaee',
        '#55BF3B', '#DF5353', '#7798BF', '#aaeeee'],
     chart: {
        backgroundColor: null,
        style: {
           fontFamily: 'Dosis, sans-serif'
        }
     },
     title: {
        style: {
           fontSize: '16px',
           fontWeight: 'bold',
           textTransform: 'uppercase'
        }
     },
     tooltip: {
        borderWidth: 0,
        backgroundColor: 'rgba(219,219,216,0.8)',
        shadow: false
     },
     legend: {
        itemStyle: {
           fontWeight: 'bold',
           fontSize: '13px'
        }
     },
     xAxis: {
        gridLineWidth: 1,
        labels: {
           style: {
              fontSize: '12px'
           }
        }
     },
     yAxis: {
        minorTickInterval: 'auto',
        title: {
           style: {
              textTransform: 'uppercase'
           }
        },
        labels: {
           style: {
              fontSize: '12px'
           }
        }
     },
     plotOptions: {
        candlestick: {
           lineColor: '#404048'
        }
     },
     // General
     background2: '#F0F0EA'

  };
}

function load_chart_chart (title, id, data) {
  // Apply the theme
  Highcharts.setOptions(Highcharts.theme);
  // Radialize the colors
  Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
    return {
      radialGradient: {
        cx: 0.5,
        cy: 0.3,
        r: 0.7
      },
      stops:
      [
        [0, color],
        [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
      ]
    };
  });

  // Build the chart
  Highcharts.chart(id, {
    chart: {
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false,
      type: 'pie'
    },
    title: {
      text: title
    },
    tooltip: {
      pointFormat: '{series.name}: <b>{point.count}</b>'
    },
    plotOptions: {
      pie: {
        allowPointSelect: true,
        cursor: 'pointer',
        dataLabels: {
          enabled: true,
          format: '<b>{point.name}</b>: {point.percentage:.1f} %',
          style: {
            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
          },
          connectorColor: 'silver'
        },
        showInLegend: true
      }
    },
    series: [{
      name: 'Số dự án',
      data: data
    }]
  });
}

function check_chart() {
  if ($('#chart-project').length > 0) {
    var data = $('#chart-project').data('chart');
    var title = 'BIỂU ĐỒ TÌNH HÌNH DỰ ÁN';
    load_chart_chart(title, 'chart-project', data);
  }
  if ($('#chart-task').length > 0) {
    var data = $('#chart-task').data('chart');
    var title = 'BIỂU ĐỒ TÌNH HÌNH CÔNG VIỆC';
    load_chart_chart(title, 'chart-task', data);
  }
}
$(document).ready(function(){
  change_theme();
  check_chart();
});
