**trying to create prisma client in dart**

**completed for now :**
1. get the "getManifest" signal from prisma 
2. response to "getManifest"
3. get the dmmf from prisma
4. complete rewrite(from golang client) all the interface(class) to parse the dmmf json into dart classes

**TODO**
1. generate a dart client library based on dmmf 
2. generate graphql to communicate with prisma
3. download the prisma engine without the need to npm
4. mange prisma engine lifecycle
5. docs it
6. testing




**resource if someone want to help:**

- https://prismaio.notion.site/Prisma-Generators-a2cdf262207a4e9dbcd0e362dfac8dc0#21ab5363c8b94eaaa26e4716500583f4
- https://github.com/prisma/prisma/blob/main/ARCHITECTURE.md
- https://prisma-client-py.readthedocs.io/en/stable/contributing/architecture/
- https://github.com/prisma/prisma-client-go
