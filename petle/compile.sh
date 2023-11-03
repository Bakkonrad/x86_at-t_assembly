#!/bin/bash

if [ ! $1 ]; then #sprawdza ilosc argumentow
    echo "Uzycie: $0 <nazwa_pliku.s>"
    exit 1
fi

source_file="$1"
output_file="${source_file%.s}" 

#kompilacja do pliku obiektowego .o
as --32 -g "$source_file" -o "$output_file.o"

if [ $? -ne 0 ]; then
    echo "Blad podczas kompilacji"
    exit 1
fi

#linkowanie do pliku wykonalnego
ld -melf_i386 "$output_file.o" -o "$output_file"

if [ $? -ne 0 ]; then
    echo "Blad podczas linkowania"
    exit 1
fi

echo "Kompilacja zakonczona pomyslnie. Wygenerowano plik: $output_file"
