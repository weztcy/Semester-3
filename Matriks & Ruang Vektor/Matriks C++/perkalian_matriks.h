#ifndef __PERKALIAN_MATRIKS_H__
#define __PERKALIAN_MATRIKS_H__

#include <iostream>
using namespace std;

void perkalian_matriks(){
    int baris1, kolom1, baris2, kolom2, b, k, matriks1[5][5], matriks2[5][5], hasil[5][5];

    cout << "/- Program Perkalian Matriks -/" << endl << endl;
    
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    cout << "| Note:                                 |" << endl;
    cout << "| Matriks pertama harus memiliki jumlah |" << endl;
    cout << "| kolom yang sama dengan jumlah baris   |" << endl;
    cout << "| pada matriks kedua.                   |" << endl;
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl << endl;

    cout << "=========================================" << endl;
    cout << "Masukkan panjang baris matriks pertama: ";
    cin >> baris1;
    cout << "Masukkan panjang kolom matriks pertama: ";
    cin >> kolom1;
    cout << "=========================================" << endl << endl;

    cout << "=========================================" << endl;
    cout << "Masukkan panjang baris matriks kedua: ";
    cin >> baris2;
    cout << "Masukkan panjang kolom matriks kedua: ";
    cin >> kolom2;
    cout << "=========================================" << endl << endl;
    
    if(kolom1 != baris2){
        cout << "Matriks tidak dapat dikalikan" << endl;
    }
    else{
        // Input nilai matriks pertama
        cout << "<> Masukkan nilai matriks pertama: " << endl;
        for(b = 0; b < baris1; b++){
            for(k = 0; k < kolom1; k++){
                cout << "   -> Nilai baris ke-" << b + 1 << " kolom ke-"<< k + 1 << ": ";
                cin >> matriks1[b][k];
            }
        }
        cout << endl;

        // Input nilai matriks kedua
        cout << "<> Masukkan nilai matriks kedua: " << endl;
        for(b = 0; b < baris2; b++){
            for(k = 0; k < kolom2; k++){
                cout << "   -> Nilai baris ke-" << b + 1 << " kolom ke-"<< k + 1 << ": ";
                cin >> matriks2[b][k];
            }
        }
        cout << endl;

        // Menampilkan nilai matriks pertama
        cout << "*Nilai matriks pertama: " << endl;
        for(b = 0; b < baris1; b++){
            for(k = 0; k < kolom1; k++){
                cout << " " << matriks1[b][k];
            }
            cout << endl;
        }
        cout << endl;

        // Menampilkan nilai matriks kedua
        cout << "*Nilai matriks kedua: " << endl;
        for(b = 0; b < baris2; b++){
            for(k = 0; k < kolom2; k++){
                cout << " " << matriks2[b][k];
            }
            cout << endl;
        }
        cout << endl;

        // Menghitung perkalian matriks
        for(b = 0; b < baris1; b++){
            for(k = 0; k < kolom2; k++){
                hasil[b][k] = 0;
                for(int i = 0; i < kolom1; i++){
                    hasil[b][k] += matriks1[b][i] * matriks2[i][k];
                }
            }
        }

        // Menampilkan hasil perkalian matriks
        cout << "[=> Hasil perkalian matriks: " << endl;
        for(b = 0; b < baris1; b++){
            for(k = 0; k < kolom2; k++){
                cout << "    "  << hasil[b][k];
            }
            cout << endl;
        }
    }
}
#endif // __PERKALIAN_MATRIKS_H__