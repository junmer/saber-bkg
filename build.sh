#!/bin/bash

basedir=$(cd "$(dirname "$0")";pwd)

arrRepo=(
"saber-storage"
"saber-firework"
"saber-router"
"saber-mm"
"saber-ajax"
"saber-promise"
"saber-emitter"
"saber-lang"
"saber-uri"
"saber-cookie"
"saber-rainbow"
"saber-dom"
"saber-viewport"
"saber-env"
"saber-widget"
"saber-scroll"
"saber-run"
"saber-geo"
"saber-tap"
"saber-string"
"saber-matchmedia"
"saber-fastbutton"
"saber-log"
"saber-touch"
)


for repo in ${arrRepo[@]};do
    cd $basedir

    echo "<< ${repo} start"
    [ -d $repo ] || git clone "https://github.com/ecomfe/${repo}.git"
    cd "${basedir}/${repo}"
    git checkout master
    node "${basedir}/pkg.js"

    # git add bower.json
    # git commit -m"add bower.json"
    # git push
    # echo "git push ${repo} done."

    echo ">> ${repo} bower done\n"

done

cd $basedir

ls -l */bower.json
