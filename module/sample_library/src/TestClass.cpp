#include "../include/sample_library/TestClass.h"
#include <iostream>

namespace SampleLibrary
{
    TestClass::TestClass()
    {

    }

    TestClass::~TestClass()
    {

    }

    void TestClass::Print()
    {
        std::cout << "Hello from TestClass" << std::endl;
    }
}

int Add(int a, int b)
{
    return a + b;
}