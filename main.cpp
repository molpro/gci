#include "TreeCIHamiltonian.h"
#include "TreeCIDeterminant.h"
#include "TreeCIString.h"
#include <iostream>
using namespace TreeCI;
//int main(int argc, char *argv[])
int main()
{

    Hamiltonian hh("FCIDUMP");

    TreeCI::Determinant d1(&hh);

    d1.create(3);
    d1.create(-1);

    String s1(&hh);
    int phase;
    unsigned int orbital;
    orbital=1;phase=s1.create(orbital); std::cout << "Add orbital " << orbital << "; phase=" <<phase <<"; string=" <<s1.printable() <<endl;
    orbital=2;phase=s1.create(orbital); std::cout << "Add orbital " << orbital << "; phase=" <<phase <<"; string=" <<s1.printable() <<endl;
    orbital=3;phase=s1.create(orbital); std::cout << "Add orbital " << orbital << "; phase=" <<phase <<"; string=" <<s1.printable() <<endl;
//    orbital=5;phase=s1.create(orbital); std::cout << "Add orbital " << orbital << "; phase=" <<phase <<"; string=" <<s1.printable() <<endl;
    int n=0;
    for (int i=1; i && n<20; n++,i=s1.next()) {
        std::cout << "Advance string=" <<s1.printable() <<endl;
    }

  return 0;
}
