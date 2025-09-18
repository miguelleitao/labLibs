# labLibs
### Lab workout on libraries

git@github.com:miguelleitao/lablibs.git

## Usage

### Static exec, monolytic
  cat calc0.c
  make calc0
  ls -l calc0
  ./calc0 11 + 55

### Static app, distributed
  cat calc.c
  cat sub.c
  cat sum.c
  make calc1
  ls -l calc1
  ./calc1 11 + 55

### Using static library
  make calc2
  ls -l *.a calc2
  ./calc2 11 + 55

### Full static app
  make calc3
  ls -l calc3
  ./calc3 11 + 55

### Shared library
  make calc4
  ls -l calc4 *.so
  export LD_LIBRARY_PATH=.
  ldd calc4
  ./calc4 11 + 55

### Dynamic loading 
  cat calc_din.c
  make calc5
  ls -l calc5
  ldd calc5
  ./calc5 11 + 55

