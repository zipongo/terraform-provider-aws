#!/bin/sh
CMD='govendor remove {}; make test >/dev/null 2>/dev/null; if [ $? == 0 ]; then echo "Unused vendored library: {}"; fi; git reset HEAD --hard >/dev/null 2>/dev/null'
jq -r .package[].path vendor/vendor.json | xargs -I{} sh -c $CMD