#!/bin/bash 

source ./cpu-governor.sh


cat >> README.md <<-EOF

Julia
---

~~~
$(bash -x -c 'julia -O 3 src/main.jl' 2>&1)
~~~
EOF