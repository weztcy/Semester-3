#include "penjumlahan_matriks.h"
#include "pengurangan_matriks.h"
#include "perkalian_matriks.h"
#include "transpose_matriks.h"
#include "determinan_matriks.h"

#include <conio.h>
#include <iostream>

using namespace std;

int main()
{
    int pilihan;
    cout << "===========================" << endl;
    cout << "|| Yohanes Dimas Pratama ||" << endl;
    cout << "|| A11.2021.13254        ||" << endl;
    cout << "|| 43.UG2                ||" << endl;
    cout << "===========================" << endl << endl;

    cout << "// Program Matriks //" << endl << endl;
    do
    {   
        system("cls");
        cout << "-------------------------------------------------------" << endl;
        cout << "Silahkan pilih program matriks yang ingin anda gunakan!" << endl << endl;
        
        cout << "[1] Penjumlahan" << endl;
        cout << "[2] Pengurangan" << endl;
        cout << "[3] Perkalian" << endl;
        cout << "[4] Transpose" << endl;
        cout << "[5] Determinan" << endl;
        cout << "-------------------------------------------------------" << endl << endl;

        cout << "=> Masukkan menu opsi: ";
        cin >> pilihan;
        cout << endl;

        switch (pilihan)
        {
        case 1:
            penjumlahan_matriks();
            cout << endl;
            cout << "Press 'ENTER' to continue... ";
            getch();
            break;

        case 2:
            pengurangan_matriks();
            cout << endl;
            cout << "Press 'ENTER' to continue... ";
            getch();
            break;

        case 3:
            perkalian_matriks();
            cout << endl;
            cout << "Press 'ENTER' to continue... ";
            getch();
            break;

        case 4:
            transpose_matriks();
            cout << endl;
            cout << "Press 'ENTER' to continue... ";
            getch();
            break;

        case 5:
            determinan_matriks();
            cout << endl;
            cout << "Press 'ENTER' to continue... ";
            getch();
            break;

        default:
            cout << "Menu opsi yang anda masukkan tidak dikenali! Silahkan coba lagi." << endl << endl;
            cout << "Press 'ENTER' to continue... ";
            getch();
            break;
        }
    } while (pilihan != 0);
}