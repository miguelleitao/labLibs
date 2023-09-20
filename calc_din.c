

#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

#include "calc.h"

int main(int argc, char** argv)
{

  if (argc<3)
  {
	printf("Utilize: %s param1 oper param2\n",argv[0]);
	exit(1);
  }

  float param1, param2;
  float res;
  param1 = (float)atof(argv[1]);
  param2 = (float)atof(argv[3]);
  
  switch (argv[2][0])
  {
	void *handle;
	float (*foper)(float,float);

	case '+':
	  handle = dlopen("liboperacoes.so",RTLD_LAZY);
	  foper = dlsym(handle,"soma");
	  res = (*foper)(param1,param2);
	  dlclose(handle);
	  break;	
        case '-':
          handle = dlopen("liboperacoes.so",RTLD_LAZY);
          foper = dlsym(handle,"sub");
          res = (*foper)(param1,param2);
          dlclose(handle);
	  break;
	default:
	  printf("Operacao %c nao definida.\n", argv[2][0]);
	  exit(2);
 
  }
  printf("Operacao: %f %c %f = %f\n", param1, argv[2][0], param2, res);
  return 0;
}
