#!/bin/sh

# If you get a permission denied with this, using the
# snap package on Ubuntu 18.04+, you need to run
#    snap connect bpftrace:system-trace

bpftrace -l
