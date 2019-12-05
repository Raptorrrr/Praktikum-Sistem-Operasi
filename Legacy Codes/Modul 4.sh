#!/bin/bash

echo "masukan angka"
read a;
  for  ((i=1; i<=a; i=i+1))
  do
     let three=$i%3
     let five=$i%5
     let tv=$i%15

     if [ $three -eq 0 ] && [  $five -eq 0 ]
     then
      echo "fizzbuzz"

     elif [ $five -eq 0 ]
     then
     echo "buzz"

     elif [ $three -eq 0 ]
     then
     echo "fizz"
     else
    echo "$i"
     fi
  done
