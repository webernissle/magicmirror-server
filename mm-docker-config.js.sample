/* Magic Mirror Config Sample
 *
 * By Michael Teeuw http://michaelteeuw.nl
 * MIT Licensed.
 *
 * For more information how you can configurate this file
 * See https://github.com/MichMich/MagicMirror#configuration
 *
 */

var config = {
  address: "0.0.0.0", // Address to listen on, can be:
  port: 8080,
  ipWhitelist: [], // Set [] to allow all IP addresses
  language: "de",
  timeFormat: 24,
  units: "metric",
	modules: [
		{
			module: "alert",
		},
		{
			module: "updatenotification",
			position: "top_bar"
		},
		{
			module: "clock",
			position: "top_left"
		},
		{
			module: 'calendar_monthly',
			position: 'top_right',
			config: {
				cssStyle: "custom"
			}
		},
		{
			module: 'calendar',
			position: 'bottom_bar',
			config: {
				colored: true,
				maximumEntries: 4,
				fade: false,
				coloredSymbolOnly: false,
				calendars: [
					{
						url: 'basic.ics',
						symbol: 'calendar',
					},
				],
			}
		},
		{
			module: "currentweather",
			position: "top_right",
			config: {
				location: "Basel,CH",
				locationID: "2661604", //ID from your city
				appid: "x"
			}
		},
		{
			module: "weatherforecast",
			position: "bottom_bar",
			config: {
				location: "Basel,CH",
				locationID: "2661604", //ID from your city
				appid: "x"
			}
		},
		{
			module: "netatmo",
			position: "bottom_bar",
			config: {
				clientId: "x",
				clientSecret: "x",
				refreshToken: "x|x",
				refreshInterval: 10,
				moduleOrder: ["Outdoor","Wohnzimmer","Hinten"],
				dataOrder: ["Pressure","CO2","Humidity","Temperature"]
			}
		},
		{
			module: "MMM-SwissStationboard",
			position: "top_right",
			header: "Basel",
			config: {
				stop: "Basel",
				maximumEntries: 5,
				minWalkingTime: 5,
				hideNotReachable: 0
			}
		},
		{
  			module: "MMM-MktIndex",
  			position: "top_right",
  			config: {
    				timeFormat: "DD-MM HH:mm",
    				symbols: ["^DJI", "^IXIC", "^SSMI", "IDIA.SW", "EURCHF=X"],
    				alias: ["DOW 30", "Nasdaq", "SMI", "Idorsia", "EUR/CHF"],
    				updateInterval: 180  // Query interval in seconds
  			}
		},
		{
   			module: "MMM-Jast",
    			position: "lower_third",
    			config: {
				maxWidth: "100%",
				updateIntervalInSeconds: 1800, // 0 = Auto calculation to 500 requests per day.
				fadeSpeedInSeconds: 20, // Higher value: vertical -> faster // horizontal -> slower
				scroll: "horizontal",
				defaultCurrency: "USD",
				showDepotGrowth: false,
				apiKey: "x",
				stocks: [
					{ name: "Nvidia", symbol: "NVDA" }
				],
				crypto: [
					{ name: "BTC", symbol: "BTC" }
				]
    			}
		},
        	{
			module: "MMM-MoonPhase",
			position: "middle_center",
			config: {
				updateInterval: 43200000,
				hemisphere: "N",
				resolution: "detailed",
				basicColor: "white",
				title: false,
				phase: true,
				x: 100,
				y: 100,
				alpha: 0.7
			}
		},
		{
			module: "newsfeed",
			position: "bottom_bar",
			config: {
				feeds: [
					{
						title: "SRF-Schweiz",
						url: "https://www.srf.ch/news/bnf/rss/1890"
					},
					{
						title: "SRF-SportFussball",
						url: "https://www.srf.ch/news/bnf/rss/2562"
					},
					{
						title: "OnlineReports",
						url: "https://www.onlinereports.ch/RSS-Feed.122+M5ea6a5a56eb.0.html"
					},
					{
						title: "SRF-International",
						url: "https://www.srf.ch/news/bnf/rss/1922"
					}
				],
				showSourceTitle: false,
				showPublishDate: true,
				showDescription: true,
				broadcastNewsFeeds: true,
				broadcastNewsUpdates: true
			}
		},
		{
       		 	module: 'MMM-pages',
        		config: {
                		modules: [[ "newsfeed", "MMM-SwissStationboard" ],
					 [ "MMM-Jast", "MMM-MktIndex" ],
					 [ "currentweather", "weatherforecast" ],
					 [ "currentweather", "MMM-MoonPhase" ],
					 [ "netatmo" ],
					 [ "calendar", "calendar_monthly" ]],
                		fixed: ["alert", "clock", "MMM-page-indicator"],
				hiddenPages: {},
				rotationTime: 20000
       			}
		},
    		{
        		module: 'MMM-page-indicator',
        		position: 'bottom_bar',
        		config: {
        		}
    		}
	]

};

/*************** DO NOT EDIT THE LINE BELOW ***************/
if (typeof module !== "undefined") { module.exports = config; }

