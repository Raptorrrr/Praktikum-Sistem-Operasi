#!/bin/bash

declare -a angka
i=0;
x=0;
y=0;
select menu in "Tambah Data" "program utama" "lihat data array"  "penjumlahan data array"  "keluar"
do
 case $menu in

  "Tambah Data")
   echo -n "Masukan Angka di indeks" $i "= "
   read isi
   angka[$i]=$isi;
   let i=$i+1;
   ;;

  "program utama")
   for ((x=0; x<$i; x=x+1))
   do
     echo "index array" $x " : " ${angka[x]}
   done


   terbesar=0;
   for((x=0;x<$i;x++))
   do
    if [[ $terbesar -lt ${angka[x]} ]]
    then
        let terbesar=${angka[x]}
        let j=x
    fi
   done

   terbesar2=0;
   index=0;
   for((x=0;x<$i;x++))
   do
    if [[ $x -eq $j ]]
    then
     let x=x+1;
    let x=x-1;
    else
     if [[ $terbesar2 -lt ${angka[x]} ]]
     then
      let terbesar2=${angka[x]}
      let index=x
      fi
    fi
   done
   echo "nilai terbesar kedua adalah " $terbesar2 "indeks ke" $index
   ;;

  "lihat data array")
    echo ${angka[@]}
   ;;

  "penjumlahan data array")
   jum=0;
   for ((x=0; x<$i; x=x+1))
    do
     let jum=$jum+${angka[x]};
    done
    echo "total " $jum
    ;;

  "keluar")
   break
  ;;

 esac
done
