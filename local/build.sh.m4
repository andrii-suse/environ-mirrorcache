if [ "$MIRRORCACHE_DB_PROVIDER" == mariadb ]; then
    ln -sf __workdir/ma __workdir/db
    rm -r __workdir/pg
else
    ln -sf __workdir/pg __workdir/db
    rm -r __workdir/ma
fi

# /usr/share/mirrorcache/tools/generate-packed-assets || /usr/share/mirrorcache/tools/generate-packed-assets || /usr/share/mirrorcache/tools/generate-packed-assets

mkdir __workdir/cwd
(
cd __workdir/cwd
ln -s ../../.sass-cache .
mkdir .cache
)

