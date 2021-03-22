```
#include <stdio.h>
#include <stdlib.h>
#include <execinfo.h>
#include <signal.h>


void dump(int signo)
{
        fprintf(stderr,"catch Segmentation fault!!!\n");
#define SIZE 100
        FILE *fh;
        if(!(fh = fopen("./dbg_msg.log", "w+")))
                exit(0);
        void *buffer[100];
        int nptrs;
        nptrs = backtrace(buffer,SIZE);
        backtrace_symbols_fd(buffer, nptrs, fileno(fh));
        fflush(fh);
        exit(-1);
}


int main(){
   signal(SIGSEGV, &dump); 
   char *p;  
   p = NULL;  
   *p = 'x';  
   printf("%c", *p);  
   return 0;
}
```
打印格式
```
./main[0x4010b9]
/lib64/libc.so.6(+0x36400)[0x7f8d88b87400]
./main[0x401117]
/lib64/libc.so.6(__libc_start_main+0xf5)[0x7f8d88b73555]
./main[0x400db9]
```
打印的是程序的地址，需要用工具把地址转成文件的行号
```
addr2line -e  <带符号库>  <内存地址>
addr2line -e  main  0x4010b9
addr2line -e  main  0x401117
addr2line -e  main  0x400db9
```







