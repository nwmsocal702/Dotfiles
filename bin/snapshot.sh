#!/bin/bash

md5='/usr/bin/md5sum'
sha='/usr/bin/sha1sum'
pathe=${PATH//:/ }
pathe="${pathe} /lib/ /usr/lib/"

if [ ! -f ${md5} ] ; then
	echo "Cannot find md5sum. Aborting." 1>&2
	exit 1
fi

echo "Calculating md5 database"
cat > ~/md5checksums.txt <<HERE
Snapshot created on ${data}
List of md5checksums
Dir checked /bin/ /sbin/ /usr/bin/ /usr/sbin/ /lib/ /usr/lib/

HERE

for dir in ${pathe}
do
	find ${dir} -type f -print0 | xargs -0 ${md5} >> ~/md5checksums.txt
done
echo "post installation md5 database calculated"

if [ ! -f ${sha} ] ; then
	echo "Cannot find sha1sum" 1>&2
	echo "WARNING: Only md5 database will be stored"
else
	echo "Calculating SHA-1 database"
	cat > ~/sha1checksums.txt <<-HERE
	Snapshot created on ${date}
	List of Sha1checksums
	Dirs checked /bin/ /sbin/ /usr/bin/ /usr/sbin/ /lib/ /usr/lib/

	HERE

	for dir in ${pathe}
	do
		find ${dir} -type f -print0 | \
		xargs -0 ${sha} >> ~/sha1checksums.txt
	done
	echo "post installation sha1 database calculated"
fi
exit 0

