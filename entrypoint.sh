#!/bin/sh
output_dir=outputs/sampling/clean_line_drawings__pretrain_clean_line_drawings
cd /app/virtual_sketching
./download_model.sh
find sample_inputs/clean_line_drawings -type f -name '*.png' -exec basename {} \; | xargs -L1 -I{} ./test_lineart.sh {}
find $output_dir/seq_data -type f -name '*.npz' -exec python tools/svg_conversion.py --file {} \;
mkdir -p $output_dir/svg
find $output_dir/seq_data/* -type d -exec basename {} \; | xargs -L1 -I{} cp $output_dir/seq_data/{}/single.svg $output_dir/svg/{}.svg
