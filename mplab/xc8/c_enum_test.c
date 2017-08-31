#include <stdio.h>
#include <stdlib.h>

typedef enum
{
    first  = 0x01,
    second = 0x02
} enumA_t;

typedef enum
{
    third  = 0x03,
    fourth = 0x04
} enumB_t;

int main(void)
{
    enumA_t A;
    enumB_t B;

    printf("sizeof(enumA_t) = %d\n", (int)sizeof(enumA_t));
    printf("sizeof(enumB_t) = %d\n", (int)sizeof(enumB_t));

    A = first;
    B = third;
    printf("A = first = %d\n", (int)A);
    printf("B = third = %d\n", (int)B);
    printf("A == B     : %s\n", (A==B) ? "True" : "False");
    printf("A >= B     : %s\n", (A>=B) ? "True" : "False");
    printf("A <= B     : %s\n", (A<=B) ? "True" : "False");
    printf("A == 0x01  : %s\n", (A==0x01) ? "True" : "False");
    printf("A == 0x02  : %s\n", (A==0x02) ? "True" : "False");
    A = 0x01;
    A = 0x88;
    A = A&B;
    A = A|B;
    A = A+B;
    A = A*B;
    printf("sizeof(A) = %d\n", (int)sizeof(A));
    printf("sizeof(A&B) = %d\n", (int)sizeof(A&B));
    printf("sizeof(A|B) = %d\n", (int)sizeof(A|B));
    printf("sizeof(A+B) = %d\n", (int)sizeof(A+B));
    printf("sizeof(A*B) = %d\n", (int)sizeof(A*B));
    /* code */
    return 0;
}