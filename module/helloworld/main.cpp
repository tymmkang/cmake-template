#include <iostream>
#include "ParentClass.h"
#include "subdir/ChildClass.h"

int main(void)
{
    ParentClass* pParent = new ParentClass();
    ParentClass* pChild = new ChildClass();

    std::cout << "Hello World!!!" << std::endl;
    pParent->Print();
    pChild->Print();

    delete pParent;
    delete pChild;
    return 0;
}