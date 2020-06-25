#include <iostream>
#include "ParentClass.h"
#include "subdir/ChildClass.h"
#include "sample_library/TestClass.h"

int main(void)
{
    ParentClass* pParent = new ParentClass();
    ParentClass* pChild = new ChildClass();

    std::cout << "Hello World!!!" << std::endl;
    pParent->Print();
    pChild->Print();

    std::cout << SampleLibrary::Add(4, 2) << std::endl;
    std::cout << SampleLibrary::Sub(4, 2) << std::endl;
    std::cout << SampleLibrary::Mul(4, 2) << std::endl;
    std::cout << SampleLibrary::Div(4, 2) << std::endl;
    std::cout << SampleLibrary::Mod(4, 2) << std::endl;

    delete pParent;
    delete pChild;
    return 0;
}