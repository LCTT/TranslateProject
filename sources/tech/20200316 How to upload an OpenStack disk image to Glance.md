[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to upload an OpenStack disk image to Glance)
[#]: via: (https://opensource.com/article/20/3/glance)
[#]: author: (Jair Patete https://opensource.com/users/jpatete)

How to upload an OpenStack disk image to Glance
======
Make images available to your private cloud, and more.
![blank background that says your image here][1]

[Glance][2] is an image service that allows you to discover, provide, register, or even delete disk and/or server images. It is a fundamental part of managing images on [OpenStack][3] and [TripleO][4] (which stands for "OpenStack-On-OpenStack").

If you have used a recent version of the OpenStack platform, you may already have launched your first Overcloud using TripleO, as you interact with Glance when uploading the Overcloud disk images inside the Undercloud's OpenStack (i.e., the node inside your cloud that is used to install the Overcloud, add/delete nodes, and do some other handy things).

In this article, I'll explain how to upload an image to Glance. Uploading an image to the service makes it available for the instances in your private cloud. Also, when you're deploying an Overcloud, it makes the image(s) available so the bare-metal nodes can be deployed using them.

In an Undercloud, execute the following command:


```
`$ openstack overcloud image upload --image-path /home/stack/images/`
```

This uploads the following Overcloud images to Glance:

  1. overcloud-full
  2. overcloud-full-initrd
  3. overcloud-full-vmlinuz



After some seconds, the images will upload successfully. Check the result by running:


```
(undercloud) [stack@undercloud ~]$ openstack image list
+--------------------------------------+------------------------+--------+
| ID                                   | Name                   | Status |
+--------------------------------------+------------------------+--------+
| 09ca88ea-2771-459d-94a2-9f87c9c393f0 | overcloud-full         | active |
| 806b6c35-2dd5-478d-a384-217173a6e032 | overcloud-full-initrd  | active |
| b2c96922-161a-4171-829f-be73482549d5 | overcloud-full-vmlinuz | active |
+--------------------------------------+------------------------+--------+
```

This is a mandatory and easy step in the process of deploying an Overcloud, and it happens within seconds, which makes it hard to see what's under the hood. But what if you want to know what is going on?

One thing to keep in mind: Glance works using client-server communication carried through REST APIs. Therefore, you can see what is going on by using [tcpdump][5] to take some TCP packets.

Another thing that is important: There is a database (there's always a database, right?) that is shared among all the OpenStack platform components, and it contains all the information that Glance (and other components) needs to operate. (In my case, MariaDB is the backend.) I won't get into how to access the SQL database, as I don't recommend playing around with it, but I will show what the database looks like during the upload process. (This is an entirely-for-test OpenStack installation, so there's no need to play with the database in this example.)

### The database

The basic flow of this example exercise is:

_Image Created -&gt; Image Queued -&gt; Image Saved -&gt; Image Active_

You need permission to go through this flow, so first, you must ask OpenStack's identity service, [Keystone][6], for authorization. My Keystone catalog entry looks like this; as I'm in the Undercloud, I'll hit the public endpoint:


```
| keystone  | identity       | regionOne                           |
|           |                |   public: <https://172.16.0.20:13000> |
|           |                | regionOne                           |
|           |                |   internal: <http://172.16.0.19:5000> |
|           |                | regionOne                           |
|           |                |   admin: <http://172.16.0.19:35357>   |
```

And for Glance:


```
| glance    | image    | regionOne                              |
|           |          |   public: <https://172.16.0.20:13292>    |
|           |          | regionOne                              |
|           |          |   internal: <http://172.16.0.19:9292>    |
|           |          | regionOne                              |
|           |          |   admin: <http://172.16.0.19:9292>       |
```

I'll hit those ports and TCP port 3306 in the capture; the latter is so I can capture what's going on with the SQL database. To capture the packets, use the tcpdump command:


```
`$ tcpdump -nvs0 -i ens3 host 172.16.0.20 and port 13000 or port 3306 or port 13292`
```

Under the hood, this looks like:

Authentication:

**Initial request (discovery of API Version Information):**


```
`https://172.16.0.20:13000 "GET / HTTP/1.1"`
```

**Response:**


```
Content-Length: 268 Content-Type: application/json Date: Tue, 18 Feb 2020 04:49:55 GMT Location: <https://172.16.0.20:13000/v3/> Server: Apache Vary: X-Auth-Token x-openstack-request-id: req-6edc6642-3945-4fd0-a0f7-125744fb23ec

{
   "versions":{
      "values":[
         {
            "id":"v3.13",
            "status":"stable",
            "updated":"2019-07-19T00:00:00Z",
            "links":[
               {
                  "rel":"self",
                  "href":"<https://172.16.0.20:13000/v3/>"
               }
            ],
            "media-types":[
               {
                  "base":"application/json",
                  "type":"application/vnd.openstack.identity-v3+json"
               }
            ]
         }
      ]
   }
}
```

**Authentication request**


```
`https://172.16.0.20:13000 "POST /v3/auth/tokens HTTP/1.1"`
```

After this step, a token is assigned for the admin user to use the services. (The token cannot be displayed for security reasons.) The token tells the other services something like: "I've already logged in with the proper credentials against Keystone; please let me go straight to the service and ask no more questions about who I am."

At this point, the command:


```
`$ openstack overcloud image upload --image-path /home/stack/images/`
```

executes, and it is authorized to upload the image to the Glance service.

The current status is:

_**Image Created**_ _-&gt; Image Queued -&gt; Image Saved -&gt; Image Active_

The service checks whether this image already exists:


```
`https://172.16.0.20:13292 "GET /v2/images/overcloud-full-vmlinuz HTTP/1.1"`
```

From the client's point of view, the request looks like:


```
`curl -g -i -X GET -H 'b'Content-Type': b'application/octet-stream'' -H 'b'X-Auth-Token': b'gAAAAABeS2zzWzAZBqF-whE7SmJt_Atx7tiLZhcL8mf6wJPrO3RBdv4SdnWImxbeSQSqEQdZJnwBT79SWhrtt7QDn-2o6dsAtpUb1Rb7w6xe7Qg_AHQfD5P1rU7tXXtKu2DyYFhtPg2TRQS5viV128FyItyt49Yn_ho3lWfIXaR3TuZzyIz38NU'' -H 'User-Agent: python-glanceclient' -H 'Accept-Encoding: gzip, deflate' -H 'Accept: */*' -H 'Connection: keep-alive'  --cacert /etc/pki/ca-trust/source/anchors/cm-local-ca.pem  --cert None --key None https://172.16.0.20:13292/v2/images/overcloud-full-vmlinuz`
```

Here, you can see the fernet token, the user-agent indicating Glance is speaking, and the TLS certificate; this is why you don't see anything in your tcpdump.

Since the image does not exist, it is OK to get a 404 ERROR for this request.

Next, the current images are consulted:


```
`https://172.16.0.20:13292 "GET /v2/images?limit=20 HTTP/1.1" 200 78`
```

and retrieved from the service:


```
HTTP/1.1 200 OK
Content-Length: 78
Content-Type: application/json
X-Openstack-Request-Id: req-0f117984-f427-4d35-bec3-956432865dd1
Date: Tue, 18 Feb 2020 04:49:55 GMT

{
   "images":[

   ],
   "first":"/v2/images?limit=20",
   "schema":"/v2/schemas/images"
}
```

Yes, it is still empty.

Meanwhile, the same check has been done on the database, where a huge query has been triggered with the same results. (To sync on the timestamp, I checked on the tcpdump after the connection and queries were finished, and then compared them with the API calls' timestamp.)

To identify where the Glance-DB calls started, I did a full-packet search with the word "glance" inside the tcpdump file. This saves a lot of time vs. searching through all the other database calls, so this is my starting point to check each database call.

![Searching "glance" inside tcpdump][7]

The first query returns nothing in the fields, as the image still does not exist:


```
SELECT images.created_at AS images_created_at, images.updated_at AS images_updated_at, images.deleted_at AS images_deleted_at, images.deleted AS images_deleted, images.id AS images_id, images.name AS images_name, images.disk_format AS images_disk_format, images.container_format AS images_container_format, images.size AS images_size, images.virtual_size AS images_virtual_size, images.status AS images_status, images.visibility AS images_visibility, images.checksum AS images_checksum, images.os_hash_algo AS images_os_hash_algo, images.os_hash_value AS images_os_hash_value, images.min_disk AS images_min_disk, images.min_ram AS images_min_ram, images.owner AS images_owner, images.protected AS images_protected, images.os_hidden AS images_os_hidden, image_properties_1.created_at AS image_properties_1_created_at, image_properties_1.updated_at AS image_properties_1_updated_at, image_properties_1.deleted_at AS image_properties_1_deleted_at, image_properties_1.deleted AS image_properties_1_deleted, image_properties_1.id AS image_properties_1_id, image_properties_1.image_id AS image_properties_1_image_id, image_properties_1.name AS image_properties_1_name, image_properties_1.value AS image_properties_1_value, image_locations_1.created_at AS image_locations_1_created_at, image_locations_1.updated_at AS image_locations_1_updated_at, image_locations_1.deleted_at AS image_locations_1_deleted_at, image_locations_1.deleted AS image_locations_1_deleted, image_locations_1.id AS image_locations_1_id, image_locations_1.image_id AS image_locations_1_image_id, image_locations_1.value AS image_locations_1_value, image_locations_1.meta_data AS image_locations_1_meta_data, image_locations_1.status AS image_locations_1_status
FROM images LEFT OUTER JOIN image_properties AS image_properties_1 ON images.id = image_properties_1.image_id LEFT OUTER JOIN image_locations AS image_locations_1 ON images.id = image_locations_1.image_id
WHERE images.id = 'overcloud-full-vmlinuz'
```

Next, the image will start uploading, so an API call and a write to the database are expected.

On the API side, the image scheme is retrieved by consulting the service in:


```
`https://172.16.0.20:13292 "GET /v2/schemas/image HTTP/1.1"`
```

Then, some of the fields are populated with image information. This is what the scheme looks like:


```
{
   "name":"image",
   "properties":{
      "id":{
         "type":"string",
         "description":"An identifier for the image",
         "pattern":"^([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}$"
      },
      "name":{
         "type":[
            "null",
            "string"
         ],
         "description":"Descriptive name for the image",
         "maxLength":255
      },
      "status":{
         "type":"string",
         "readOnly":true,
         "description":"Status of the image",
         "enum":[
            "queued",
            "saving",
            "active",
            "killed",
            "deleted",
            "uploading",
            "importing",
            "pending_delete",
            "deactivated"
         ]
      },
      "visibility":{
         "type":"string",
         "description":"Scope of image accessibility",
         "enum":[
            "community",
            "public",
            "private",
            "shared"
         ]
      },
      "protected":{
         "type":"boolean",
         "description":"If true, image will not be deletable."
      },
      "os_hidden":{
         "type":"boolean",
         "description":"If true, image will not appear in default image list response."
      },
      "checksum":{
         "type":[
            "null",
            "string"
         ],
         "readOnly":true,
         "description":"md5 hash of image contents.",
         "maxLength":32
      },
      "os_hash_algo":{
         "type":[
            "null",
            "string"
         ],
         "readOnly":true,
         "description":"Algorithm to calculate the os_hash_value",
         "maxLength":64
      },
      "os_hash_value":{
         "type":[
            "null",
            "string"
         ],
         "readOnly":true,
         "description":"Hexdigest of the image contents using the algorithm specified by the os_hash_algo",
         "maxLength":128
      },
      "owner":{
         "type":[
            "null",
            "string"
         ],
         "description":"Owner of the image",
         "maxLength":255
      },
      "size":{
         "type":[
            "null",
            "integer"
         ],
         "readOnly":true,
         "description":"Size of image file in bytes"
      },
      "virtual_size":{
         "type":[
            "null",
            "integer"
         ],
         "readOnly":true,
         "description":"Virtual size of image in bytes"
      },
      "container_format":{
         "type":[
            "null",
            "string"
         ],
         "description":"Format of the container",
         "enum":[
            null,
            "ami",
            "ari",
            "aki",
            "bare",
            "ovf",
            "ova",
            "docker",
            "compressed"
         ]
      },
      "disk_format":{
         "type":[
            "null",
            "string"
         ],
         "description":"Format of the disk",
         "enum":[
            null,
            "ami",
            "ari",
            "aki",
            "vhd",
            "vhdx",
            "vmdk",
            "raw",
            "qcow2",
            "vdi",
            "iso",
            "ploop"
         ]
      },
      "created_at":{
         "type":"string",
         "readOnly":true,
         "description":"Date and time of image registration"
      },
      "updated_at":{
         "type":"string",
         "readOnly":true,
         "description":"Date and time of the last image modification"
      },
      "tags":{
         "type":"array",
         "description":"List of strings related to the image",
         "items":{
            "type":"string",
            "maxLength":255
         }
      },
      "direct_url":{
         "type":"string",
         "readOnly":true,
         "description":"URL to access the image file kept in external store"
      },
      "min_ram":{
         "type":"integer",
         "description":"Amount of ram (in MB) required to boot image."
      },
      "min_disk":{
         "type":"integer",
         "description":"Amount of disk space (in GB) required to boot image."
      },
      "self":{
         "type":"string",
         "readOnly":true,
         "description":"An image self url"
      },
      "file":{
         "type":"string",
         "readOnly":true,
         "description":"An image file url"
      },
      "stores":{
         "type":"string",
         "readOnly":true,
         "description":"Store in which image data resides.  Only present when the operator has enabled multiple stores.  May be a comma-separated list of store identifiers."
      },
      "schema":{
         "type":"string",
         "readOnly":true,
         "description":"An image schema url"
      },
      "locations":{
         "type":"array",
         "items":{
            "type":"object",
            "properties":{
               "url":{
                  "type":"string",
                  "maxLength":255
               },
               "metadata":{
                  "type":"object"
               },
               "validation_data":{
                  "description":"Values to be used to populate the corresponding image properties. If the image status is not 'queued', values must exactly match those already contained in the image properties.",
                  "type":"object",
                  "writeOnly":true,
                  "additionalProperties":false,
                  "properties":{
                     "checksum":{
                        "type":"string",
                        "minLength":32,
                        "maxLength":32
                     },
                     "os_hash_algo":{
                        "type":"string",
                        "maxLength":64
                     },
                     "os_hash_value":{
                        "type":"string",
                        "maxLength":128
                     }
                  },
                  "required":[
                     "os_hash_algo",
                     "os_hash_value"
                  ]
               }
            },
            "required":[
               "url",
               "metadata"
            ]
         },
         "description":"A set of URLs to access the image file kept in external store"
      },
      "kernel_id":{
         "type":[
            "null",
            "string"
         ],
         "pattern":"^([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}$",
         "description":"ID of image stored in Glance that should be used as the kernel when booting an AMI-style image.",
         "is_base":false
      },
      "ramdisk_id":{
         "type":[
            "null",
            "string"
         ],
         "pattern":"^([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}$",
         "description":"ID of image stored in Glance that should be used as the ramdisk when booting an AMI-style image.",
         "is_base":false
      },
      "instance_uuid":{
         "type":"string",
         "description":"Metadata which can be used to record which instance this image is associated with. (Informational only, does not create an instance snapshot.)",
         "is_base":false
      },
      "architecture":{
         "description":"Operating system architecture as specified in <https://docs.openstack.org/python-glanceclient/latest/cli/property-keys.html>",
         "type":"string",
         "is_base":false
      },
      "os_distro":{
         "description":"Common name of operating system distribution as specified in <https://docs.openstack.org/python-glanceclient/latest/cli/property-keys.html>",
         "type":"string",
         "is_base":false
      },
      "os_version":{
         "description":"Operating system version as specified by the distributor.",
         "type":"string",
         "is_base":false
      },
      "description":{
         "description":"A human-readable string describing this image.",
         "type":"string",
         "is_base":false
      },
      "cinder_encryption_key_id":{
         "description":"Identifier in the OpenStack Key Management Service for the encryption key for the Block Storage Service to use when mounting a volume created from this image",
         "type":"string",
         "is_base":false
      },
      "cinder_encryption_key_deletion_policy":{
         "description":"States the condition under which the Image Service will delete the object associated with the 'cinder_encryption_key_id' image property.  If this property is missing, the Image Service will take no action",
         "type":"string",
         "enum":[
            "on_image_deletion",
            "do_not_delete"
         ],
         "is_base":false
      }
   },
   "additionalProperties":{
      "type":"string"
   },
   "links":[
      {
         "rel":"self",
         "href":"{self}"
      },
      {
         "rel":"enclosure",
         "href":"{file}"
      },
      {
         "rel":"describedby",
         "href":"{schema}"
      }
   ]
}
```

That's a long scheme!

Here is the API call to start uploading the image information, and it will now move to the "queue" state:


```
`curl -g -i -X POST -H 'b'Content-Type': b'application/json'' -H 'b'X-Auth-Token': b'gAAAAABeS2zzWzAZBqF-whE7SmJt_Atx7tiLZhcL8mf6wJPrO3RBdv4SdnWImxbeSQSqEQdZJnwBT79SWhrtt7QDn-2o6dsAtpUb1Rb7w6xe7Qg_AHQfD5P1rU7tXXtKu2DyYFhtPg2TRQS5viV128FyItyt49Yn_ho3lWfIXaR3TuZzyIz38NU'' -H 'User-Agent: python-glanceclient' -H 'Accept-Encoding: gzip, deflate' -H 'Accept: */*' -H 'Connection: keep-alive'  --cacert /etc/pki/ca-trust/source/anchors/cm-local-ca.pem  --cert None --key None -d '{"name": "overcloud-full-vmlinuz", "disk_format": "aki", "visibility": "public", "container_format": "bare"}' https://172.16.0.20:13292/v2/images`
```

Here is the API response:


```
HTTP/1.1 201 Created
Content-Length: 629
Content-Type: application/json
Location: <https://172.16.0.20:13292/v2/images/13892850-6add-4c28-87cd-6da62e6f8a3c>
Openstack-Image-Import-Methods: web-download
X-Openstack-Request-Id: req-bd5194f0-b1c2-40d3-a646-8a24ed0a1b1b
Date: Tue, 18 Feb 2020 04:49:56 GMT

{
   "name":"overcloud-full-vmlinuz",
   "disk_format":"aki",
   "container_format":"bare",
   "visibility":"public",
   "size":null,
   "virtual_size":null,
   "status":"queued",
   "checksum":null,
   "protected":false,
   "min_ram":0,
   "min_disk":0,
   "owner":"c0a46a106d3341649a25b10f2770aff8",
   "os_hidden":false,
   "os_hash_algo":null,
   "os_hash_value":null,
   "id":"13892850-6add-4c28-87cd-6da62e6f8a3c",
   "created_at":"2020-02-18T04:49:55Z",
   "updated_at":"2020-02-18T04:49:55Z",
   "tags":[

   ],
   "self":"/v2/images/13892850-6add-4c28-87cd-6da62e6f8a3c",
   "file":"/v2/images/13892850-6add-4c28-87cd-6da62e6f8a3c/file",
   "schema":"/v2/schemas/image"
}
```

and the SQL call to store the information in the Glance-DB:


```
`INSERT INTO images (created_at, updated_at, deleted_at, deleted, id, name, disk_format, container_format, SIZE, virtual_size, STATUS, visibility, checksum, os_hash_algo, os_hash_value, min_disk, min_ram, owner, protected, os_hidden) VALUES ('2020-02-18 04:49:55.993652', '2020-02-18 04:49:55.993652', NULL, 0, '13892850-6add-4c28-87cd-6da62e6f8a3c', 'overcloud-full-vmlinuz', 'aki', 'bare', NULL, NULL, 'queued', 'public', NULL, NULL, NULL, 0, 0, 'c0a46a106d3341649a25b10f2770aff8', 0, 0)`
```

Current status:

_Image Created -&gt;_ _**Image Queued**_ _-&gt; Image Saved -&gt; Image Active_

In the Glance architecture, the images are "physically" stored in the specified backend (Swift in this case), so traffic will also hit the Swift endpoint at port 8080. Capturing this traffic will make the .pcap file as large as the images being uploaded (2GB in my case).[*][8]  

![Glance architecture][9]


```
SELECT image_properties.created_at AS image_properties_created_at, image_properties.updated_at AS image_properties_updated_at, image_properties.deleted_at AS image_properties_deleted_at, image_properties.deleted AS image_properties_deleted, image_properties.id AS image_properties_id, image_properties.image_id AS image_properties_image_id, image_properties.name AS image_properties_name, image_properties.value AS image_properties_value
FROM image_properties
WHERE '13892850-6add-4c28-87cd-6da62e6f8a3c' = image_properties.image_id
```

You can see some validations happening within the database. At this point, the flow status is "queued" (as shown above), and you can check it here:

![Checking the Glance image status][10]

You can also check it with the following queries, where the **updated_at** field and the flow status are modified accordingly (i.e., queued to saving):

Current status:

_Image Created -&gt; Image Queued -&gt;_ _**Image Saved**_ _-&gt; Image Active_


```
SELECT images.id AS images_id
FROM images
WHERE images.id = '13892850-6add-4c28-87cd-6da62e6f8a3c' AND images.status = 'queued'
UPDATE images SET updated_at='2020-02-18 04:49:56.046542', id='13892850-6add-4c28-87cd-6da62e6f8a3c', name='overcloud-full-vmlinuz', disk_format='aki', container_format='bare', SIZE=NULL, virtual_size=NULL, STATUS='saving', visibility='public', checksum=NULL, os_hash_algo=NULL, os_hash_value=NULL, min_disk=0, min_ram=0, owner='c0a46a106d3341649a25b10f2770aff8', protected=0, os_hidden=0 WHERE images.id = '13892850-6add-4c28-87cd-6da62e6f8a3c' AND images.status = 'queued'
```

This is validated during the process with the following query:


```
SELECT images.created_at AS images_created_at, images.updated_at AS images_updated_at, images.deleted_at AS images_deleted_at, images.deleted AS images_deleted, images.id AS images_id, images.name AS images_name, images.disk_format AS images_disk_format, images.container_format AS images_container_format, images.size AS images_size, images.virtual_size AS images_virtual_size, images.status AS images_status, images.visibility AS images_visibility, images.checksum AS images_checksum, images.os_hash_algo AS images_os_hash_algo, images.os_hash_value AS images_os_hash_value, images.min_disk AS images_min_disk, images.min_ram AS images_min_ram, images.owner AS images_owner, images.protected AS images_protected, images.os_hidden AS images_os_hidden, image_properties_1.created_at AS image_properties_1_created_at, image_properties_1.updated_at AS image_properties_1_updated_at, image_properties_1.deleted_at AS image_properties_1_deleted_at, image_properties_1.deleted AS image_properties_1_deleted, image_properties_1.id AS image_properties_1_id, image_properties_1.image_id AS image_properties_1_image_id, image_properties_1.name AS image_properties_1_name, image_properties_1.value AS image_properties_1_value, image_locations_1.created_at AS image_locations_1_created_at, image_locations_1.updated_at AS image_locations_1_updated_at, image_locations_1.deleted_at AS image_locations_1_deleted_at, image_locations_1.deleted AS image_locations_1_deleted, image_locations_1.id AS image_locations_1_id, image_locations_1.image_id AS image_locations_1_image_id, image_locations_1.value AS image_locations_1_value, image_locations_1.meta_data AS image_locations_1_meta_data, image_locations_1.status AS image_locations_1_status
FROM images LEFT OUTER JOIN image_properties AS image_properties_1 ON images.id = image_properties_1.image_id LEFT OUTER JOIN image_locations AS image_locations_1 ON images.id = image_locations_1.image_id
WHERE images.id = '13892850-6add-4c28-87cd-6da62e6f8a3c'
```

And you can see its response in the Wireshark capture:

![Wireshark capture][11]

After the image is completely uploaded, its status will change to "active," which means the image is available in the service and ready to use.


```
<https://172.16.0.20:13292> "GET /v2/images/13892850-6add-4c28-87cd-6da62e6f8a3c HTTP/1.1" 200

{
   "name":"overcloud-full-vmlinuz",
   "disk_format":"aki",
   "container_format":"bare",
   "visibility":"public",
   "size":8106848,
   "virtual_size":null,
   "status":"active",
   "checksum":"5d31ee013d06b83d02c106ea07f20265",
   "protected":false,
   "min_ram":0,
   "min_disk":0,
   "owner":"c0a46a106d3341649a25b10f2770aff8",
   "os_hidden":false,
   "os_hash_algo":"sha512",
   "os_hash_value":"9f59d36dec7b30f69b696003e7e3726bbbb27a36211a0b31278318c2af0b969ffb279b0991474c18c9faef8b9e96cf372ce4087ca13f5f05338a36f57c281499",
   "id":"13892850-6add-4c28-87cd-6da62e6f8a3c",
   "created_at":"2020-02-18T04:49:55Z",
   "updated_at":"2020-02-18T04:49:56Z",
   "direct_url":"swift+config://ref1/glance/13892850-6add-4c28-87cd-6da62e6f8a3c",
   "tags":[

   ],
   "self":"/v2/images/13892850-6add-4c28-87cd-6da62e6f8a3c",
   "file":"/v2/images/13892850-6add-4c28-87cd-6da62e6f8a3c/file",
   "schema":"/v2/schemas/image"
}
```

You can also see the database call that updates the current status:


```
`UPDATE images SET updated_at='2020-02-18 04:49:56.571879', id='13892850-6add-4c28-87cd-6da62e6f8a3c', name='overcloud-full-vmlinuz', disk_format='aki', container_format='bare', SIZE=8106848, virtual_size=NULL, STATUS='active', visibility='public', checksum='5d31ee013d06b83d02c106ea07f20265', os_hash_algo='sha512', os_hash_value='9f59d36dec7b30f69b696003e7e3726bbbb27a36211a0b31278318c2af0b969ffb279b0991474c18c9faef8b9e96cf372ce4087ca13f5f05338a36f57c281499', min_disk=0, min_ram=0, owner='c0a46a106d3341649a25b10f2770aff8', protected=0, os_hidden=0 WHERE images.id = '13892850-6add-4c28-87cd-6da62e6f8a3c' AND images.status = 'saving'`
```

Current status:

_Image Created -&gt; Image Queued -&gt; Image Saved -&gt;_ _**Image Active**_

One interesting thing is that a property in the image is added after the image is uploaded using a PATCH. This property is **hw_architecture** and it is set to **x86_64**:


```
<https://172.16.0.20:13292> "PATCH /v2/images/13892850-6add-4c28-87cd-6da62e6f8a3c HTTP/1.1"

curl -g -i -X PATCH -H 'b'Content-Type': b'application/openstack-images-v2.1-json-patch'' -H 'b'X-Auth-Token': b'gAAAAABeS2zzWzAZBqF-whE7SmJt_Atx7tiLZhcL8mf6wJPrO3RBdv4SdnWImxbeSQSqEQdZJnwBT79SWhrtt7QDn-2o6dsAtpUb1Rb7w6xe7Qg_AHQfD5P1rU7tXXtKu2DyYFhtPg2TRQS5viV128FyItyt49Yn_ho3lWfIXaR3TuZzyIz38NU'' -H 'User-Agent: python-glanceclient' -H 'Accept-Encoding: gzip, deflate' -H 'Accept: */*' -H 'Connection: keep-alive'  --cacert /etc/pki/ca-trust/source/anchors/cm-local-ca.pem  --cert None --key None -d '[{"op": "add", "path": "/hw_architecture", "value": "x86_64"}]' <https://172.16.0.20:13292/v2/images/13892850-6add-4c28-87cd-6da62e6f8a3c>

Response:

{
   "hw_architecture":"x86_64",
   "name":"overcloud-full-vmlinuz",
   "disk_format":"aki",
   "container_format":"bare",
   "visibility":"public",
   "size":8106848,
   "virtual_size":null,
   "status":"active",
   "checksum":"5d31ee013d06b83d02c106ea07f20265",
   "protected":false,
   "min_ram":0,
   "min_disk":0,
   "owner":"c0a46a106d3341649a25b10f2770aff8",
   "os_hidden":false,
   "os_hash_algo":"sha512",
   "os_hash_value":"9f59d36dec7b30f69b696003e7e3726bbbb27a36211a0b31278318c2af0b969ffb279b0991474c18c9faef8b9e96cf372ce4087ca13f5f05338a36f57c281499",
   "id":"13892850-6add-4c28-87cd-6da62e6f8a3c",
   "created_at":"2020-02-18T04:49:55Z",
   "updated_at":"2020-02-18T04:49:56Z",
   "direct_url":"swift+config://ref1/glance/13892850-6add-4c28-87cd-6da62e6f8a3c",
   "tags":[

   ],
   "self":"/v2/images/13892850-6add-4c28-87cd-6da62e6f8a3c",
   "file":"/v2/images/13892850-6add-4c28-87cd-6da62e6f8a3c/file",
   "schema":"/v2/schemas/image"
}
```

This is also updated in the MySQL database:


```
`INSERT INTO image_properties (created_at, updated_at, deleted_at, deleted, image_id, name, VALUE) VALUES ('2020-02-18 04:49:56.655780', '2020-02-18 04:49:56.655783', NULL, 0, '13892850-6add-4c28-87cd-6da62e6f8a3c', 'hw_architecture', 'x86_64')`
```

This is pretty much what happens when you upload an image to Glance. Here's what it looks like if you check on the database:


```
MariaDB [glance]&gt; SELECT images.created_at AS images_created_at, images.updated_at AS images_updated_at, images.deleted_at AS images_deleted_at, images.deleted AS images_deleted, images.id AS images_id, images.name AS images_name, images.disk_format AS images_disk_format, images.container_format AS images_container_format, images.size AS images_size, images.virtual_size AS images_virtual_size, images.status AS images_status, images.visibility AS images_visibility, images.checksum AS images_checksum, images.os_hash_algo AS images_os_hash_algo, images.os_hash_value AS images_os_hash_value, images.min_disk AS images_min_disk, images.min_ram AS images_min_ram, images.owner AS images_owner, images.protected AS images_protected, images.os_hidden AS images_os_hidden, image_properties_1.created_at AS image_properties_1_created_at, image_properties_1.updated_at AS image_properties_1_updated_at, image_properties_1.deleted_at AS image_properties_1_deleted_at, image_properties_1.deleted AS image_properties_1_deleted, image_properties_1.id AS image_properties_1_id, image_properties_1.image_id AS image_properties_1_image_id, image_properties_1.name AS image_properties_1_name, image_properties_1.value AS image_properties_1_value, image_locations_1.created_at AS image_locations_1_created_at, image_locations_1.updated_at AS image_locations_1_updated_at, image_locations_1.deleted_at AS image_locations_1_deleted_at, image_locations_1.deleted AS image_locations_1_deleted, image_locations_1.id AS image_locations_1_id, image_locations_1.image_id AS image_locations_1_image_id, image_locations_1.value AS image_locations_1_value, image_locations_1.meta_data AS image_locations_1_meta_data, image_locations_1.status AS image_locations_1_status  FROM images LEFT OUTER JOIN image_properties AS image_properties_1 ON images.id = image_properties_1.image_id LEFT OUTER JOIN image_locations AS image_locations_1 ON images.id = image_locations_1.image_id  WHERE images.id = '13892850-6add-4c28-87cd-6da62e6f8a3c'\G;
*************************** 1. row ***************************
            images_created_at: 2020-02-18 04:49:55
            images_updated_at: 2020-02-18 04:49:56
            images_deleted_at: NULL
               images_deleted: 0
                    images_id: 13892850-6add-4c28-87cd-6da62e6f8a3c
                  images_name: overcloud-full-vmlinuz
           images_disk_format: aki
      images_container_format: bare
                  images_size: 8106848
          images_virtual_size: NULL
                images_status: active
            images_visibility: public
              images_checksum: 5d31ee013d06b83d02c106ea07f20265
          images_os_hash_algo: sha512
         images_os_hash_value: 9f59d36dec7b30f69b696003e7e3726bbbb27a36211a0b31278318c2af0b969ffb279b0991474c18c9faef8b9e96cf372ce4087ca13f5f05338a36f57c281499
              images_min_disk: 0
               images_min_ram: 0
                 images_owner: c0a46a106d3341649a25b10f2770aff8
             images_protected: 0
             images_os_hidden: 0
image_properties_1_created_at: 2020-02-18 04:49:56
image_properties_1_updated_at: 2020-02-18 04:49:56
image_properties_1_deleted_at: NULL
   image_properties_1_deleted: 0
        image_properties_1_id: 11
  image_properties_1_image_id: 13892850-6add-4c28-87cd-6da62e6f8a3c
      image_properties_1_name: hw_architecture
     image_properties_1_value: x86_64
 image_locations_1_created_at: 2020-02-18 04:49:56
 image_locations_1_updated_at: 2020-02-18 04:49:56
 image_locations_1_deleted_at: NULL
    image_locations_1_deleted: 0
         image_locations_1_id: 7
   image_locations_1_image_id: 13892850-6add-4c28-87cd-6da62e6f8a3c
      image_locations_1_value: swift+config://ref1/glance/13892850-6add-4c28-87cd-6da62e6f8a3c
  image_locations_1_meta_data: {}
     image_locations_1_status: active
1 row in set (0.00 sec)
```

The final result is:


```
(undercloud) [stack@undercloud ~]$ openstack image list
+--------------------------------------+------------------------+--------+
| ID                                   | Name                   | Status |
+--------------------------------------+------------------------+--------+
| 9a26b9da-3783-4223-bdd7-c553aa194e30 | overcloud-full         | active |
| a2914297-c70f-4021-bc3e-8ec2123f6ea6 | overcloud-full-initrd  | active |
| 13892850-6add-4c28-87cd-6da62e6f8a3c | overcloud-full-vmlinuz | active |
+--------------------------------------+------------------------+--------+
(undercloud) [stack@undercloud ~]$
```

Some other minor things are happening during this process, but overall, this is how it looks.

### Conclusion

Understanding the flow of the most common actions in the OpenStack platform will enable you to enhance your troubleshooting skills when facing some issues at work. You can check the status of an image in Glance; know whether an image is in a "queued," "saving," or "active" state; and do some captures in your environment to see what is going on by checking the endpoints you need to check.

I enjoy debugging. I consider this is an important skill for any role—whether you are working in a support, consulting, developer (of course!), or architect role. I hope this article gave you some basic guidelines to start debugging things.

* * *

* In case you're wondering how to open a 2GB .pcap file without problems, here is one way to do it:


```
`$ editcap -c 5000 image-upload.pcap upload-overcloud-image.pcap`
```

This splits your huge capture in smaller captures of 5,000 packets each.

* * *

_This article was [originally posted][12] on LinkedIn and is reprinted with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/glance

作者：[Jair Patete][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jpatete
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yourimagehere_520x292.png?itok=V-xhX7KL (blank background that says your image here)
[2]: https://www.openstack.org/software/releases/ocata/components/glance
[3]: https://www.openstack.org/
[4]: https://wiki.openstack.org/wiki/TripleO
[5]: https://www.tcpdump.org/
[6]: https://docs.openstack.org/keystone/latest/
[7]: https://opensource.com/sites/default/files/uploads/glance-db-calls.png (Searching "glance" inside tcpdump)
[8]: tmp.qBKg0ttLIJ#*
[9]: https://opensource.com/sites/default/files/uploads/glance-architecture.png (Glance architecture)
[10]: https://opensource.com/sites/default/files/uploads/check-flow-status.png (Checking the Glance image status)
[11]: https://opensource.com/sites/default/files/uploads/wireshark-capture.png (Wireshark capture)
[12]: https://www.linkedin.com/pulse/what-happens-behind-doors-when-we-upload-image-glance-patete-garc%25C3%25ADa/?trackingId=czWiFC4dRfOsSZJ%2BXdzQfg%3D%3D
