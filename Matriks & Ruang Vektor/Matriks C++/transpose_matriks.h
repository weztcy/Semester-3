#ifndef __TRANSPOSE_MATRIKS_H__
#define __TRANSPOSE_MATRIKS_H__

#include <iostream>
using namespace std;

void transpose_matriks()
{
    int baris, kolom, b, k, matriks[5][5], transpose[5][5];

    cout << "/- Program Transpose Matriks -/" << endl << endl;
    
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    cout << "| Note:                                  |" << endl;
    cout << "| Matriks dapat memiliki order bebas     |" << endl;
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl << endl;
    
    cout << "==========================" << endl;
    cout << "Masukkan panjang baris: ";
    cin >> baris;
    cout << "Masukkan panjang kolom: ";
    cin >> kolom;
    cout << "==========================" << endl << endl;

    // Input nilai matriks
    cout << "<> Masukkan nilai matriks: " << endl;
    for(b = 0; b < baris; b++){
        for(k = 0; k < kolom; k++){
            cout << "   -> Nilai baris ke-" << b + 1 << " kolom ke-"<< k + 1 << ": ";
            cin >> matriks[b][k];
        }
    }
    cout << endl;

    // Menampilkan hasil input matriks
    cout << "*Nilai matriks: " << endl;
    for(b = 0; b < baris; b++){
        for(k = 0; k < kolom; k++){
            cout << " " << matriks[b][k];
        }
        cout << endl;
    }

    // Menghitung transpose matriks
    for(b = 0; b < baris; b++){
        for(k = 0; k < kolom; k++){
            transpose[k][b] = matriks[b][k];
        }
    }
    cout << endl;

    // Menampilkan hasil transpose matriks
    cout << "[=> Hasil transpose matriks: " << endl;
    for(b = 0; b < baris; b++){
        for(k = 0; k < kolom; k++){
            cout << "    " << transpose[b][k];
        }
        cout << endl;
    }
}
#endif // __TRANSPOSE_MATRIKS_H__