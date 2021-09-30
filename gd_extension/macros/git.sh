#!/usr/bin/env bash

while getopts k:s:p: aflag; do
    case $aflag in
        k) keep_test=$OPTARG;;
        s) use_ssh=$OPTARG;;
        p) path=$OPTARG;;
    esac
done

cd ${path}

echo "creating projects path..."

mkdir projects

echo "cloning godot-cpp repo"

if ${use_ssh}
then 
    git clone --recursive git@github.com:godotengine/godot-cpp.git
else 
    git clone --recursive https://github.com/godotengine/godot-cpp.git
fi

cd godot-cpp

if ${keep_test}
then 
    echo "Configuring test project"
    mv test ../projects/example
    cd ../projects/example
    mv demo/example.gdextension .
    rm -R demo/

else 
    rm -R test/
    echo "Removed test project"
fi

echo "Finished successfully!"
echo "Go back to GDExtension wizard and click DONE"