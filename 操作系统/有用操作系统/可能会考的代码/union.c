union semun
{
    int val
    struct semid_ds* buf
    unsigned short* array;
} arg;
