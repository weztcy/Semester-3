#ifndef __DETERMINAN_MATRIKS_H__
#define __DETERMINAN_MATRIKS_H__

#include <iostream>
using namespace std;

void determinan_matriks()
{
    int opsi;
    cout << "/- Program Determinan Matriks -/" << endl << endl;

    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    cout << "| Note:                                  |" << endl;
    cout << "| Matriks harus memiliki ordo yang sama. |" << endl;
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl << endl;

    cout << "======================" << endl;
    cout << "Pilih ordo determinan!" << endl;
    cout << "1. Matriks 2x2" << endl;
    cout << "2. Matriks 3x3" << endl;
    cout << "======================" << endl << endl;

    cout << "Masukkan menu opsi: ";
    cin >> opsi;
    cout << endl;
    
    if (opsi == 1)
    {
        int baris, kolom, b, k, matriks[2][2], determinan[2][2];

        // Input nilai matriks 
        cout << "<> Masukkan nilai matriks: " << endl;
        for(b = 0; b < 2; b++){
            for(k = 0; k < 2; k++){
                cout << "   -> Nilai baris ke-" << b + 1 << " kolom ke-"<< k + 1 << ": ";
                cin >> matriks[b][k];
            }
        }
        cout << endl;

        // Menampilkan hasil input matriks
        cout << "*Nilai matriks: " << endl;
        for(b = 0; b < 2; b++){
            for(k = 0; k < 2; k++){
                cout << " " << matriks[b][k];
            }
            cout << endl;
        }

        // Menghitung determinan matriks 2x2
        int 
        operasi1 = (matriks[0][0] * matriks[1][1]),
        operasi2 = (matriks[0][1] * matriks[1][0]);

        cout << endl;

        // Menampilkan hasil determinan matriks 2x2
        cout << "Determinan matriks: " << operasi1 - operasi2 << endl;
    }
    else if(opsi == 2)
    {
        int baris, kolom, b, k, matriks[3][3], determinan[3][3];

        // Input nilai matriks 
        cout << "<> Masukkan nilai matriks: " << endl;
        for(b = 0; b < 3; b++){
            for(k = 0; k < 3; k++){
                cout << "   -> Nilai baris ke-" << b + 1 << " kolom ke-"<< k + 1 << ": ";
                cin >> matriks[b][k];
            }
        }
        cout << endl;

        // Menampilkan hasil input matriks
        cout << "*Nilai matriks: " << endl;
        for(b = 0; b < 3; b++){
            for(k = 0; k < 3; k++){
                cout << " " << matriks[b][k];
            }
            cout << endl;
        }

        // Menghitung determinan matriks 3x3
        int
        operasi1 = (matriks[0][0] * matriks[1][1] * matriks[2][2]), 
        operasi2 = (matriks[0][1] * matriks[1][2] * matriks[2][0]), 
        operasi3 = (matriks[0][2] * matriks[1][0] * matriks[2][1]), 
        operasi4 = (matriks[0][2] * matriks[1][1] * matriks[2][0]), 
        operasi5 = (matriks[0][0] * matriks[1][2] * matriks[2][1]), 
        operasi6 = (matriks[0][1] * matriks[1][0] * matriks[2][2]);

        cout << endl;

        // Menampilkan hasil perhitungan determinan matriks 3x3
        cout << "[=> Hasil determinan matriks: " << endl;
        cout << "    " << operasi1 + operasi2 + operasi3 - operasi4 - operasi5 - operasi6 << endl << endl;
    }
    else{
        cout << "Menu tidak ada! Silahkan coba lagi." << endl;
    }
}
#endif // __DETERMINAN_MATRIKS_H__