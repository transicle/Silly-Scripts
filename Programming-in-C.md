<div align="center">
  <h1>Introduction to Programming in the C Language</h1>
  <p>
    A very heavily summarized edition of the C programming language, for people who are just as lazy, if not even more lazy than me. Feel free to come back to this page any time you'd like to refresh your memory on any topic related to C.
  </p>
</div>

---

### _1_. Introduction and an Explanation of C and Its Purpose
- C is a low-level systems programming language built for direct control over memory and hardware. Its design follows the idea that **"C provides only the essentials... giving the programmer freedom and responsibility"** (Kernighan & Ritchie, 1988).  
- It exposes raw machine operations using pointers, arrays, arithmetic, and manual memory management. Nothing is abstracted.

Example:
```c
int main() {
    int x = 10;
    int *p = &x;
    *p = 20;
}
```

---

### _2_. Types and Data Representation
- C has a compact type system: **integers**, **floats**, **chars**, **pointers**, **arrays**, **structs**, **unions**, and **functions**.  
- As ISO/IEC 9899 states, **“C was designed to map efficiently onto conventional machine architectures.”**  
- Arrays are contiguous memory blocks; structs are field-ordered memory; unions overlap storage; pointers are raw addresses.

Examples:
```c
int a = 5;
char c = 'A';
float f = 3.14;
int arr[3] = {1, 2, 3};
```

Struct:
```c
struct Point {
    int x;
    int y;
};
```

Union:
```c
union Number {
    int i;
    float f;
};
```

---

### _3_. Expressions, Operations, and Evaluation
- C is expression-centric: most operations yield a value.  
- Operators include arithmetic, bitwise, logical, pointer, and assignment forms.  
- Undefined behavior results when rules are violated—intentionally—so compilers can optimize freely.

Valid:
```c
int x = 1;
int y = x + 2;
```

Undefined behavior:
```c
int x = 1;
x = x++;   // illegal: modifies x twice without sequence rules
```

---

### _4_. Control Flow
- Core structures: **if**, **else**, **switch**, **while**, **do**, **for**, **break**, **continue**, **goto**.  
- These mirror machine-level logic, which is why C is often called a “portable assembly language” (Ritchie, 1993).  
- Conditions use int semantics: 0 = false, nonzero = true.

Examples:
```c
if (x > 0) { }
while (x < 10) { x++; }
for (int i = 0; i < 5; i++) { }
switch (x) {
    case 1: break;
    default: break;
}
```

---

### _5_. Functions and Proper Program Structure
- C programs consist of functions with explicit return types and parameter types.  
- Arguments are passed **by value**; pointers simulate references.  
- No overloading, no classes, no generics.  
- The linker resolves external symbols unless `static` is used.

Examples:
```c
int add(int a, int b) {
    return a + b;
}

void setValue(int *p) {
    *p = 42;
}
```

Internal linkage:
```c
static int x = 10;
static int y = 20;
```

---

### _6_. Memory Management and the Runtime Model
- C exposes three storage durations:
  - **automatic** (stack)
  - **static** (global)
  - **dynamic** (heap)
- Manual memory management means no garbage collector, no safety checks, and no automatic cleanup.

Automatic:
```c
int x = 10;
int y = 5;
```

Static:
```c
static int x = 5;
static int y = 10;
```

Dynamic:
```c
int *p = malloc(sizeof(int));
*p = 50;
free(p);
```

---

### _7_. Pointers, Arrays, and Addressing
- Pointers store addresses; arrays decay into pointers when passed to functions.  
- Pointer arithmetic scales by element size and is extremely efficient.  
- Misuse results in undefined behavior.

Array decay:
```c
void printFirst(int *p) {
    printf("%d\n", *p);
}

int arr[3] = {1, 2, 3};
printFirst(arr);
```

Pointer arithmetic:
```c
int arr[3] = {10, 20, 30};
int *p = arr;
p++;    // now points to arr[1]
```

---

### _8_. The Preprocessor
- Runs before compilation.  
- Performs textual substitution only.  
- Handles: `#include`, `#define`, `#ifdef`, etc.  
- It does **not** understand C syntax.

Examples:
```c
#define PI 3.14
#define SQUARE(x) ((x)*(x))
#include <stdio.h>
```

---

### _9_. Compilation Model and the Linking Process
- C builds in four steps:
  1. Preprocessing  
  2. Compilation (C → assembly)  
  3. Assembling  
  4. Linking  
- Each `.c` file is its own translation unit.

Example workflow:
```c
gcc -c file1.c
gcc -c file2.c
gcc file1.o file2.o -o program
```

---

### _10_. C's Standard Library and Environment
- Provides minimal but essential tools: I/O, memory utilities, strings, math, time, and system interfaces.  
- Many real features come from the operating system (POSIX, WinAPI).  
- Strings are null-terminated byte arrays.

Examples:
```c
#include <stdio.h>
printf("Hello\n");
```

```c
#include <string.h>
size_t len = strlen("abc");
```

Raw C string memory:
```c
char name[] = "Lily";
// L i l y \0
```

---
