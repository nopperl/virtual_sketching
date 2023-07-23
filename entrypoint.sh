#!/bin/sh
cd /app/virtual_sketching
./download_model.sh
find sample_inputs/clean_line_drawings -type f -name '*.png' -exec basename {} \; | xargs -L1 -I{} ./test_lineart.sh {}
