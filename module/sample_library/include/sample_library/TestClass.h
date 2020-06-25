#ifndef SAMPLE_LIBRARY_TEST_CLASS_H
#define SAMPLE_LIBRARY_TEST_CLASS_H

#include "SampleLibrary.h"

namespace SampleLibrary
{
    class TestClass
    {
    public:

        TestClass();

        ~TestClass();

        void Print();
    };
}

SAMPLE_LIBRARY_API int Add(int a, int b);

#endif
