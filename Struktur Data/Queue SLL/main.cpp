#include <stdio.h>
#include <iostream>
#include <conio.h>
#include <stdlib.h>
using namespace std;

struct queue{
    string nama;
    int nilai;
    queue * next;
};

queue * head = NULL;
queue * tail = NULL;

int max;
int tempat = 0;

int is_empty()
{
    if(tempat==0){
        return 1;
    }
    else{
        return 0;
    }
}
int is_full()
{
    int max = 5;
    if(tempat==max){
        return 1;
    }
    else{
        return 0;
    }
}
void inqueue()
{
    if(is_full()==1){
        cout << "Queue is already empty" << endl;
    }
    else{
        queue * baru;
        baru = new queue;
        cout << "Masukkan Nama : ";
            cin >> baru->nama;
        cout << "Masukkan Nilai : ";
            cin >> baru->nilai;
        baru->next = NULL;
        if(is_empty() == 1)
        {
            head = baru;
            tail = baru;
            tail->next = NULL;
        }
        else
        {
            tail->next = baru;
            tail = baru;
        }
        tempat++;
    }
}
void dequeue()
{
    if(is_empty()==1){
        cout << "Queue is now empty" << endl;
    }
    else{
        queue * hapus;
        hapus = head;
        head = hapus->next;
        delete hapus;
        tempat--;
    }
}
void tampil_data()
{
    if(is_empty()==1){
        cout << "Queue is now empty" << endl;
    }
    else{
        queue * bantu;
        bantu = head;
        int angka = 1;
        while (bantu != NULL){
            cout << angka << ". " << bantu->nama << " " << bantu->nilai << endl;
            bantu = bantu->next;
            angka++;
        }
    }
}
int main()
{
    int pilih;
    do{
        system("cls");
        tampil_data();
        cout << "MENU QUEUE" << endl;
        cout << "1. Inqueue" << endl;
        cout << "2. Dequeue" << endl;
        cout << "3. Tampil Data" << endl;
        cout << "4. Keluar" << endl;
        cout << "Pilihan Anda [1-4] : ";
            cin >> pilih;
        switch (pilih){
        case 1:
            inqueue();
            getch();
            break;
        case 2:
            dequeue();
            getch();
            break;
        case 3:
            tampil_data();
            getch();
            break;
        default:
            cout << "Pilihan Anda Salah" << endl;
            getch();
            break;
        }
    }
    while (pilih != 4);
    return 0;
}
