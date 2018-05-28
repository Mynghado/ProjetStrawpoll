Ext.require('Ext.chart.*');
Ext.require(['Ext.layout.container.Fit', 'Ext.window.MessageBox']);

Ext.onReady(function () {
    store1.loadData(generateData(jijop, 20));

    var donut = false,
        chart = Ext.create('Ext.chart.Chart', {
            xtype: 'chart',
            animate: true,
            store: store1,
            shadow: true,
            legend: {
                position: 'right'
            },
            insetPadding: 10,
            theme: 'Base:gradients',
            series: [{
                type: 'pie',
                field: 'data1',
                showInLegend: true,
                donut: donut,
                tips: {
                  trackMouse: true,
                  width: 140,
                  height: 28,
                  renderer: function(storeItem, item) {
                    //calculate percentage.
                    var total = 0;
                    store1.each(function(rec) {
                        total += rec.get('data1');
                    });
                    this.setTitle(storeItem.get('name') + ': ' + Math.round(storeItem.get('data1') / total * 100) + '%');
                  }
                },
                highlight: {
                  segment: {
                    margin: 20
                  }
                },
                label: {
                    field: 'name',
                    display: 'rotate',
                    contrast: true,
                    font: '18px Arial'
                }
            }]
        });


    var panel1 = Ext.create('widget.panel', {
        width: 600,
        height: 400,
        title: kikop,
        renderTo: Ext.getBody(),
        layout: 'fit',
        tbar: [{
            text: 'Enregistrer sous',
            handler: function() {
                Ext.MessageBox.confirm('Confirm Download', 'Voulez-vous t&eacute;l&eacute;charger le graphique en tant qu\'image?', function(choice){
                    if(choice == 'yes'){
                        chart.save({
                            type: 'image/png'
                        });
                    }
                });
            }
        }, {
            text: 'Recharger les donn&eacute;es',
            handler: function() {
                // Add a short delay to prevent fast sequential clicks
                window.loadTask.delay(100, function() {
                    store1.loadData(generateData(jijop, 20));
					window.location.reload();
                });
            }
        }, {
            enableToggle: true,
            pressed: false,
            text: 'Beignet',
            toggleHandler: function(btn, pressed) {
                chart.series.first().donut = pressed ? 35 : false;
                chart.refresh();
            }
        }
		, {
            enableToggle: true,
            pressed: false,
            text: 'Retour au vote',
            toggleHandler: function(btn, pressed) {
                window.top.location.href="http://localhost:54719/View/v"+idkikop+".aspx";
            }
			}
		, {
            enableToggle: true,
            pressed: false,
            text: 'S\'inscrire',
            toggleHandler: function(btn, pressed) {
                window.top.location.href="http://localhost:54719/View/sinscrire.aspx";
            }
			}
		, {
            enableToggle: true,
            pressed: false,
            text: 'Se connecter',
            toggleHandler: function(btn, pressed) {
                window.top.location.href="http://localhost:54719/View/login.aspx";
            }
        }
		
		],
        items: chart
    });
});
