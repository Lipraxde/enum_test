# C和C++的enum測試
---
這篇的目的是想要測試在C/C++中enum的表現，原因是在ptt看到一篇文有關enum的問題(https://www.ptt.cc/bbs/C_and_CPP/M.1504087553.A.A73.html)，想說寫程式練習一下，原本預期gcc的編譯器應該會在我嘗試要把int隱式轉型成自己用enum定義的type時提出警告，結果竟然沒有OAO，我記得以前寫嵌入式的時候會有啊！所以就打算來實驗一下。

測試的編譯器有(基本上是把我有用過的測試一遍)
 * gcc/g++(4.8.1)
 * MPLAB 的 XC8(1.31)、MCC18(3.46)
 * IAR(8051) 9.10.1 的 C、C++
 * KEIL C51

### code解說
---
##### C語言的部分
我宣告了兩個type enumA_t、enumB_t，在宣告中指定了enum裡面成員的值

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

第一步，在main中，用enumA_t、enumB_t分別宣告A、B變數，接著用sizeof看看enumA_t、enumB_t佔多大空間

	enumA_t A;
	enumB_t B;

    printf("sizeof(enumA_t) = %d\n", (int)sizeof(enumA_t));
    printf("sizeof(enumB_t) = %d\n", (int)sizeof(enumB_t));

第二步，將A指定為first，將B指定為third。把兩個變數轉型成int的值、互相比較的boolen、跟int做比較boolen值印出來看看結果

    A = first;
    B = third;
    printf("A = first = %d\n", (int)A);
    printf("B = third = %d\n", (int)B);
    printf("A == B     : %s\n", (A==B) ? "True" : "False");
    printf("A >= B     : %s\n", (A>=B) ? "True" : "False");
    printf("A <= B     : %s\n", (A<=B) ? "True" : "False");
    printf("A == 0x01  : %s\n", (A==0x01) ? "True" : "False");
    printf("A == 0x02  : %s\n", (A==0x02) ? "True" : "False");

第三步，指定int值給A看看，用A、B兩個做運算看看，主要目的在於觀察compiler對於這樣的運算會不會提出警告。

    A = 0x01;
    A = 0x88;
    A = A&B;
    A = A|B;
    A = A+B;
    A = A*B;

最後，把變數A、A跟B做運算的結果的size印出來，看看他們的大小

    printf("sizeof(A) = %d\n", (int)sizeof(A));
    printf("sizeof(A&B) = %d\n", (int)sizeof(A&B));
    printf("sizeof(A|B) = %d\n", (int)sizeof(A|B));
    printf("sizeof(A+B) = %d\n", (int)sizeof(A+B));
    printf("sizeof(A*B) = %d\n", (int)sizeof(A*B));

##### C++的部分
基本上跟C語言的程式差不多，唯一的差別在於使用了C++11的一個語法，指定了enum用的byte數

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


### gcc/g++ 4.8.1
首先先測試C，執行

	~/$make c_example
    gcc -Wall -std=c99 c_enum_test.c -o c_enum_test.exe
	c_enum_test.c: In function 'main':
	c_enum_test.c:28:35: warning: comparison between 'enumA_t' and 'enumB_t' [-Wenum-compare]
     	printf("A == B     : %s\n", (A==B) ? "True" : "False");
                                   ^
	c_enum_test.c:29:35: warning: comparison between 'enumA_t' and 'enumB_t' [-Wenum-compare]
     	printf("A >= B     : %s\n", (A>=B) ? "True" : "False");
                                   ^
	c_enum_test.c:30:35: warning: comparison between 'enumA_t' and 'enumB_t' [-Wenum-compare]
     	printf("A <= B     : %s\n", (A<=B) ? "True" : "False");
                                   ^

gcc只有在我們使用A跟B比較時(28~29行)提出警告，在程式的其他部分沒有提出警告

測試C++的部分，執行

	~/$make cpp_example
    g++ -std=c++11 -Wall -fpermissive cpp_enum_test.cpp -o cpp_enum_test.exe
    cpp_enum_test.cpp: In function 'int main()':
    cpp_enum_test.cpp:28:37: warning: comparison between 'enum enumA_t' and 'enum enumB_t' [-Wenum-compare]
         printf("A == B     : %s\n", (A==B) ? "True" : "False");
                                         ^
    cpp_enum_test.cpp:29:37: warning: comparison between 'enum enumA_t' and 'enum enumB_t' [-Wenum-compare]
         printf("A >= B     : %s\n", (A>=B) ? "True" : "False");
                                         ^
    cpp_enum_test.cpp:30:37: warning: comparison between 'enum enumA_t' and 'enum enumB_t' [-Wenum-compare]
         printf("A <= B     : %s\n", (A<=B) ? "True" : "False");
                                         ^
    cpp_enum_test.cpp:33:7: warning: invalid conversion from 'int' to 'enumA_t' [-fpermissive]
         A = 0x01;
           ^
    cpp_enum_test.cpp:34:7: warning: invalid conversion from 'int' to 'enumA_t' [-fpermissive]
         A = 0x88;
           ^
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







```javascript
$(function(){
  $('div').html('I am a div.');
});
```

This is [on GitHub](https://github.com/jbt/markdown-editor) so let me know if I've b0rked it somewhere.


Props to Mr. Doob and his [code editor](http://mrdoob.com/projects/code-editor/), from which
the inspiration to this, and some handy implementation hints, came.

### Stuff used to make this:

 * [markdown-it](https://github.com/markdown-it/markdown-it) for Markdown parsing
 * [CodeMirror](http://codemirror.net/) for the awesome syntax-highlighted editor
 * [highlight.js](http://softwaremaniacs.org/soft/highlight/en/) for syntax highlighting in output code blocks
 * [js-deflate](https://github.com/dankogai/js-deflate) for gzipping of data to make it fit in URLs
