#!/usr/bin/env python3
#
# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.

from sys import argv

binfile = argv[1]
outname = argv[2]
nwords = int(argv[3])

offset = 0
if len(argv) > 4:
    offset = int(argv[4])

with open(binfile, "rb") as f:
    bindata = f.read()

#assert len(bindata) < 4*nwords
assert len(bindata) % 4 == 0

# Write the ".vmem" file
with open(outname, "w") as f:

    for i in range(nwords):
        index = i + offset

        if index < len(bindata) // 4:
            w = bindata[4*index : 4*index+4]
            f.write("%02x%02x%02x%02x\n" % (w[3], w[2], w[1], w[0]))
        else:
            f.write("0\n")

# Write the binary file
with open(outname+".bin", "wb") as f:

    for i in range(nwords):
        index = i + offset

        if index < len(bindata) // 4:
            w = bindata[4*index : 4*index+4]
            f.write(w)
        else:
            f.write(b"\x00\x00\x00\x00")
