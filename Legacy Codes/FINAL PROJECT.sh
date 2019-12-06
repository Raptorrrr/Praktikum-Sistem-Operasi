#!/bin/bash 


declare -a output;
declare -a barang;
declare -a jumlah;
declare -a price;
declare -a masuk;

input=0;
i=0;
j=0;
keluar=0;

function Pemasukan(){
	echo "========================================"
	echo "  Masukan Tabungan                      "
	echo "========================================"
	echo -n " Input Uang Tabungan : "
	read pemasukan
	echo "========================================"
	let masuk[$i]=$pemasukan;
	let input=$input+${masuk[$i]};

	clear 
	echo "========================================"
	echo "        Saldo Bertambah Menjadi         "
	echo "      		$input"
	echo "========================================"
	
 	
	let i=i+1;

}


function Pengeluaran(){
	clear

	echo "========================================"
	echo "             Pengeluaran               "
	echo "========================================"
	echo -n "Nama Barang : "
	read barang
	echo -n "Jumlah barang : "
	read qty
	echo -n "Harga Barang :  "
	read price 
	echo "========================================"

	clear 

	echo "========================================"
	echo "             Pengeluaran               "
	echo "========================================"
	echo " Nama Barang : " $barang
	echo " Jumlah barang : " $qty
	echo " Harga Barang :  " $price
	echo "========================================"
	echo -n "Sudah sesuai (y/n) ? "
	read a

	if [[ $a == "y" ]]; then
 
		barang[$j]=$barang;
		price[$j]=$price;
		jumlah[$j]=$qty
		let output[$j]=${price[$j]}*${jumlah[$j]};	
		
		echo "========================================"
		echo " Tabungan Berkurang Rp." ${output[$j]}
		echo "========================================" 
		let input=$input-${output[$j]}
 		let keluar=keluar+${output[$j]}
 		let j=$j+1;
	elif [[ $a == "n" ]]; then
		clear
	fi
	


}

function viewpengeluaran(){
clear
if [[ $j -eq 0 ]]; then
	echo "Tidak Ada Pengeluaran"
else
	echo "============================================================================"
	echo "Barang 			Jumlah 			Harga			Total         "
	echo "============================================================================"
	for (( x = 0; x < $j; x++ )); do
		echo "${barang[$x]}			${jumlah[$x]}			${price[x]}			${output[$x]}" 
	done
	echo "============================================================================"
	echo "Total Pengeluaran = " $keluar
	echo "============================================================================"	
	echo "Sisa Saldo		= " $input
fi
}

function viewpemasukan(){
clear
if [[ $i -eq 0 ]]; then
	echo "Tidak Ada Pemasukan"
else
	echo "============================================================================"
	echo "Saldo Sekarang = $input"
	echo "============================================================================"
	echo "Riwayat Pemasukan"
	echo "============================================================================"
	for (( y = 0; y < $i; y++ )); 
		do
		echo "${masuk[$y]}"
		echo ""	
		done	
	echo "============================================================================"
fi
}

function cetak(){
clear
echo "============================================================================"	
echo "1. Tips Menabung"
echo "2. Manfaat Menabung"
echo "3. Menabung Menurut Agama"
echo "4. link git hub saya"
echo "============================================================================"	
echo -n "Masukan pil"
read pil

if [[ $pil -eq 1 ]]; then
	firefox https://koinworks.com/blog/tips-menabung-untuk-anak-muda/
elif [[ $pil -eq 2 ]]; then
		firefox https://bobo.grid.id/read/08678227/5-manfaat-menabung?page=all
elif [[ $pil -eq 3 ]]; then
	firefox https://pengusahamuslim.com/3345-menabung-dalam-timbangan-1775.html
elif [[ $pil -eq 4 ]]; then
	firefox https://github.com/Raptorrrr/Praktikum-Sistem-Operasi
fi

}

function note(){
	clear 
	echo "============================================================================"	
	echo -n "Masukan nama notesnya  "
	read note
	echo "============================================================================"	

	nano $note.txt

	clear
	echo "============================================================================"	
	echo "Note $note berhasil di buat"
	echo "============================================================================"

}

function viewnote(){
	clear 
	ls -l
	echo "============================================================================"	
	echo -n "lihat notesnya"
	read notes
	echo "============================================================================"	
	bash $notes.txt

}

select menu in "Masukan Pemasukan" "Masukan Pengeluaran" "Detail Pemasukan dan Pengeluaran" "Lihat Tips dan Trick Menabung" "Buat Notes" "exit"
do 
	case $menu in
		"Masukan Pemasukan")
		Pemasukan
		;;

		"Masukan Pengeluaran")
		Pengeluaran
		;;

		"Detail Pemasukan dan Pengeluaran")	
		echo "============================================================================"
		echo "1.Detail Pemasukan "
		echo "2.Detail keluar"
		echo -n "Masukan input "
		read menu1
		echo "============================================================================"		
		if [[ menu1 -eq 1 ]]; then
			viewpemasukan
		fi

		if [[ menu1 -eq 2 ]]; then
			viewpengeluaran
		fi
		;;

		"Lihat Tips dan Trick Menabung")
			cetak
		;;

		"Buat Notes")
		echo "============================================================================"	
		echo "1. Buat Notes"
		echo "2. Lihat Notes"
		echo -n "Masukan Pilihan : "
		read pill
		echo "============================================================================"	

		clear
		if [[ $pill -eq 1 ]]; then
			note
		elif [[ $pill -eq 2 ]]; then
			viewnote
		fi		

		;;

		"exit")
		clear
		echo "============================================================================"
		echo " Terima Kasih    							  "
		echo "============================================================================"
		echo " Iqbal Alfiansyah 				18081010123"
		echo "============================================================================"

		break
		;;

	esac
done
