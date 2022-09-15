cd ../iris-toolbox-knowledge-base

if [[ -d ./source ]]; then
    rm -rf ./source
fi

mkdir source

find . -name '*.md' -o -name '.pages' \
    | xargs cp --parents -t ./source

cp README.md ./source/index.md

cp -r ./extra ./source/extra

tree -a ./source

cd ..