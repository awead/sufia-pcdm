#!/bin/bash

BASE="http://fedoraAdmin:fedoraAdmin@localhost:8983/fedora/rest/dev"


# Reset
# ActiveFedora assumes a base path of /rest/dev
curl -X DELETE ${BASE}
curl -X DELETE ${BASE}/fcr:tombstone
curl -X PUT ${BASE}


# Generic File 
# An basic container (gf) with a direct container (files) that holds the user's original submitted
# file (content), as well as a thumbnail derivative and FITS characterzation xml file.
curl -i -X PUT -H   "Content-Type: text/turtle"               --data-binary @sufia-generic-file.ttl ${BASE}/gf
curl -i -X PUT -H   "Content-Type: text/turtle"               --data-binary @pcdm-file.ttl          ${BASE}/gf/files
curl -i -X PUT -H   "Content-Type: image/jpeg"                --data-binary @content.jpg            ${BASE}/gf/files/content
curl -i -X PATCH -H "Content-Type: application/sparql-update" --data-binary @pcdm-file.ru           ${BASE}/gf/files/content/fcr:metadata
curl -i -X PUT -H   "Content-Type: image/png"                 --data-binary @thumbnail.png          ${BASE}/gf/files/thumbnail
curl -i -X PATCH -H "Content-Type: application/sparql-update" --data-binary @pcdm-file.ru           ${BASE}/gf/files/thumbnail/fcr:metadata
curl -i -X PUT -H   "Content-Type: text/xml"                  --data-binary @fits.xml               ${BASE}/gf/files/characterization
curl -i -X PATCH -H "Content-Type: application/sparql-update" --data-binary @pcdm-file.ru           ${BASE}/gf/files/characterization/fcr:metadata


# Generic Work - ldp indirect container
curl -i -X PUT -H "Content-Type: text/turtle" --data-binary @sufia-generic-work.ttl ${BASE}/work
curl -i -X PUT -H "Content-Type: text/turtle" --data-binary @ldp-indirect.ttl       ${BASE}/work/members
curl -i -X PUT -H "Content-Type: text/turtle" --data-binary @gf-proxy.ttl           ${BASE}/work/members/gf_proxy


