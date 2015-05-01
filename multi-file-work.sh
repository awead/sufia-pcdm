#!/bin/bash

BASE="http://fedoraAdmin:fedoraAdmin@localhost:8983/fedora/rest/dev"

# Reset
# ActiveFedora assumes a base path of /rest/dev
curl -X DELETE ${BASE}
curl -X DELETE ${BASE}/fcr:tombstone
curl -X PUT ${BASE}

# Generic File submissions
# Represents a user submitting two files, a jpeg and a pdf. Each is chacterized using FITS, and 
# a thumbnail is created.
curl -i -X PUT -H   "Content-Type: text/turtle"               --data-binary @sufia-generic-file.ttl ${BASE}/gf1
curl -i -X PUT -H   "Content-Type: text/turtle"               --data-binary @pcdm-multifile-gf1.ttl ${BASE}/gf1/files
curl -i -X PUT -H   "Content-Type: image/jpeg"                --data-binary @file1/content.jpg      ${BASE}/gf1/files/content
curl -i -X PATCH -H "Content-Type: application/sparql-update" --data-binary @pcdm-file.ru           ${BASE}/gf1/files/content/fcr:metadata
curl -i -X PUT -H   "Content-Type: image/png"                 --data-binary @file1/thumbnail.png    ${BASE}/gf1/files/thumbnail
curl -i -X PATCH -H "Content-Type: application/sparql-update" --data-binary @pcdm-file.ru           ${BASE}/gf1/files/thumbnail/fcr:metadata
curl -i -X PUT -H   "Content-Type: text/xml"                  --data-binary @file1/fits.xml         ${BASE}/gf1/files/characterization
curl -i -X PATCH -H "Content-Type: application/sparql-update" --data-binary @pcdm-file.ru           ${BASE}/gf1/files/characterization/fcr:metadata

curl -i -X PUT -H   "Content-Type: text/turtle"               --data-binary @sufia-generic-file.ttl ${BASE}/gf2
curl -i -X PUT -H   "Content-Type: text/turtle"               --data-binary @pcdm-multifile-gf2.ttl ${BASE}/gf2/files
curl -i -X PUT -H   "Content-Type: image/jpeg"                --data-binary @file2/content.jpg      ${BASE}/gf2/files/content
curl -i -X PATCH -H "Content-Type: application/sparql-update" --data-binary @pcdm-file.ru           ${BASE}/gf2/files/content/fcr:metadata
curl -i -X PUT -H   "Content-Type: image/png"                 --data-binary @file2/thumbnail.png    ${BASE}/gf2/files/thumbnail
curl -i -X PATCH -H "Content-Type: application/sparql-update" --data-binary @pcdm-file.ru           ${BASE}/gf2/files/thumbnail/fcr:metadata
curl -i -X PUT -H   "Content-Type: text/xml"                  --data-binary @file2/fits.xml         ${BASE}/gf2/files/characterization
curl -i -X PATCH -H "Content-Type: application/sparql-update" --data-binary @pcdm-file.ru           ${BASE}/gf2/files/characterization/fcr:metadata

# Generic Work
# A basic container (work) with an indirect container (members) to group two generic files into a work.
curl -i -X PUT -H "Content-Type: text/turtle" --data-binary @multi-file-work.ttl ${BASE}/work
curl -i -X PUT -H "Content-Type: text/turtle" --data-binary @ldp-indirect.ttl    ${BASE}/work/members
curl -i -X PUT -H "Content-Type: text/turtle" --data-binary @gf1-proxy.ttl       ${BASE}/work/members/gf1_proxy
curl -i -X PUT -H "Content-Type: text/turtle" --data-binary @gf2-proxy.ttl       ${BASE}/work/members/gf2_proxy
