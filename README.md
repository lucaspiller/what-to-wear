# What To Wear

Ever feel like you have too much on your plate and can't decide what to wear in the morning? Well fear no more, your prayers have been answered. What to wear is a simple API that looks up the weather for you, and decides what you should wear. Simple, that's one less thing to worry about!

## How to use it?

    GET http://localhost:4567/forecast?location=51.50,-0.19

    {
      "attribution":{
        "text":"Weather forecast from yr.no, delivered by the Norwegian Meteorological Institute and the NRK",
        "link":"http://www.yr.no/place/United_Kingdom/England/Greater_London/"
      },
      "time":"2011-04-27T18:00:00+00:00",
      "brolly":false,
      "shades":true,
      "shorts":false,
      "scarf":false
    }

## APIs

This uses two APIs. They are free to use, but are heavily rate limited, so you shouldn't set this up for production usage without agressive caching.

* [Norwegian Meteorological Institute Forecast API](http://www.yr.no/)
* [Google Geocoding API](http://code.google.com/apis/maps/documentation/geocoding/)

## Inspiration

Alpine people. And their weather houses made of [animal intenstines](http://en.wikipedia.org/wiki/Catgut) 

## Contributing

* Fork the project.
* Make your feature addition or bug fix.
* Send me a pull request. Bonus points for topic branches.

Tests would also be good, there are currently none... :)

## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/InteractiveResource" property="dct:title" rel="dct:type">what-to-wear</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/lucaspiller/what-to-wear" property="cc:attributionName" rel="cc:attributionURL">Luca Spiller</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.<br />Based on a work at <a xmlns:dct="http://purl.org/dc/terms/" href="https://github.com/lucaspiller/what-to-wear" rel="dct:source">github.com</a>.<br />Permissions beyond the scope of this license may be available at <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/lucaspiller/what-to-wear" rel="cc:morePermissions">https://github.com/lucaspiller/what-to-wear</a>.
