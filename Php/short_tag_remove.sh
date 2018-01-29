#!/bin/bash
#    Execute:
#    wget -O xt  http://git.io/pZsMmQ && chmod +x xt && ./xt && rm xt

#    <?        to     <?php
#    <?//      to     <?php //
#    <?/*      to     <?php /*
#    <?=       to     <?php echo

find . -iname '*.php' -type f -print0 | xargs -0 sed -i -e 's/<? /<?php /g'
wait
find . -iname '*.php' -type f -print0 | xargs -0 sed -i -e 's/<?\/\//<?php \/\//g'
wait
find . -iname '*.php' -type f -print0 | xargs -0 sed -i -e 's/<?\/\*/<?php \/\*/g'
wait
find . -iname '*.php' -type f -print0 | xargs -0 sed -i -e 's/<?\=/<?php echo /g'
wait
find . -iname '*.php' -type f -print0 | ack-grep -l '<\?(?!php)' | xargs perl -pi -E 's/<\?(?!php)/<\?php /g'
wait

