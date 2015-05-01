#!/bin/bash

BASE="http://fedoraAdmin:fedoraAdmin@localhost:8983/fedora/rest/dev"


# Reset
# ActiveFedora assumes a base path of /rest/dev
curl -X DELETE ${BASE}
curl -X DELETE ${BASE}/fcr:tombstone
curl -X PUT ${BASE}


# Generic File
curl -i -X PUT -H "Content-Type: text/turtle" --data-binary @sufia-generic-file.ttl ${BASE}/gf/
curl -i -X PUT -H "Content-Type: text/turtle" --data-binary @pcdm-file.ttl          ${BASE}/gf/files
curl -i -X PUT -H "Content-Type: image/jpeg"  --data-binary @content.jpg            ${BASE}/gf/content
curl -i -X PUT -H "Content-Type: image/png"   --data-binary @thumbnail.png          ${BASE}/gf/thumbnail
curl -i -X PUT -H "Content-Type: text/xml"    --data-binary @fits.xml               ${BASE}/gf/characterization
# Create cover, page0 and page1


# GenericFile

# content file

# thumbnail

# characterization

# The Work - ldp indirect container
curl -i -X PUT -H "Content-Type: text/turtle" --data-binary @sufia-generic-work.ttl ${BASE}/work/
curl -i -X PUT -H "Content-Type: text/turtle" --data-binary @ldp-indirect.ttl       ${BASE}/work/members/
curl -i -X PUT -H "Content-Type: text/turtle" --data-binary @gf-proxy.ttl           ${BASE}/work/members/gf_proxy


