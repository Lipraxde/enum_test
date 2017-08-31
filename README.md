# C和C++的enum測試
---
這篇的目的是想要測試在C/C++中enum的表現，原因是在ptt看到一篇文有關enum的問題[[問題] 列舉型別enum](https://www.ptt.cc/bbs/C_and_CPP/M.1504087553.A.A73.html)，想說寫程式練習一下，原本預期gcc的編譯器應該會在我嘗試要把int隱式轉型成自己用enum定義的type時提出警告，結果竟然沒有OAO，我記得以前寫嵌入式的時候會有啊！所以就打算來實驗一下。

測試的編譯器有(基本上是把我有用過的測試一遍)
 * gcc/g++(4.8.1)
 * MPLAB 的 XC8(1.31)、MCC18(3.46)
 * IAR(8051) 9.10.1 的 C、C++

MPLAB、IAR沒有執行結果


### code解說
---
##### C語言的部分
我宣告了兩個type enumA_t、enumB_t，在宣告中指定了enum裡面成員的值

```c
typedef enum
{
    first  = 0x01,
    second = 0x02,
} enumA_t;

typedef enum
{
    third  = 0x03,
    fourth = 0x04,
} enumB_t;
```
第一步，在main中，用enumA_t、enumB_t分別宣告A、B變數，接著用sizeof看看enumA_t、enumB_t佔多大空間
```c
enumA_t A;
enumB_t B;

printf("sizeof(enumA_t) = %d\n", (int)sizeof(enumA_t));
printf("sizeof(enumB_t) = %d\n", (int)sizeof(enumB_t));
```
第二步，將A指定為first，將B指定為third。把兩個變數轉型成int的值、互相比較的boolen、跟int做比較boolen值印出來看看結果
```c
A = first;
B = third;
printf("A = first = %d\n", (int)A);
printf("B = third = %d\n", (int)B);
printf("A == B     : %s\n", (A==B) ? "True" : "False");
printf("A >= B     : %s\n", (A>=B) ? "True" : "False");
printf("A <= B     : %s\n", (A<=B) ? "True" : "False");
printf("A == 0x01  : %s\n", (A==0x01) ? "True" : "False");
printf("A == 0x02  : %s\n", (A==0x02) ? "True" : "False");
```
第三步，指定int值給A看看，用A、B兩個做運算看看，主要目的在於觀察compiler對於這樣的運算會不會提出警告
```c
A = 0x01;
A = 0x88;
A = A&B;
A = A|B;
A = A+B;
A = A*B;
```
最後，把變數A、A跟B做運算的結果的size印出來，看看他們的大小
```c
printf("sizeof(A) = %d\n", (int)sizeof(A));
printf("sizeof(A&B) = %d\n", (int)sizeof(A&B));
printf("sizeof(A|B) = %d\n", (int)sizeof(A|B));
printf("sizeof(A+B) = %d\n", (int)sizeof(A+B));
printf("sizeof(A*B) = %d\n", (int)sizeof(A*B));
```
##### C++的部分
基本上跟C語言的程式差不多，唯一的差別在於使用了C++11的一個語法，指定了enum用的byte數
```c++
typedef enum: unsigned char
{
	first  = 0x01,
	second = 0x02,
} enumA_t;

typedef enum: unsigned char
{
    third  = 0x03,
    fourth = 0x04,
} enumB_t;
```
### gcc/g++ 4.8.1
---
##### 首先先測試C，編譯程式使用
	~/$make c_example
    gcc -Wall -std=c99 c_enum_test.c -o c_enum_test.exe
gcc編譯器只有在我們使用A跟B比較時提出警告comparison between 'enumA_t' and 'enumB_t'，警告我們拿enumA_t、enumB_t做比較

	c_enum_test.c:28:35: warning: comparison between 'enumA_t' and 'enumB_t' [-Wenum-compare]
     	printf("A == B     : %s\n", (A==B) ? "True" : "False");
                                   ^
	c_enum_test.c:29:35: warning: comparison between 'enumA_t' and 'enumB_t' [-Wenum-compare]
     	printf("A >= B     : %s\n", (A>=B) ? "True" : "False");
                                   ^
	c_enum_test.c:30:35: warning: comparison between 'enumA_t' and 'enumB_t' [-Wenum-compare]
     	printf("A <= B     : %s\n", (A<=B) ? "True" : "False");
                                   ^
##### 測試C++的部分，編譯程式使用
	~/$make cpp_example
    g++ -std=c++11 -Wall -fpermissive cpp_enum_test.cpp -o cpp_enum_test.exe
g++編譯器對於28~30行拿A、B互相比較時也同樣的提出警告

    cpp_enum_test.cpp:28:37: warning: comparison between 'enum enumA_t' and 'enum enumB_t' [-Wenum-compare]
         printf("A == B     : %s\n", (A==B) ? "True" : "False");
                                         ^
    cpp_enum_test.cpp:29:37: warning: comparison between 'enum enumA_t' and 'enum enumB_t' [-Wenum-compare]
         printf("A >= B     : %s\n", (A>=B) ? "True" : "False");
                                         ^
    cpp_enum_test.cpp:30:37: warning: comparison between 'enum enumA_t' and 'enum enumB_t' [-Wenum-compare]
         printf("A <= B     : %s\n", (A<=B) ? "True" : "False");
                                         ^
在33~34行對我想直接將int指定給A時提出invalid conversion from 'int' to 'enumA_t'，即使是first=0x01也是一樣

    cpp_enum_test.cpp:33:7: warning: invalid conversion from 'int' to 'enumA_t' [-fpermissive]
         A = 0x01;
           ^
    cpp_enum_test.cpp:34:7: warning: invalid conversion from 'int' to 'enumA_t' [-fpermissive]
         A = 0x88;
           ^
而34~38行也同樣指出了invalid conversion from 'int' to 'enumA_t'，看來A和B做數學、邏輯運算時，都是轉成int再算的         

    cpp_enum_test.cpp:35:10: warning: invalid conversion from 'int' to 'enumA_t' [-fpermissive]
         A = A&B;
              ^
    cpp_enum_test.cpp:36:10: warning: invalid conversion from 'int' to 'enumA_t' [-fpermissive]
         A = A|B;
              ^
    cpp_enum_test.cpp:37:10: warning: invalid conversion from 'int' to 'enumA_t' [-fpermissive]
         A = A+B;
              ^
    cpp_enum_test.cpp:38:10: warning: invalid conversion from 'int' to 'enumA_t' [-fpermissive]
         A = A*B;
              ^
##### 執行結果C
可以看到enumA_t、enumB_t佔用的大小都是4個byte

    sizeof(enumA_t) = 4
    sizeof(enumB_t) = 4
而用printf轉型成int輸出時，則是輸出在宣告enum時所給定的值
    
    A = first = 1
    B = third = 3
雖然gcc給了警告，不過他還是能用enumA_t、enumB_t比較出大小，應該是在內部轉型成unsigned int去比(我把first=-0x01去比，結果就變成 False True False了)
    
    A == B     : False
    A >= B     : False
    A <= B     : True
直接拿去跟int比呢?

    A == 0x01  : True
    A == 0x02  : False
最後發現A、A&B、A|B、A+B、A*B大小都是4個byte
    
    sizeof(A) = 4
    sizeof(A&B) = 4
    sizeof(A|B) = 4
    sizeof(A+B) = 4
    sizeof(A*B) = 4
##### 執行結果C++
可以看到enumA_t、enumB_t佔用的大小變成1個byte

    sizeof(enumA_t) = 1
    sizeof(enumB_t) = 1
而用printf轉型成int輸出時，則是輸出在宣告enum時所給定的值，跟C一樣
    
    A = first = 1
    B = third = 3
互相比較大小呢?(如果使用typedef enum: unsigned char，會用unsigned char去比，而且在指定enum成員的值的時候，就不能給負數了喔)

    A == B     : False
    A >= B     : False
    A <= B     : True
拿去跟int比，結果跟C一樣
    
    A == 0x01  : True
    A == 0x02  : False
變數A佔1個byte，跟預期的一樣，可是A&B、A|B、A+B、A*B卻佔了4個byte了，神奇了

    sizeof(A) = 1
    sizeof(A&B) = 4
    sizeof(A|B) = 4
    sizeof(A+B) = 4
    sizeof(A*B) = 4
### MPLAB 的 XC8(1.31)、MCC18(3.46)
---
##### [XC8編譯結果](https://github.com/Lipraxde/enum_test/blob/master/mplab/xc8_result.txt)
基本上沒給出警告，有點慘，不過我自高中裝好XC8以來，很少用過他，所以也有可能是我的設定出了問題
##### [MCC18編譯結果](https://github.com/Lipraxde/enum_test/blob/master/mplab/mcc18_result.txt)
雖然是C，但是給出了大量的type qualifier mismatch in assignment，看來是很注重安全的compiler呢

    D:\git\enum_test\mplab\mcc18\c_enum_test.c:21:Warning [2066] type qualifier mismatch in assignment
    D:\git\enum_test\mplab\mcc18\c_enum_test.c:22:Warning [2066] type qualifier mismatch in assignment
    D:\git\enum_test\mplab\mcc18\c_enum_test.c:26:Warning [2066] type qualifier mismatch in assignment
    D:\git\enum_test\mplab\mcc18\c_enum_test.c:27:Warning [2066] type qualifier mismatch in assignment
    D:\git\enum_test\mplab\mcc18\c_enum_test.c:28:Warning [2066] type qualifier mismatch in assignment
    D:\git\enum_test\mplab\mcc18\c_enum_test.c:29:Warning [2066] type qualifier mismatch in assignment
    D:\git\enum_test\mplab\mcc18\c_enum_test.c:30:Warning [2066] type qualifier mismatch in assignment
    D:\git\enum_test\mplab\mcc18\c_enum_test.c:31:Warning [2066] type qualifier mismatch in assignment
    D:\git\enum_test\mplab\mcc18\c_enum_test.c:32:Warning [2066] type qualifier mismatch in assignment
    D:\git\enum_test\mplab\mcc18\c_enum_test.c:39:Warning [2066] type qualifier mismatch in assignment
    D:\git\enum_test\mplab\mcc18\c_enum_test.c:40:Warning [2066] type qualifier mismatch in assignment
    D:\git\enum_test\mplab\mcc18\c_enum_test.c:41:Warning [2066] type qualifier mismatch in assignment
    D:\git\enum_test\mplab\mcc18\c_enum_test.c:42:Warning [2066] type qualifier mismatch in assignment
    D:\git\enum_test\mplab\mcc18\c_enum_test.c:43:Warning [2066] type qualifier mismatch in assignment
### IAR(8051) 9.10.1 的 C、C++
##### [C的編譯結果](https://github.com/Lipraxde/enum_test/blob/master/iar/c_project/result.txt)
給出了enumerated type mixed with another enumerated type、enumerated type mixed with another type兩種類型的警告，看來也是很注重安全

    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\c_project\main.c 28 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\c_project\main.c 29 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\c_project\main.c 30 
    Warning[Pe188]: enumerated type mixed with another type D:\git\enum_test\iar\c_project\main.c 33 
    Warning[Pe188]: enumerated type mixed with another type D:\git\enum_test\iar\c_project\main.c 34 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\c_project\main.c 35 
    Warning[Pe188]: enumerated type mixed with another type D:\git\enum_test\iar\c_project\main.c 35 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\c_project\main.c 36 
    Warning[Pe188]: enumerated type mixed with another type D:\git\enum_test\iar\c_project\main.c 36 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\c_project\main.c 37 
    Warning[Pe188]: enumerated type mixed with another type D:\git\enum_test\iar\c_project\main.c 37 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\c_project\main.c 38 
    Warning[Pe188]: enumerated type mixed with another type D:\git\enum_test\iar\c_project\main.c 38 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\c_project\main.c 40 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\c_project\main.c 41 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\c_project\main.c 42 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\c_project\main.c 43 
##### [C++的編譯結果](https://github.com/Lipraxde/enum_test/blob/master/iar/cpp_project/result.txt)
IAR的C++ compiler把enumerated type mixed with another enumerated type視為警告，還給出了a value of type "int" cannot be assigned to an entity of type "enumA_t"的error

    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\cpp_project\main.cpp 28 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\cpp_project\main.cpp 29 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\cpp_project\main.cpp 30 
    Error[Pe513]: a value of type "int" cannot be assigned to an entity of type "enumA_t" D:\git\enum_test\iar\cpp_project\main.cpp 33 
    Error[Pe513]: a value of type "int" cannot be assigned to an entity of type "enumA_t" D:\git\enum_test\iar\cpp_project\main.cpp 34 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\cpp_project\main.cpp 35 
    Error[Pe513]: a value of type "int" cannot be assigned to an entity of type "enumA_t" D:\git\enum_test\iar\cpp_project\main.cpp 35 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\cpp_project\main.cpp 36 
    Error[Pe513]: a value of type "int" cannot be assigned to an entity of type "enumA_t" D:\git\enum_test\iar\cpp_project\main.cpp 36 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\cpp_project\main.cpp 37 
    Error[Pe513]: a value of type "int" cannot be assigned to an entity of type "enumA_t" D:\git\enum_test\iar\cpp_project\main.cpp 37 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\cpp_project\main.cpp 38 
    Error[Pe513]: a value of type "int" cannot be assigned to an entity of type "enumA_t" D:\git\enum_test\iar\cpp_project\main.cpp 38 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\cpp_project\main.cpp 40 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\cpp_project\main.cpp 41 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\cpp_project\main.cpp 42 
    Warning[Pa089]: enumerated type mixed with another enumerated type D:\git\enum_test\iar\cpp_project\main.cpp 43 
### 結論
在gcc使用編譯C程式時，enum隱式轉成int，int也可以隱式轉成enum且不會提出警告，而MPLAB MCC18、IAR的C/C++則是會提出警告甚至是error，不太一樣
看來要不要給出警告，是依compiler來決定，這點需要小心。
在編譯C++程式呢，則是可以使用typedef enum: unsigned char來改變enum內部存的方法，也許unsigned char也可以換成其他的type，甚至是自訂的type?












