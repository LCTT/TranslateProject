[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (New open source GIS projects for Kubernetes applications)
[#]: via: (https://opensource.com/article/20/4/gis-kubernetes)
[#]: author: (Adam Timm https://opensource.com/users/timmam)

New open source GIS projects for Kubernetes applications
======
pg_tileserv and pg_featureserv make it easier for developers to add
location services to Kubernetes applications.
![A map with a route highlighted][1]

Spatial data from geographic information systems (GIS) is all around us. From smartphones that make our lives better and more convenient to precision agriculture that is increasing the amount of food farmers can produce while reducing the cost, whether or not we realize it, almost every part of our lives is touched by spatial data.

This increase of spatial data is simultaneously bringing an increase of open spatial datasets that people can consume and use to build all sorts of new applications. However, these types of datasets have not always been easy to work with. Also, due to the size of some of the geographic data, they can be difficult to bring to modern application deployment frameworks such as Kubernetes.

To help with these issues, [Crunchy Data][2] recently announced two new open source projects, [pg_tileserv][3] and [pg_featureserv][4], to make it easier to develop cloud-native spatial applications. These projects, part of open source [Crunchy Spatial][5], help developers leverage the robust [PostGIS][6] geospatial database extension to [PostgreSQL][7] without having to write complex SQL statements.

So what are pg_tileserv and pg_featuresev, how do they make it easier for developers to add location services to their Kubernetes applications, and what does this mean for the future of spatial applications?

### Traditional GIS vs. modern spatial microservices

Traditionally, when an organization or individual works with spatial data, they start with a product that grew up as a GIS. There are many high-quality open source GIS products ([QGIS][8], [GeoServer][9], [GeoNode][10], etc.), but they may not align with modern, cloud-native approaches to software design.

The popularity of Kubernetes creates challenges for these legacy applications around automation and deployment, as they require a lot of manual configuration, for example, when data sources are added and modified. In many setups, these spatial applications must exist outside Kubernetes and cannot leverage many of the conveniences it provides.

In contrast, modern spatial services should be driven by the spatial data that they are processing and serving out. They should align with modern software development practices and scale efficiently and integrate easily with developer workflows.

Applications that are spatially aware also need to ensure they can handle the unique characteristics of spatial data (e.g., geometries, projections, etc.). To do all of this in independent microservices can be challenging unless you have a highly capable database to do the majority of the work for you. This is where pg_tileserv and pg_featureserv help, as both projects leverage the power of PostGIS, an open source geospatial extension to PostgreSQL, to provide advanced spatial capabilities from a simple REST framework

### Generate map vector tiles with pg_tileserv

![pg_tileserv][11]

pg_tileserv is a lightweight vector tile server written in Go that enables you to generate [vector tiles][12] directly from PostGIS. It does this by implementing the **ST_AsMVT()** function in a best-practice method that translates an HTTP request to the database. It includes common defaults that allow you to pass a database connection URL to the server and be up and running in no time. There's no heavyweight software to install and configure, and it's designed for cloud-native GIS applications.

For specific examples on how to use it, check out our blog posts on [tile serving][13] and [spatial tile serving with PostgreSQL functions][14].

### Annotate your maps with pg_featureserv

![pg_featureserv][15]

pg_featureserv is a lightweight service written in Go that enables you to serve features directly out of PostGIS. It implements the [OGC API][16] for features and provides a standard REST endpoint for your spatial data and functions contained in PostGIS. Just like pg_tileserv, there's no heavyweight software to install; just pass a database connection URL to your PostGIS database, and you're off to the races. For a specific example of how to use it, check out our post on [querying spatial features][17].

### Focus on spatial data, not GIS

With our deep background in developing PostGIS and building PostGIS-backed applications, we wanted to help developers unlock all the value of spatial data in a way that is easy to deploy, scale, and maintain. As the source code of pg_tileserv and pg_featureserv show, we are just leveraging functions already in PostGIS. This allows developers to quickly add spatial data to their applications and data scientists to focus on the data.

![GIS architecture][18]

The benefits of this approach are:

  * Faster performance because PostgreSQL and PostGIS are doing the work for you
  * Less configuration to maintain because the database structure is the configuration
  * By design, it runs in the cloud at enterprise scale from the start
  * Shorter times to update customer-facing applications—when you update your data in the database, your application is updated instantly
  * Ability to focus more on maintaining your data and delivering value to your users and less on wrangling software



Also, since these services respond to the configuration of your database, they also expose functions contained in the database. Rather than developing their data functions to incorporate them into software later, data scientists can create functions in the database that are immediately made available via a REST API. The software begins to fade into the background so an organization can focus on the data.

Suffice it to say, we're pretty excited about these new geospatial services, and we definitely want your feedback on them. Feel free to check out [pg_tileserve][3] and [pg_featureserv][4], try deploying them alongside your PostGIS databases with the [PostgreSQL Operator][19], and share your feedback in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/gis-kubernetes

作者：[Adam Timm][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/timmam
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/map_route_location_gps_path.png?itok=RwtS4DsU (A map with a route highlighted)
[2]: https://www.crunchydata.com/
[3]: https://github.com/CrunchyData/pg_tileserv
[4]: https://github.com/CrunchyData/pg_featureserv
[5]: https://www.crunchydata.com/products/crunchy-spatial/
[6]: https://postgis.net/
[7]: https://www.postgresql.org
[8]: https://www.qgis.org/en/site/
[9]: http://geoserver.org/
[10]: http://geonode.org/
[11]: https://opensource.com/sites/default/files/pg_tileserv.jpg (pg_tileserv)
[12]: https://info.crunchydata.com/blog/dynamic-vector-tiles-from-postgis
[13]: https://info.crunchydata.com/blog/crunchy-spatial-tile-serving
[14]: https://info.crunchydata.com/blog/crunchy-spatial-tile-serving-with-postgresql-functions
[15]: https://opensource.com/sites/default/files/pg_featureserv.jpg (pg_featureserv)
[16]: http://www.ogcapi.org/
[17]: https://info.crunchydata.com/blog/crunchy-spatial-querying-spatial-features-with-pg_featureserv
[18]: https://opensource.com/sites/default/files/uploads/architecture_0.png (GIS architecture)
[19]: https://github.com/CrunchyData/postgres-operator
