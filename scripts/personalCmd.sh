#!/bin/bash
# Copyright 2018 Dennis Tu

function update_tag_usage {
    echo "usage:"
    echo "-d <directory>    : update tag source directory"
    echo "-o <directory>    : output tag directory, default ~/.vim/tag"
    echo "-h for help"

    return 0
}

function update_tag {
    SOURCE_DIR=
    OUTPUT_DIR=$HOME/.vim/tags

    OPTIND=1
    while getopts "d:h" FLAG; do
        case $FLAG in
            d)
                echo "$OPTARG"
                SOURCE_DIR=$OPTARG;;
            h)
                update_tag_usage
                return -1;;
            \?)
                echo "unrecognized option"
                update_tag_usage
                return -1;;
        esac
    done

    if [[ -z $SOURCE_DIR ]]; then
        echo "must specify source code directory"
        update_tag_usage
        return -1;
    fi

    if [[ ! -d $OUTPUT_DIR ]]; then
        mkdir -p $OUTPUT_DIR
    fi

    SOURCE_DIR="$(cd $SOURCE_DIR && pwd)"

    FILE_LIST=${OUTPUT_DIR}"/cscope.fl"
    CSCOPE_OUT=${OUTPUT_DIR}"/cscope.out"
    CTAGS_OUT=${OUTPUT_DIR}"/tags"

    if [ -f ${FILE_LIST} ]; then
        rm ${FILE_LIST}
    fi

    if [ -f ${CSCOPE_OUT} ]; then
        rm ${CSCOPE_OUT}
    fi

    find ${SOURCE_DIR} -type f -name "*.c" -o -type f -name "*.cxx" -o -type f -name \
        "*.cpp" -o -type f -name "*.h" -o -type f -name "*.s" -o -type f \
        -name "*.S" -o -type f -name "*.inc"> ${FILE_LIST}

    cscope -bkqi ${FILE_LIST} -f${CSCOPE_OUT} > /dev/null 2>&1

    ctags -L ${FILE_LIST} -f${CTAGS_OUT} > /dev/null 2>&1

    return 0;
}
