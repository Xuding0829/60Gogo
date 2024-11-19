struct sembuf
{
    unsigned short sem_num;
    short sem_op;
    short sem_flg;
} Psembuf;

semid = semget (SEMKEY , 2 , 0777);
Psembuf.sem_num = first;
Psembuf.sem_op = -1;
Psembuf.sem_flg = SEM_UNDO;
semop (semid , &Psembuf , 1)