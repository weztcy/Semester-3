#ifndef __PENJUMLAHAN_MATRIKS_H__
#define __PENJUMLAHAN_MATRIKS_H__
#include <iostream>
using namespace std;

void penjumlahan_matriks()
{
    int baris, kolom, b, k, matriks1[5][5], matriks2[5][5];

    cout << "/- Program Penjumlahan Matriks -/" << endl << endl;
    
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    cout << "| Note:                                  |" << endl;
    cout << "| Matriks harus memiliki ordo yang sama. |" << endl;
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl << endl;

    cout << "==========================" << endl;
    cout << "Masukkan panjang baris: ";
    cin >> baris;
    cout << "Masukkan panjang kolom: ";
    cin >> kolom;
    cout << "==========================" << endl << endl;
    
    // Input nilai matriks pertama
    cout << "<> Masukkan nilai matriks pertama: " << endl;
    for(b = 0; b < baris; b++){
        for(k = 0; k < kolom; k++){
            cout << "   -> Nilai baris ke-" << b + 1 << " kolom ke-"<< k + 1 << ": ";
            cin >> matriks1[b][k];
        }
    }
    cout << endl;

    // Input nilai matriks kedua
    cout << "<> Masukkan nilai matriks kedua: " << endl;
    for(b = 0; b < baris; b++){
        for(k = 0; k < kolom; k++){
            cout << "   -> Nilai baris ke-" << b + 1 << " kolom ke-"<< k + 1 << ": ";
            cin >> matriks2[b][k];
        }
    }
    cout << endl;
    
    // Menampilkan hasil input matriks pertama
    cout << "*Nilai matriks pertama: " << endl;
    for(b = 0; b < baris; b++){
        for(k = 0; k < kolom; k++){
            cout << " " << matriks1[b][k];
        }
        cout << endl;
    }
    cout << endl;

    // Menampilkan hasil input matriks kedua
    cout << "*Nilai matriks kedua: " << endl;
    for(b = 0; b < baris; b++){
        for(k = 0; k < kolom; k++){
            cout << " " << matriks2[b][k];
        }
        cout << endl;
    }
    cout << endl;
    
    // Menampilkan hasil perhitungan penjumlahan matriks
    cout << "[=> Hasil penjumlahan matriks: " << endl;
    for(b = 0; b < baris; b++){
        for(k = 0; k < kolom; k++){
            cout << "    " << matriks1[b][k] + matriks2[b][k];
        }
        cout << endl;
    }
    cout << endl;
}
#endif // __PENJUMLAHAN_MATRIKS_H__