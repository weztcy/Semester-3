#include <stdio.h>
#include <iostream>
#include <conio.h>
#include <stdlib.h>
using namespace std;

struct stack
{
    string nama;
    int nilai;
    stack * next;
};

stack * head = NULL;
stack * tail = NULL;
int top = 0;
int max;

int if_empty(){
    if(top==0){
        return 1;
    }
    else{
        return 0;
    }
}

int jika_penuh(){
    int max = 5;
    if(top==max){
        return 1;
    }
    else{
        return 0;
    }
}

void push(){
    if(jika_penuh()==1){
        cout << "Stack is already full" << endl;
    }
    else{
        stack *baru;
        baru = new stack;
        cout << "Masukkan Nama : ";
        cin >> baru->nama;
        cout << "Masukkan Nilai : ";
        cin >> baru->nilai;
        baru->next = NULL;
        if(if_empty()==1){
            head = baru;
            tail = baru;
            tail->next = NULL;
        }
        else{
            tail->next = baru;
            tail = baru;
        }
        top++;
    }
}
void pop(){
    stack *hapus, *bantu;
    if(if_empty()==0){
        if(head != tail){
            bantu = head;
            while (bantu->next != tail)
            {
                bantu = bantu->next;
            }
            hapus = tail;
            tail = bantu;
            tail->next = NULL;
            delete hapus;
        }
        else{
            hapus = tail;
            head = NULL;
            tail = NULL;
            delete hapus;
        }
        top--;
    }
    else{
        cout << "Stack is now empty" << endl;
    }
}
void tampil(){
    if(if_empty()==1){
        cout << "Stack is now empty" << endl;
    }
    else{
        stack *bantu;
        bantu = head;
        int angka = 1;
        while (bantu != NULL){
            cout << angka << ". " << bantu->nama << " " << bantu->nilai << endl;
            bantu = bantu->next;
            angka++;
        }
    }
}
int main(){
    int pilih;
    do{
        system("cls");
        tampil();
        cout << "MENU STACK" << endl;
        cout << "1. Push Data" << endl;
        cout << "2. Pop Data" << endl;
        cout << "3. Tampil Data" << endl;
        cout << "4. Keluar" << endl;
        cout << "Pilihan Anda [1-4] : " << endl;
        cin >> pilih;
        switch (pilih){
        case 1:
            push();
            getch();
            break;
        case 2:
            pop();
            getch();
            break;
        case 3:
            tampil();
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
